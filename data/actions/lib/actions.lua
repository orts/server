local holeId = {
	294, 369, 370, 383, 392, 408, 409, 410, 427, 428, 430, 462, 469, 470, 482,
	484, 485, 489, 924, 3135, 3136, 7933, 7938, 8170, 8286, 8285, 8284, 8281,
	8280, 8279, 8277, 8276, 8567, 8585, 8596, 8595, 8249, 8250, 8251,
	8252, 8253, 8254, 8255, 8256, 8592, 8972, 9606, 9625, 13190, 14461, 19519, 21536
}

local holes = {468, 481, 483, 7932}

local JUNGLE_GRASS = { 2782, 3985, 19433 }
local WILD_GROWTH = { 1499, 11099 }

local fruits = {2673, 2674, 2675, 2676, 2677, 2678, 2679, 2680, 2681, 2682, 2684, 2685, 5097, 8839, 8840, 8841}

local lava = {
	Position(32808, 32336, 11),
	Position(32809, 32336, 11),
	Position(32810, 32336, 11),
	Position(32808, 32334, 11),
	Position(32807, 32334, 11),
	Position(32807, 32335, 11),
	Position(32807, 32336, 11),
	Position(32807, 32337, 11),
	Position(32806, 32337, 11),
	Position(32805, 32337, 11),
	Position(32805, 32338, 11),
	Position(32805, 32339, 11),
	Position(32806, 32339, 11),
	Position(32806, 32338, 11),
	Position(32807, 32338, 11),
	Position(32808, 32338, 11),
	Position(32808, 32337, 11),
	Position(32809, 32337, 11),
	Position(32810, 32337, 11),
	Position(32811, 32337, 11),
	Position(32811, 32338, 11),
	Position(32806, 32338, 11),
	Position(32810, 32338, 11),
	Position(32810, 32339, 11),
	Position(32809, 32339, 11),
	Position(32809, 32338, 11),
	Position(32811, 32336, 11),
	Position(32811, 32335, 11),
	Position(32810, 32335, 11),
	Position(32809, 32335, 11),
	Position(32808, 32335, 11),
	Position(32809, 32334, 11),
	Position(32809, 32333, 11),
	Position(32810, 32333, 11),
	Position(32811, 32333, 11),
	Position(32806, 32338, 11),
	Position(32810, 32334, 11),
	Position(32811, 32334, 11),
	Position(32812, 32334, 11),
	Position(32813, 32334, 11),
	Position(32814, 32334, 11),
	Position(32812, 32333, 11),
	Position(32810, 32334, 11),
	Position(32812, 32335, 11),
	Position(32813, 32335, 11),
	Position(32814, 32335, 11),
	Position(32814, 32333, 11),
	Position(32813, 32333, 11)
}

local function revertItem(position, itemId, transformId)
	local item = Tile(position):getItemById(itemId)
	if item then
		item:transform(transformId)
	end
end

local function removeRemains(toPosition)
	local item = Tile(toPosition):getItemById(2248)
	if item then
		item:remove()
	end
end

local function revertCask(position)
	local caskItem = Tile(position):getItemById(2249)
	if caskItem then
		caskItem:transform(5539)
		position:sendMagicEffect(CONST_ME_MAGIC_GREEN)
	end
end

function onDestroyItem(player, item, fromPosition, target, toPosition, isHotkey)
	if not (target or target:isItem()) then
		return false
	end

	if target:hasAttribute(ITEM_ATTRIBUTE_UNIQUEID) or target:hasAttribute(ITEM_ATTRIBUTE_ACTIONID) then
		return false
	end

	local targetId = target.itemid

	--chest,crate,barrel...
	if (targetId >= 1724 and targetId <= 1741) or (targetId >= 2581 and targetId <= 2588) or targetId == 1770 or targetId == 2098 or targetId == 1774 or targetId == 1775 or targetId == 2064 or (targetId >= 1747 and targetId <= 1753) or (targetId >= 1714 and targetId <= 1717) or (targetId >= 1650 and targetId <= 1653) or (targetId >= 1666 and targetId <= 1677) or (targetId >= 1614 and targetId <= 1616) or (targetId >= 3813 and targetId <= 3820) or (targetId >= 3807 and targetId <= 3810) or (targetId >= 2080 and targetId <= 2085) or (targetId >= 2116 and targetId <= 2119) or targetId == 2094 or targetId == 2095 or targetId == 1619 or targetId == 2602 or targetId == 3805 or targetId == 3806 then
		if math.random(7) == 1 then
			if targetId == 1738 or targetId == 1739 or (targetId >= 2581 and targetId <= 2588) or targetId == 1770 or targetId == 2098 or targetId == 1774 or targetId == 1775 or targetId == 2064 then
				Game.createItem(2250, 1, toPosition)
			elseif (targetId >= 1747 and targetId <= 1749) or targetId == 1740 then
				Game.createItem(2251, 1, toPosition)
			elseif (targetId >= 1714 and targetId <= 1717) then
				Game.createItem(2252, 1, toPosition)
			elseif (targetId >= 1650 and targetId <= 1653) or (targetId >= 1666 and targetId <= 1677) or (targetId >= 1614 and targetId <= 1616) or (targetId >= 3813 and targetId <= 3820) or (targetId >= 3807 and targetId <= 3810) then
				Game.createItem(2253, 1, toPosition)
			elseif (targetId >= 1724 and targetId <= 1737) or (targetId >= 2080 and targetId <= 2085) or (targetId >= 2116 and targetId <= 2119) or targetId == 2094 or targetId == 2095 then
				Game.createItem(2254, 1, toPosition)
			elseif (targetId >= 1750 and targetId <= 1753) or targetId == 1619 or targetId == 1741 then
				Game.createItem(2255, 1, toPosition)
			elseif targetId == 2602 then
				Game.createItem(2257, 1, toPosition)
			elseif isInArray({3805, 3806}, targetId) then
				Game.createItem(2259, 1, toPosition)
			end
			target:remove(1)
		end
		toPosition:sendMagicEffect(CONST_ME_POFF)

	--large amphora
	elseif targetId == 4996 then
		if math.random(3) == 1 then
			target:transform(4997)
			target:decay()
		end
		toPosition:sendMagicEffect(CONST_ME_POFF)

	--spiderweb
	elseif isInArray({7538, 7539}, targetId) then
		if math.random(7) == 1 then
			target:transform(targetId == 7538 and 7544 or 7545)
			target:decay()
		end
		toPosition:sendMagicEffect(CONST_ME_POFF)

	--spideregg AgainstTheSpiderCult
	elseif targetId == 7585 then
		local storage = player:getStorageValue(Storage.TibiaTales.AgainstTheSpiderCult)
		if storage >= 1 and storage < 5 then
			player:setStorageValue(Storage.TibiaTales.AgainstTheSpiderCult, math.max(1, storage) + 1)
		end
		Game.createMonster("giant spider", Position(33181, 31869, 12))
		target:transform(7586)
		target:decay()
		toPosition:sendMagicEffect(CONST_ME_POFF)

	--wooden bar
	elseif isInArray({3798, 3799}, targetId) then
		if math.random(3) == 1 then
			target:transform(targetId == 3798 and 3959 or 3958)
			target:decay()
		end
		toPosition:sendMagicEffect(CONST_ME_POFF)
	else
		return false
	end

	return true
end

function onUseRope(player, item, fromPosition, target, toPosition, isHotkey)
	if toPosition.x == CONTAINER_POSITION then
		return false
	end

	local targetId = target.itemid

	local tile = Tile(toPosition)
	local ground = tile:getGround()
	if ground and isInArray(ropeSpots, ground.itemid) or tile:getItemById(14435) then
		player:teleportTo(toPosition:moveUpstairs())
		if targetId == 8592 then
			if player:getStorageValue(Storage.RookgaardTutorialIsland.tutorialHintsStorage) < 22 then
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have successfully used your rope to climb out of the hole. Congratulations! Now continue to the east.')
			end
		end
		return true
	elseif isInArray(holeId, targetId) then
		toPosition.z = toPosition.z + 1
		tile = Tile(toPosition)
		if tile then
			local thing = tile:getTopVisibleThing()
			if thing:isItem() and thing:getType():isMovable() then
				return thing:moveTo(toPosition:moveUpstairs())
			elseif thing:isCreature() and thing:isPlayer() then
				return thing:teleportTo(toPosition:moveUpstairs())
			end
		end

		player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
		return true
	end

	return false
end

function onUseShovel(player, item, fromPosition, target, toPosition, isHotkey)
	local targetId, targetActionId = target.itemid, target.actionid
	if isInArray(holes, targetId) then
		target:transform(targetId + 1)
		target:decay()

	elseif isInArray({231, 9059}, targetId) then
		local rand = math.random(100)
		if target.actionid == 100 and rand <= 20 then
			target:transform(489)
			target:decay()
		elseif rand == 1 then
			Game.createItem(2159, 1, toPosition)
		elseif rand > 95 then
			Game.createMonster("Scarab", toPosition)
		end
		toPosition:sendMagicEffect(CONST_ME_POFF)

	-- Wrath of the emperor quest
	elseif targetId == 351 and targetActionId == 8024 then
		player:addItem(12297, 1)
		player:say("You dig out a handful of earth from this sacred place.", TALKTYPE_MONSTER_SAY)

	-- RookgaardTutorialIsland
	elseif targetId == 8579 and player:getStorageValue(Storage.RookgaardTutorialIsland.tutorialHintsStorage) < 20 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You dug a hole! Walk onto it as long as it is open to jump down into the forest cave.')
		player:setStorageValue(Storage.RookgaardTutorialIsland.tutorialHintsStorage, 19)
		Position(32070, 32266, 7):sendMagicEffect(CONST_ME_TUTORIALARROW)
		Position(32070, 32266, 7):sendMagicEffect(CONST_ME_TUTORIALSQUARE)
		target:transform(469)
		addEvent(revertItem, 30 * 1000, toPosition, 469, 8579)

	-- Gravedigger Quest
	elseif targetActionId == 4654 and player:getStorageValue(Storage.GravediggerOfDrefia.Mission49) == 1 and player:getStorageValue(Storage.GravediggerOfDrefia.Mission50) < 1 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You found a piece of the scroll. You pocket it quickly.')
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		player:addItem(21250, 1)
		player:setStorageValue(Storage.GravediggerOfDrefia.Mission50, 1)

	elseif targetActionId == 4668 and player:getStorageValue(Storage.GravediggerOfDrefia.Mission67) == 1 and player:getStorageValue(Storage.GravediggerOfDrefia.Mission68) < 1 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'A torn scroll piece emerges. Probably gnawed off by rats.')
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		player:addItem(21250, 1)
		player:setStorageValue(Storage.GravediggerOfDrefia.Mission68, 1)

	-- ???
	elseif targetActionId == 50118 then
		local wagonItem = Tile(Position(32717, 31492, 11)):getItemById(7131)
		if wagonItem then
			Game.createItem(8749, 1, wagonItem:getPosition())
			toPosition:sendMagicEffect(CONST_ME_POFF)
		end

	elseif targetId == 8749 then
		local coalItem = Tile(Position(32699, 31492, 11)):getItemById(8749)
		if coalItem then
			coalItem:remove()
			toPosition:sendMagicEffect(CONST_ME_POFF)

			local crucibleItem = Tile(Position(32699, 31494, 11)):getItemById(8642)
			if crucibleItem then
				crucibleItem:setActionId(50119)
			end
		end

	elseif isInArray({9632, 20230}, targetId) then
		if player:getStorageValue(Storage.SwampDiggingTimeout) >= os.time() then
			return false
		end

		local config = { {from = 1, to = 39, itemId = 2817}, {from = 40, to = 79, itemId = 2145}, {from = 80, to = 100, itemId = 20138} }
		local chance = math.random(100)

		for i = 1, #config do
			local randItem = config[i]
			if chance >= randItem.from and chance <= randItem.to then
				player:addItem(randItem.itemId, 1)
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You dug up a ' .. ItemType(randItem.itemId):getName() .. '.')
				player:setStorageValue(Storage.SwampDiggingTimeout, os.time() + 604800)
				toPosition:sendMagicEffect(CONST_ME_GREEN_RINGS)
				break
			end
		end

	elseif targetId == 103 and targetActionId == 4205 then
		if player:getStorageValue(Storage.TibiaTales.IntoTheBonePit) ~= 1 then
			return false
		end

		local remains = Game.createItem(2248, 1, toPosition)
		if remains then
			remains:setActionId(4206)
		end
		toPosition:sendMagicEffect(CONST_ME_HITAREA)
		addEvent(removeRemains, 60000, toPosition)

	elseif targetId == 22674 then
		if not player:removeItem(5091, 1) then
			return false
		end

		target:transform(5731)
		target:decay()
		toPosition:sendMagicEffect(CONST_ME_POFF)
	else
		return false
	end

	return true
end

function onUsePick(player, item, fromPosition, target, toPosition, isHotkey)
	local targetId, targetActionId = target.itemid, target.actionid
	if isInArray({354, 355}, targetId) and (target:hasAttribute(ITEM_ATTRIBUTE_UNIQUEID) or target:hasAttribute(ITEM_ATTRIBUTE_ACTIONID)) then
		target:transform(392)
		target:decay()
		toPosition:sendMagicEffect(CONST_ME_POFF)

	elseif targetId == 7200 then
		target:transform(7236)
		target:decay()
		toPosition:sendMagicEffect(CONST_ME_HITAREA)

	--The Ice Islands Quest, Nibelor 1: Breaking the Ice
	elseif targetId == 3621 and targetActionId == 12026 then
		local missionProgress, pickAmount = player:getStorageValue(Storage.TheIceIslands.Mission02), player:getStorageValue(Storage.TheIceIslands.PickAmount)
		if missionProgress < 1 or pickAmount >= 3 or player:getStorageValue(Storage.TheIceIslands.Questline) ~= 3 then
			return false
		end

		player:setStorageValue(Storage.TheIceIslands.PickAmount, math.max(0, pickAmount) + 1)
		player:setStorageValue(Storage.TheIceIslands.Mission02, missionProgress + 1) -- Questlog The Ice Islands Quest, Nibelor 1: Breaking the Ice

		if pickAmount >= 2 then
			player:setStorageValue(Storage.TheIceIslands.Questline, 4)
			player:setStorageValue(Storage.TheIceIslands.Mission02, 4) -- Questlog The Ice Islands Quest, Nibelor 1: Breaking the Ice
		end

		local crackItem = Tile(toPosition):getItemById(7185)
		if crackItem then
			crackItem:transform(7186)
			addEvent(revertItem, 60 * 1000, toPosition, 7186, 7185)
		end

		local chakoyas = {"chakoya toolshaper", "chakoya tribewarden", "chakoya windcaller"}
		Game.createMonster(chakoyas[math.random(#chakoyas)], toPosition)
		toPosition:sendMagicEffect(CONST_ME_TELEPORT)

	elseif targetId == 1304 then
		--The Pits of Inferno Quest
		if target.uid == 1022 then
			for i = 1, #lava do
				Game.createItem(5815, 1, lava[i])
			end
			target:transform(2256)
			toPosition:sendMagicEffect(CONST_ME_SMOKE)

		-- naginata quest
		elseif targetActionId == 50058 then
			local stoneStorage = Game.getStorageValue(GlobalStorage.NaginataStone)
			if stoneStorage ~= 5 then
				Game.setStorageValue(GlobalStorage.NaginataStone, math.max(0, stoneStorage) + 1)
			elseif stoneStorage == 5 then
				target:remove()
				Game.setStorageValue(GlobalStorage.NaginataStone)
			end

			toPosition:sendMagicEffect(CONST_ME_POFF)
			doTargetCombatHealth(0, player, COMBAT_PHYSICALDAMAGE, -31, -39, CONST_ME_NONE)
		end

	 --The Banshee Quest
	elseif targetId == 9025 and targetActionId == 101 then
		target:transform(392)
		target:decay()
		toPosition:sendMagicEffect(CONST_ME_POFF)

	 -- The Hidden City of Beregar Quest
	elseif targetActionId == 50090 then
		if player:getStorageValue(Storage.hiddenCityOfBeregar.WayToBeregar) == 1 then
			player:teleportTo(Position(32566, 31338, 10))
		end

	elseif targetActionId == 50114 then
		if Tile(Position(32617, 31513, 9)):getItemById(1027) and Tile(Position(32617, 31514, 9)):getItemById(1205) then
			local rubbleItem = Tile(Position(32619, 31514, 9)):getItemById(5709)
			if rubbleItem then
				rubbleItem:remove()
			end
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You can't remove this pile since it's currently holding up the tunnel.")
		end

	-- Pythius The Rotten (Firewalker Boots)
	elseif targetActionId == 50127 then
		if player:getStorageValue(Storage.QuestChests.FirewalkerBoots) == 1 then
			return false
		end

		target:remove()

		local stoneItem = Tile(toPosition):getItemById(1304)
		if stoneItem then
			stoneItem:remove()
		end

		iterateArea(
			function(position)
				local groundItem = Tile(position):getGround()
				if groundItem and groundItem.itemid == 598 then
					groundItem:transform(5815)
				end
			end,
			Position(32550, 31373, 15),
			Position(32551, 31379, 15)
		)
		iterateArea(
			function(position)
				position:sendMagicEffect(CONST_ME_POFF)
			end,
			Position(32551, 31374, 15),
			Position(32551, 31379, 15)
		)

		local portal = Game.createItem(1387, 1, Position(32551, 31376, 15))
		if portal then
			portal:setActionId(50126)
		end

	-- Wrath of the emperor quest
	elseif targetId == 12296 then
		player:addItem(12295, 1)
		player:say("The cracked part of the table lets you cut out a large chunk of wood with your pick.", TALKTYPE_MONSTER_SAY)

	elseif targetId == 22671 then
		target:transform(392)
		target:decay()
	else
		return false
	end

	return true
end

function onUseMachete(player, item, fromPosition, target, toPosition, isHotkey)
	local targetId = target.itemid
	if isInArray(JUNGLE_GRASS, targetId) then
		target:transform(targetId == 19433 and 19431 or targetId - 1)
		target:decay()
		return true
	end

	if isInArray(WILD_GROWTH, targetId) then
		toPosition:sendMagicEffect(CONST_ME_POFF)
		target:remove()
		return true
	end

	return onDestroyItem(player, item, fromPosition, target, toPosition, isHotkey)
end

function onUseCrowbar(player, item, fromPosition, target, toPosition, isHotkey)
	if not isInArray({2416, 10515}, item.itemid) then
		return false
	end

	local targetActionId, targetUniqueId = target.actionid, target.uid

	-- In Service Of Yalahar Quest
	if targetUniqueId == 3071 then
		if player:getStorageValue(Storage.InServiceofYalahar.SewerPipe01) < 1 then
			doSetMonsterOutfit(player, 'skeleton', 3 * 1000)
			fromPosition:sendMagicEffect(CONST_ME_ENERGYHIT)
			player:setStorageValue(Storage.InServiceofYalahar.SewerPipe01, 1)
			player:setStorageValue(Storage.InServiceofYalahar.Mission01, player:getStorageValue(Storage.InServiceofYalahar.Mission01) + 1) -- StorageValue for Questlog 'Mission 01: Something Rotten'
			local position = player:getPosition()
			for x = -1, 1 do
				for y = -1, 1 do
					position = position + Position(x, y, 0)
					position:sendMagicEffect(CONST_ME_YELLOWENERGY)
				end
			end
		end

	elseif targetUniqueId == 3072 then
		if player:getStorageValue(Storage.InServiceofYalahar.SewerPipe02) < 1 then
			player:setStorageValue(Storage.InServiceofYalahar.SewerPipe02, 1)
			player:setStorageValue(Storage.InServiceofYalahar.Mission01, player:getStorageValue(Storage.InServiceofYalahar.Mission01) + 1) -- StorageValue for Questlog 'Mission 01: Something Rotten'
			local position = player:getPosition()
			for x = -1, 1 do
				for y = -1, 1 do
					if math.random(2) == 2 then
						position = position + Position(x, y, 0)
						Game.createMonster('rat', position)
						position:sendMagicEffect(CONST_ME_TELEPORT)
					end
				end
			end
		end

	elseif targetUniqueId == 3073 then
		if player:getStorageValue(Storage.InServiceofYalahar.SewerPipe03) < 1 then
			player:say('You have used the crowbar on a grate.', TALKTYPE_MONSTER_SAY)
			player:setStorageValue(Storage.InServiceofYalahar.SewerPipe03, 1)
			player:setStorageValue(Storage.InServiceofYalahar.Mission01, player:getStorageValue(Storage.InServiceofYalahar.Mission01) + 1) -- StorageValue for Questlog 'Mission 01: Something Rotten'
		end

	elseif targetUniqueId == 3074 then
		if player:getStorageValue(Storage.InServiceofYalahar.SewerPipe04) < 1 then
			doSetMonsterOutfit(player, 'bog raider', 5 * 1000)
			player:say('You have used the crowbar on a knot.', TALKTYPE_MONSTER_SAY)
			player:setStorageValue(Storage.InServiceofYalahar.SewerPipe04, 1)
			player:setStorageValue(Storage.InServiceofYalahar.Mission01, player:getStorageValue(Storage.InServiceofYalahar.Mission01) + 1) -- StorageValue for Questlog 'Mission 01: Something Rotten'
		end

	elseif targetActionId == 100 then
		local targetId = target.itemid

		-- Postman Quest
		if targetId == 2593 then
			if player:getStorageValue(Storage.postman.Mission02) == 1 then
				player:setStorageValue(Storage.postman.Mission02, 2)
				toPosition:sendMagicEffect(CONST_ME_MAGIC_BLUE)
			end

		-- The Ape City - Mission 7
		elseif targetId == 5539 then
			local cStorage = player:getStorageValue(Storage.TheApeCity.Casks)
			if cStorage < 3 then
				player:setStorageValue(Storage.TheApeCity.Casks, math.max(0, cStorage) + 1)
				target:transform(2249)
				toPosition:sendMagicEffect(CONST_ME_EXPLOSIONAREA)
				addEvent(revertCask, 3 * 60 * 1000, toPosition)
			end
		end

	-- Secret Service Quest
	elseif targetActionId == 12566 and player:getStorageValue(Storage.secretService.TBIMission06) == 1 then
		local yellPosition = Position(32204, 31157, 8)
		if player:getOutfit().lookType == 137 then -- amazon lookType
			player:setStorageValue(Storage.secretService.TBIMission06, 2)
			Game.createMonster('barbarian skullhunter', yellPosition) -- say
			player:say("Nooooo! What have you done??", TALKTYPE_MONSTER_SAY, false, 0, yellPosition)
			yellPosition.y = yellPosition.y - 1
			Game.createMonster('barbarian skullhunter', yellPosition)
		end
	else
		return false
	end

	return true
end

function onUseSpoon(player, item, fromPosition, target, toPosition, isHotkey)
	local targetId = target.itemid

	--The Ice Islands Quest
	if targetId == 388 then
		if player:getStorageValue(Storage.TheIceIslands.Questline) >= 21 then
			if player:getStorageValue(Storage.TheIceIslands.SulphurLava) < 1 then
				player:addItem(8301, 1)
				player:setStorageValue(Storage.TheIceIslands.SulphurLava, 1)
				toPosition:sendMagicEffect(CONST_ME_MAGIC_RED)
				player:say('You retrive a fine sulphur from a lava hole.', TALKTYPE_MONSTER_SAY)
			end
		end

	elseif targetId == 4184 then
		if player:getStorageValue(Storage.TheIceIslands.Questline) >= 21 then
			if player:getStorageValue(Storage.TheIceIslands.SporesMushroom) < 1 then
				player:addItem(7251, 1)
				player:setStorageValue(Storage.TheIceIslands.SporesMushroom, 1)
				toPosition:sendMagicEffect(CONST_ME_MAGIC_RED)
				player:say('You retrive spores from a mushroom.', TALKTYPE_MONSTER_SAY)
			end
		end

	-- What a foolish Quest - Mission 8 (Sulphur)
	elseif targetId == 8573 then
		if player:getStorageValue(Storage.WhatAFoolishQuest.Questline) ~= 21
				or player:getStorageValue(Storage.WhatAFoolishQuest.InflammableSulphur) == 1 then
			return false
		end

		player:setStorageValue(Storage.WhatAFoolishQuest.InflammableSulphur, 1)
		player:addItem(8204, 1)
		toPosition:sendMagicEffect(CONST_ME_YELLOW_RINGS)
	else
		return false
	end

	return true
end

function onUseScythe(player, item, fromPosition, target, toPosition, isHotkey)
	if not isInArray({2550, 10513}, item.itemid) then
		return false
	end

	if target.itemid == 2739 then
		target:transform(2737)
		target:decay()
		Game.createItem(2694, 1, toPosition)
		return true
	end

	return onDestroyItem(player, item, fromPosition, target, toPosition, isHotkey)
end

function onUseKitchenKnife(player, item, fromPosition, target, toPosition, isHotkey)
	if not isInArray({2566, 10511, 10515}, item.itemid) then
		return false
	end

	local targetId = target.itemid

	--The Ice Islands Quest
	if targetId == 7261 then
		if player:getStorageValue(Storage.TheIceIslands.Questline) >= 21 then
			if player:getStorageValue(Storage.TheIceIslands.FrostbiteHerb) < 1 then
				player:addItem(7248, 1)
				player:setStorageValue(Storage.TheIceIslands.FrostbiteHerb, 1)
				toPosition:sendMagicEffect(CONST_ME_MAGIC_BLUE)
				player:say('You cut a leaf from a frostbite herb.', TALKTYPE_MONSTER_SAY)
			end
		end

	elseif targetId == 2733 then
		if player:getStorageValue(Storage.TheIceIslands.Questline) >= 21 then
			if player:getStorageValue(Storage.TheIceIslands.FlowerCactus) < 1 then
				player:addItem(7245, 1)
				player:setStorageValue(Storage.TheIceIslands.FlowerCactus, 1)
				target:transform(2723)
				addEvent(revertItem, 60 * 1000, toPosition, 2723, 2733)
				toPosition:sendMagicEffect(CONST_ME_MAGIC_GREEN)
				player:say('You cut a flower from a cactus.', TALKTYPE_MONSTER_SAY)
			end
		end

	elseif targetId == 4017 then
		if player:getStorageValue(Storage.TheIceIslands.Questline) >= 21 then
			if player:getStorageValue(Storage.TheIceIslands.FlowerBush) < 1 then
				player:addItem(7249, 1)
				player:setStorageValue(Storage.TheIceIslands.FlowerBush, 1)
				target:transform(4014)
				addEvent(revertItem, 60 * 1000, toPosition, 4014, 4017)
				toPosition:sendMagicEffect(CONST_ME_MAGIC_GREEN)
				player:say('You cut a flower from a bush.', TALKTYPE_MONSTER_SAY)
			end
		end

	-- What a foolish Quest (Mission 1)
	elseif target.actionid == 4200 then
		if toPosition.x == 32349 and toPosition.y == 32361 and toPosition.z == 7 then
			player:addItem(7476, 1)
			player:say('The stubborn flower has ruined your knife but at least you got it.', TALKTYPE_MONSTER_SAY, false, player, toPosition)
			item:remove()
		else
			player:say('This flower is too pathetic.', TALKTYPE_MONSTER_SAY, false, player, toPosition)
		end

	-- What a foolish Quest (Mission 5)
	elseif targetId == 7480 then
		if player:getStorageValue(Storage.WhatAFoolishQuest.EmperorBeardShave) == 1 then
			player:say('God shave the emperor. Some fool already did it.', TALKTYPE_MONSTER_SAY)
			return true
		end

		player:setStorageValue(Storage.WhatAFoolishQuest.EmperorBeardShave, 1)
		player:say('This is probably the most foolish thing you\'ve ever done!', TALKTYPE_MONSTER_SAY)
		player:addItem(7479, 1)
		Game.createMonster('dwarf guard', Position(32656, 31853, 13))

	-- What a foolish Quest (Mission 8)
	elseif targetId == 4008 then
		if player:getStorageValue(Storage.WhatAFoolishQuest.Questline) ~= 22
				or player:getStorageValue(Storage.WhatAFoolishQuest.SpecialLeaves) == 1 then
			return false
		end

		player:setStorageValue(Storage.WhatAFoolishQuest.SpecialLeaves, 1)
		player:addItem(8109, 1)
		toPosition:sendMagicEffect(CONST_ME_BLOCKHIT)

	elseif isInArray(fruits, targetId) and player:removeItem(6278, 1) then
		target:remove(1)
		player:addItem(6279, 1)
		player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
	else
		return false
	end

	return true
end
