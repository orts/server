-- Basic --
function getAccountNumberByPlayerName(name)
	local player = Player(name)
	if player ~= nil then
		return player:getAccountId()
	end

	local resultId = db.storeQuery("SELECT `account_id` FROM `players` WHERE `name` = " .. db.escapeString(name))
	if resultId ~= false then
		local accountId = result.getNumber(resultId, "account_id")
		result.free(resultId)
		return accountId
	end
	return 0
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

function isValidMoney(money)
	return isNumber(money) and money > 0 and money < 4294967296
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

function playerExists(name)
	local resultId = db.storeQuery('SELECT `name` FROM `players` WHERE `name` = ' .. db.escapeString(name))
	if resultId then
		result.free(resultId)
		return true
	end
	return false
end

-- Container --
function Container.isContainer(self)
	return true
end

-- Creature --
function Creature.getClosestFreePosition(self, position, extended)
	local usePosition = Position(position)
	local tiles = { usePosition:getTile() }
	local length = extended and 2 or 1

	local tile
	for y = -length, length do
		for x = -length, length do
			if x ~= 0 or y ~= 0 then
				usePosition.x = position.x + x
				usePosition.y = position.y + y

				tile = usePosition:getTile()
				if tile then
					tiles[#tiles + 1] = tile
				end
			end
		end
	end

	for i = 1, #tiles do
		tile = tiles[i]
		if tile:getCreatureCount() == 0 and not tile:hasProperty(CONST_PROP_BLOCKINGANDNOTMOVEABLE) then
			return tile:getPosition()
		end
	end
	return Position()
end

function Creature.getId(self)
	return self.uid
end

function Creature.getMonster(self)
	return self:isMonster() and self or nil
end

function Creature.getPlayer(self)
	return self:isPlayer() and self or nil
end

function Creature.isItem(self)
	return false
end

function Creature.isMonster(self)
	return false
end

function Creature.isNpc(self)
	return false
end

function Creature.isPlayer(self)
	return false
end

function Creature.isTile(self)
	return false
end

-- Game --
if not globalStorageTable then
	globalStorageTable = {}
end

function Game.broadcastMessage(message, messageType)
	if messageType == nil then
		messageType = MESSAGE_STATUS_WARNING
	end

	local players = Game.getPlayers()
	for i = 1, #players do
		players[i]:sendTextMessage(messageType, message)
	end
end

function Game.convertIpToString(ip)
	local band = bit.band
	local rshift = bit.rshift
	return string.format("%d.%d.%d.%d",
		band(ip, 0xFF),
		band(rshift(ip, 8), 0xFF),
		band(rshift(ip, 16), 0xFF),
		rshift(ip, 24)
	)
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

function Game.getSkillType(weaponType)
	if weaponType == WEAPON_CLUB then
		return SKILL_CLUB
	elseif weaponType == WEAPON_SWORD then
		return SKILL_SWORD
	elseif weaponType == WEAPON_AXE then
		return SKILL_AXE
	elseif weaponType == WEAPON_DISTANCE then
		return SKILL_DISTANCE
	elseif weaponType == WEAPON_SHIELD then
		return SKILL_SHIELD
	end
	return SKILL_FIST
end

function Game.getStorageValue(key)
	return globalStorageTable[key] or -1
end

function Game.getReverseDirection(direction)
	if direction == DIRECTION_WEST then
		return DIRECTION_EAST
	elseif direction == DIRECTION_EAST then
		return DIRECTION_WEST
	elseif direction == DIRECTION_NORTH then
		return DIRECTION_SOUTH
	elseif direction == DIRECTION_SOUTH then
		return DIRECTION_NORTH
	elseif direction == DIRECTION_NORTHWEST then
		return DIRECTION_SOUTHEAST
	elseif direction == DIRECTION_NORTHEAST then
		return DIRECTION_SOUTHWEST
	elseif direction == DIRECTION_SOUTHWEST then
		return DIRECTION_NORTHEAST
	elseif direction == DIRECTION_SOUTHEAST then
		return DIRECTION_NORTHWEST
	end
	return DIRECTION_NORTH
end

function Game.setStorageValue(key, value)
	globalStorageTable[key] = value
end

if Game.getStorageValue("stamina") == -1 then
	Game.setStorageValue("stamina", {})
end

-- Item --
function Item.getActionId(self)
	return self.actionid
end

function Item.getId(self)
	return self.itemid
end

function Item.getSubType(self)
	return self.type
end

function Item.getType(self)
	return ItemType(self.itemid)
end

function Item.getUniqueId(self)
	return self.uid
end

function Item.isContainer(self)
	return false
end

function Item.isCreature(self)
	return false
end

function Item.isPlayer(self)
	return false
end

function Item.isTeleport(self)
	return false
end

function Item.isTile(self)
	return false
end

function Item.setDescription(self, description)
	if description ~= '' then
		self:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, description)
	else
		self:removeAttribute(ITEM_ATTRIBUTE_DESCRIPTION)
	end
end

function Item.setText(self, text)
	if text ~= '' then
		self:setAttribute(ITEM_ATTRIBUTE_TEXT, text)
	else
		self:removeAttribute(ITEM_ATTRIBUTE_TEXT)
	end
end

function Item.setUniqueId(self, uniqueId)
	if type(uniqueId) ~= 'number' or uniqueId < 0 or uniqueId > 65535 then
		return false
	end

	self:setAttribute(ITEM_ATTRIBUTE_UNIQUEID, uniqueId)
end

-- ItemType --
local slotBits = {
	[CONST_SLOT_HEAD] = SLOTP_HEAD,
	[CONST_SLOT_NECKLACE] = SLOTP_NECKLACE,
	[CONST_SLOT_BACKPACK] = SLOTP_BACKPACK,
	[CONST_SLOT_ARMOR] = SLOTP_ARMOR,
	[CONST_SLOT_RIGHT] = SLOTP_RIGHT,
	[CONST_SLOT_LEFT] = SLOTP_LEFT,
	[CONST_SLOT_LEGS] = SLOTP_LEGS,
	[CONST_SLOT_FEET] = SLOTP_FEET,
	[CONST_SLOT_RING] = SLOTP_RING,
	[CONST_SLOT_AMMO] = SLOTP_AMMO
}

function ItemType.usesSlot(self, slot)
	return bit.band(self:getSlotPosition(), slotBits[slot] or 0) ~= 0
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
	return self:setStorageValue(STORAGE.blockMovementStorage, allow and -1 or 1)
end

function Player.checkGnomeRank(self)
	local points = self:getStorageValue(STORAGE.BIGFOOTBURDEN.RANK)
	local questProgress = self:getStorageValue(STORAGE.BIGFOOTBURDEN.QUESTLINE)
	if points >= 30 and points < 120 then
		if questProgress == 14 then
			self:setStorageValue(STORAGE.BIGFOOTBURDEN.QUESTLINE, 15)
			self:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
		end
		self:addAchievement('Gnome Little Helper')
	elseif points >= 120 and points < 480 then
		if questProgress == 15 then
			self:setStorageValue(STORAGE.BIGFOOTBURDEN.QUESTLINE, 16)
			self:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
		end
		self:addAchievement('Gnome Friend')
	elseif points >= 480 and points < 1440 then
		if questProgress == 16 then
			self:setStorageValue(STORAGE.BIGFOOTBURDEN.QUESTLINE, 17)
			self:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
		end
		self:addAchievement('Gnomelike')
	elseif points >= 1440 then
		if questProgress == 17 then
			self:setStorageValue(STORAGE.BIGFOOTBURDEN.QUESTLINE, 18)
			self:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
		end
		self:addAchievement('Honorary Gnome')
	end
	return true
end

function Player.depositMoney(self, amount)
	if not self:removeMoney(amount) then
		return false
	end

	self:setBankBalance(self:getBankBalance() + amount)
	return true
end

local foodCondition = Condition(CONDITION_REGENERATION, CONDITIONID_DEFAULT)

function Player.feed(self, food)
	local condition = self:getCondition(CONDITION_REGENERATION, CONDITIONID_DEFAULT)
	if condition then
		condition:setTicks(condition:getTicks() + (food * 1000))
	else
		local vocation = self:getVocation()
		if not vocation then
			return nil
		end

		foodCondition:setTicks(food * 1000)
		foodCondition:setParameter(CONDITION_PARAM_HEALTHGAIN, vocation:getHealthGainAmount())
		foodCondition:setParameter(CONDITION_PARAM_HEALTHTICKS, vocation:getHealthGainTicks() * 1000)
		foodCondition:setParameter(CONDITION_PARAM_MANAGAIN, vocation:getManaGainAmount())
		foodCondition:setParameter(CONDITION_PARAM_MANATICKS, vocation:getManaGainTicks() * 1000)

		self:addCondition(foodCondition)
	end
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

function Player.getClosestFreePosition(self, position, extended)
	if self:getAccountType() >= ACCOUNT_TYPE_GOD then
		return position
	end
	return Creature.getClosestFreePosition(self, position, extended)
end

function Player.getCookiesDelivered(self)
	local storage, amount = {
		STORAGE.WHATAFOOLISHQUEST.COOKIEDELIVERY.SIMONTHEBEGGAR, STORAGE.WHATAFOOLISHQUEST.COOKIEDELIVERY.MARKWIN, STORAGE.WHATAFOOLISHQUEST.COOKIEDELIVERY.ARIELLA,
		STORAGE.WHATAFOOLISHQUEST.COOKIEDELIVERY.HAIRYCLES, STORAGE.WHATAFOOLISHQUEST.COOKIEDELIVERY.DJINN, STORAGE.WHATAFOOLISHQUEST.COOKIEDELIVERY.AVARTAR,
		STORAGE.WHATAFOOLISHQUEST.COOKIEDELIVERY.ORCKING, STORAGE.WHATAFOOLISHQUEST.COOKIEDELIVERY.LORBAS, STORAGE.WHATAFOOLISHQUEST.COOKIEDELIVERY.WYDA,
		STORAGE.WHATAFOOLISHQUEST.COOKIEDELIVERY.HJAERN
	}, 0
	for i = 1, #storage do
		if self:getStorageValue(storage[i]) == 1 then
			amount = amount + 1
		end
	end
	return amount
end

function Player.getDepotItems(self, depotId)
	return self:getDepotChest(depotId, true):getItemHoldingCount()
end

function Player.getLossPercent(self)
	local lossPercent = {
		[0] = 100,
		[1] = 70,
		[2] = 45,
		[3] = 25,
		[4] = 10,
		[5] = 0
	}

	return lossPercent[self:getBlessings()]
end

function Player.hasAllowMovement(self)
	return self:getStorageValue(STORAGE.blockMovementStorage) ~= 1
end

function Player.hasRookgaardShield(self)
	-- Wooden Shield, Studded Shield, Brass Shield, Plate Shield, Copper Shield
	return self:getItemCount(2512) > 0
			or self:getItemCount(2526) > 0
			or self:getItemCount(2511) > 0
			or self:getItemCount(2510) > 0
			or self:getItemCount(2530) > 0
end

function Player.isDruid(self)
	return isInArray({2, 6}, self:getVocation():getId())
end

function Player.isKnight(self)
	return isInArray({4, 8}, self:getVocation():getId())
end

function Player.isPaladin(self)
	return isInArray({3, 7}, self:getVocation():getId())
end

function Player.isMage(self)
	return isInArray({1, 2, 5, 6}, self:getVocation():getId())
end

function Player.isSorcerer(self)
	return isInArray({1, 5}, self:getVocation():getId())
end

function Player.isPremium(self)
	return self:getPremiumDays() > 0 or configManager.getBoolean(configKeys.FREE_PREMIUM)
end

function Player.isPromoted(self)
	local vocation = self:getVocation()
	local promotedVocation = vocation:getPromotion()
	promotedVocation = promotedVocation and promotedVocation:getId() or 0

	return promotedVocation == 0 and vocation:getId() ~= promotedVocation
end

function Player.isUsingOtClient(self)
	return self:getClient().os >= CLIENTOS_OTCLIENT_LINUX
end

function Player.sendCancelMessage(self, message)
	if type(message) == "number" then
		message = Game.getReturnMessage(message)
	end
	return self:sendTextMessage(MESSAGE_STATUS_SMALL, message)
end

function Player.sendExtendedOpcode(self, opcode, buffer)
	if not self:isUsingOtClient() then
		return false
	end

	local networkMessage = NetworkMessage()
	networkMessage:addByte(0x32)
	networkMessage:addByte(opcode)
	networkMessage:addString(buffer)
	networkMessage:sendToPlayer(self)
	networkMessage:delete()
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

function Player.withdrawMoney(self, amount)
	local balance = self:getBankBalance()
	if amount > balance or not self:addMoney(amount) then
		return false
	end

	self:setBankBalance(balance - amount)
	return true
end

-- Position --
Position.directionOffset = {
	[DIRECTION_NORTH] = {x = 0, y = -1},
	[DIRECTION_EAST] = {x = 1, y = 0},
	[DIRECTION_SOUTH] = {x = 0, y = 1},
	[DIRECTION_WEST] = {x = -1, y = 0},
	[DIRECTION_SOUTHWEST] = {x = -1, y = 1},
	[DIRECTION_SOUTHEAST] = {x = 1, y = 1},
	[DIRECTION_NORTHWEST] = {x = -1, y = -1},
	[DIRECTION_NORTHEAST] = {x = 1, y = -1}
}

function Position:getNextPosition(direction, steps)
	local offset = Position.directionOffset[direction]
	if offset then
		steps = steps or 1
		self.x = self.x + offset.x * steps
		self.y = self.y + offset.y * steps
	end
end

function Position.getTile(self)
	return Tile(self)
end

function Position:moveUpstairs()
	local isWalkable = function (position)
		local tile = Tile(position)
		if not tile then
			return false
		end

		local ground = tile:getGround()
		if not ground or ground:hasProperty(CONST_PROP_BLOCKSOLID) then
			return false
		end

		local items = tile:getItems()
		for i = 1, tile:getItemCount() do
			local item = items[i]
			local itemType = item:getType()
			if itemType:getType() ~= ITEM_TYPE_MAGICFIELD and not itemType:isMovable() and item:hasProperty(CONST_PROP_BLOCKSOLID) then
				return false
			end
		end
		return true
	end

	local swap = function (lhs, rhs)
		lhs.x, rhs.x = rhs.x, lhs.x
		lhs.y, rhs.y = rhs.y, lhs.y
		lhs.z, rhs.z = rhs.z, lhs.z
	end

	self.z = self.z - 1

	local defaultPosition = self + Position.directionOffset[DIRECTION_SOUTH]
	if not isWalkable(defaultPosition) then
		for direction = DIRECTION_NORTH, DIRECTION_NORTHEAST do
			if direction == DIRECTION_SOUTH then
				direction = DIRECTION_WEST
			end

			local position = self + Position.directionOffset[direction]
			if isWalkable(position) then
				swap(self, position)
				return self
			end
		end
	end
	swap(self, defaultPosition)
	return self
end

-- Teleport --
function Teleport.isTeleport(self)
	return true
end

-- Tile --
function Tile.isCreature(self)
	return false
end

function Tile.isHouse(self)
	local house = self:getHouse()
	return not not house
end

function Tile.isItem(self)
	return false
end

function Tile.isPz(self)
	return self:hasFlag(TILESTATE_PROTECTIONZONE)
end

function Tile.isTile(self)
	return true
end

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
