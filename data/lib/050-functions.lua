-- Basic --
function playerExists(name)
	local resultId = db.storeQuery('SELECT `name` FROM `players` WHERE `name` = ' .. db.escapeString(name))
	if resultId then
		result.free(resultId)
		return true
	end
	return false
end

function isValidMoney(money)
	return isNumber(money) and money > 0 and money < 4294967296
end

function getMoneyCount(string)
	local b, e = string:find("%d+")
	local money = b and e and tonumber(string:sub(b, e)) or -1
	if isValidMoney(money) then
		return money
	end
	return -1
end

function getMoneyWeight(money)
	local gold = money
	local crystal = math.floor(gold / 10000)
	gold = gold - crystal * 10000
	local platinum = math.floor(gold / 100)
	gold = gold - platinum * 100
	return (ItemType(2160):getWeight() * crystal) + (ItemType(2152):getWeight() * platinum) + (ItemType(2148):getWeight() * gold)
end

function getRealTime()
	local hours = tonumber(os.date("%H", os.time()))
	local minutes = tonumber(os.date("%M", os.time()))

	if hours < 10 then
		hours = '0' .. hours
	end
	if minutes < 10 then
		minutes = '0' .. minutes
	end
	return hours .. ':' .. minutes
end

function getRealDate()
	local month = tonumber(os.date("%m", os.time()))
	local day = tonumber(os.date("%d", os.time()))

	if month < 10 then
		month = '0' .. month
	end
	if day < 10 then
		day = '0' .. day
	end
	return day .. '/' .. month
end

function getAccountNumberByPlayerName(name)
	local player = Player(name)
	if player ~= nil then
		return player:getAccountId()
	end

	local resultId = db.storeQuery("SELECT `account_id` FROM `players` WHERE `name` = " .. db.escapeString(name))
	if resultId ~= false then
		local accountId = result.getDataInt(resultId, "account_id")
		result.free(resultId)
		return accountId
	end
	return 0
end

function iterateArea(func, from, to)
	for z = from.z, to.z do
		for y = from.y, to.y do
			for x = from.x, to.x do
				func(Position(x, y, z))
			end
		end
	end
end

-- Game --
function Game.getPlayersByIPAddress(ip, mask)
	if not mask then mask = 0xFFFFFFFF end
	local masked = bit.band(ip, mask)
	local result = {}
	local players, player = Game.getPlayers()
	for i = 1, #players do
		player = players[i]
		if bit.band(player:getIp(), mask) == masked then
			result[#result + 1] = player
		end
	end
	return result
end

function Game.getPlayersByAccountNumber(accountNumber)
	local result = {}
	local players, player = Game.getPlayers()
	for i = 1, #players do
		player = players[i]
		if player:getAccountId() == accountNumber then
			result[#result + 1] = player
		end
	end
	return result
end

function Game.getHouseByPlayerGUID(playerGUID)
	local houses, house = Game.getHouses()
	for i = 1, #houses do
		house = houses[i]
		if house:getOwnerGuid() == playerGUID then
			return house
		end
	end
	return nil
end


-- Item --
function Item.setText(self, text)
	if text ~= '' then
		self:setAttribute(ITEM_ATTRIBUTE_TEXT, text)
	else
		self:removeAttribute(ITEM_ATTRIBUTE_TEXT)
	end
end

function Item.setDescription(self, description)
	if description ~= '' then
		self:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, description)
	else
		self:removeAttribute(ITEM_ATTRIBUTE_DESCRIPTION)
	end
end

function Item.setUniqueId(self, uniqueId)
	if type(uniqueId) ~= 'number' or uniqueId < 0 or uniqueId > 65535 then
		return false
	end

	self:setAttribute(ITEM_ATTRIBUTE_UNIQUEID, uniqueId)
end

-- Party --
function Party.getVocationCount(self)
	local count = 1
	local bits = bit.lshift(1, self:getLeader():getVocation():getBase():getId())

	local members = self:getMembers()
	for i = 1, #members do
		local vocationId = members[i]:getVocation():getBase():getId()
		local vocation = bit.lshift(1, vocationId)
		if bit.band(bits, vocation) == vocation then
			return false
		end

		bits = bit.bor(bits, bit.lshift(1, vocationId))
		count = count + 1
	end

	return count
end


-- Player --
function Player.allowMovement(self, allow)
	return self:setStorageValue(Storage.blockMovementStorage, allow and -1 or 1)
end

function Player.hasAllowMovement(self)
	return self:getStorageValue(Storage.blockMovementStorage) ~= 1
end

function Player.withdrawMoney(self, amount)
	local balance = self:getBankBalance()
	if amount > balance or not self:addMoney(amount) then
		return false
	end

	self:setBankBalance(balance - amount)
	return true
end

function Player.depositMoney(self, amount)
	if not self:removeMoney(amount) then
		return false
	end

	self:setBankBalance(self:getBankBalance() + amount)
	return true
end

function Player.transferMoneyTo(self, target, amount)
	local balance = self:getBankBalance()
	if amount > balance then
		return false
	end

	local targetPlayer = Player(target)
	if targetPlayer then
		targetPlayer:setBankBalance(targetPlayer:getBankBalance() + amount)
	else
		if not playerExists(target) then
			return false
		end
		db.query("UPDATE `players` SET `balance` = `balance` + '" .. amount .. "' WHERE `name` = " .. db.escapeString(target))
	end

	self:setBankBalance(self:getBankBalance() - amount)
	return true
end

function Player.getBlessings(self)
	local blessings = 0
	for i = 1, 5 do
		if self:hasBlessing(i) then
			blessings = blessings + 1
		end
	end
	return blessings
end

function Player.isMage(self)
	return isInArray({1, 2, 5, 6}, self:getVocation():getId())
end

function Player.checkGnomeRank(self)
	if self:getStorageValue(Storage.BigfootBurden.Rank) >= 30 and self:getStorageValue(Storage.BigfootBurden.Rank) < 120 then
		if self:getStorageValue(Storage.BigfootBurden.QuestLine) == 14 then
			self:setStorageValue(Storage.BigfootBurden.QuestLine, 15)
			self:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
		end
		self:addAchievement('Gnome Little Helper')
	elseif self:getStorageValue(Storage.BigfootBurden.Rank) >= 120 and self:getStorageValue(Storage.BigfootBurden.Rank) < 480 then
		if self:getStorageValue(Storage.BigfootBurden.QuestLine) == 15 then
			self:setStorageValue(Storage.BigfootBurden.QuestLine, 16)
			self:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
		end
		self:addAchievement('Gnome Friend')
	elseif self:getStorageValue(Storage.BigfootBurden.Rank) >= 480 and self:getStorageValue(Storage.BigfootBurden.Rank) < 1440 then
		if self:getStorageValue(Storage.BigfootBurden.QuestLine) == 16 then
			self:setStorageValue(Storage.BigfootBurden.QuestLine, 17)
			self:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
		end
		self:addAchievement('Gnomelike')
	elseif self:getStorageValue(Storage.BigfootBurden.Rank) >= 1440 then
		if self:getStorageValue(Storage.BigfootBurden.QuestLine) == 17 then
			self:setStorageValue(Storage.BigfootBurden.QuestLine, 18)
			self:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
		end
		self:addAchievement('Honorary Gnome')
	end
	return true
end

function Player.getCookiesDelivered(self)
	local storage, amount = {
		Storage.WhatAFoolishQuest.CookieDelivery.SimonTheBeggar, Storage.WhatAFoolishQuest.CookieDelivery.Markwin, Storage.WhatAFoolishQuest.CookieDelivery.Ariella,
		Storage.WhatAFoolishQuest.CookieDelivery.Hairycles, Storage.WhatAFoolishQuest.CookieDelivery.Djinn, Storage.WhatAFoolishQuest.CookieDelivery.AvarTar,
		Storage.WhatAFoolishQuest.CookieDelivery.OrcKing, Storage.WhatAFoolishQuest.CookieDelivery.Lorbas, Storage.WhatAFoolishQuest.CookieDelivery.Wyda,
		Storage.WhatAFoolishQuest.CookieDelivery.Hjaern
	}, 0
	for i = 1, #storage do
		if self:getStorageValue(storage[i]) == 1 then
			amount = amount + 1
		end
	end
	return amount
end

function Player.isPromoted(self)
	local vocation = self:getVocation()
	local promotedVocation = vocation:getPromotion()
	promotedVocation = promotedVocation and promotedVocation:getId() or 0

	return promotedVocation == 0 and vocation:getId() ~= promotedVocation
end

function Player.hasRookgaardShield(self)
	-- Wooden Shield, Studded Shield, Brass Shield, Plate Shield, Copper Shield
	return self:getItemCount(2512) > 0
			or self:getItemCount(2526) > 0
			or self:getItemCount(2511) > 0
			or self:getItemCount(2510) > 0
			or self:getItemCount(2530) > 0
end

-- Tile --
function Tile.relocateTo(self, toPosition, pushMove, monsterPosition)
	if self:getPosition() == toPosition then
		return false
	end

	if not Tile(toPosition) then
		return false
	end

	for i = self:getThingCount() - 1, 0, -1 do
		local thing = self:getThing(i)
		if thing then
			if thing:isItem() then
				if ItemType(thing.itemid):isMovable() then
					thing:moveTo(toPosition)
				end
			elseif thing:isCreature() then
				if monsterPosition and thing:isMonster() then
					thing:teleportTo(monsterPosition, pushMove)
				else
					thing:teleportTo(toPosition, pushMove)
				end
			end
		end
	end
	return true
end

function Tile.isPz(self)
	return self:hasFlag(TILESTATE_PROTECTIONZONE)
end

function Tile.isHouse(self)
	local house = self:getHouse()
	return house and true or false
end

-- Vocation --
function Vocation.getBase(self)
	local demotion = self:getDemotion()
	while demotion do
		local tmp = demotion:getDemotion()
		if not tmp then
			return demotion
		end
		demotion = tmp
	end
	return self
end
