local lava = {
	{x = 32808, y = 32336, z = 11, stackpos = 0},
	{x = 32809, y = 32336, z = 11, stackpos = 0},
	{x = 32810, y = 32336, z = 11, stackpos = 0},
	{x = 32808, y = 32334, z = 11, stackpos = 0},
	{x = 32807, y = 32334, z = 11, stackpos = 0},
	{x = 32807, y = 32335, z = 11, stackpos = 0},
	{x = 32807, y = 32336, z = 11, stackpos = 0},
	{x = 32807, y = 32337, z = 11, stackpos = 0},
	{x = 32806, y = 32337, z = 11, stackpos = 0},
	{x = 32805, y = 32337, z = 11, stackpos = 0},
	{x = 32805, y = 32338, z = 11, stackpos = 0},
	{x = 32805, y = 32339, z = 11, stackpos = 0},
	{x = 32806, y = 32339, z = 11, stackpos = 0},
	{x = 32806, y = 32338, z = 11, stackpos = 0},
	{x = 32807, y = 32338, z = 11, stackpos = 0},
	{x = 32808, y = 32338, z = 11, stackpos = 0},
	{x = 32808, y = 32337, z = 11, stackpos = 0},
	{x = 32809, y = 32337, z = 11, stackpos = 0},
	{x = 32810, y = 32337, z = 11, stackpos = 0},
	{x = 32811, y = 32337, z = 11, stackpos = 0},
	{x = 32811, y = 32338, z = 11, stackpos = 0},
	{x = 32806, y = 32338, z = 11, stackpos = 0},
	{x = 32810, y = 32338, z = 11, stackpos = 0},
	{x = 32810, y = 32339, z = 11, stackpos = 0},
	{x = 32809, y = 32339, z = 11, stackpos = 0},
	{x = 32809, y = 32338, z = 11, stackpos = 0},
	{x = 32811, y = 32336, z = 11, stackpos = 0},
	{x = 32811, y = 32335, z = 11, stackpos = 0},
	{x = 32810, y = 32335, z = 11, stackpos = 0},
	{x = 32809, y = 32335, z = 11, stackpos = 0},
	{x = 32808, y = 32335, z = 11, stackpos = 0},
	{x = 32809, y = 32334, z = 11, stackpos = 0},
	{x = 32809, y = 32333, z = 11, stackpos = 0},
	{x = 32810, y = 32333, z = 11, stackpos = 0},
	{x = 32811, y = 32333, z = 11, stackpos = 0},
	{x = 32806, y = 32338, z = 11, stackpos = 0},
	{x = 32810, y = 32334, z = 11, stackpos = 0},
	{x = 32811, y = 32334, z = 11, stackpos = 0},
	{x = 32812, y = 32334, z = 11, stackpos = 0},
	{x = 32813, y = 32334, z = 11, stackpos = 0},
	{x = 32814, y = 32334, z = 11, stackpos = 0},
	{x = 32812, y = 32333, z = 11, stackpos = 0},
	{x = 32810, y = 32334, z = 11, stackpos = 0},
	{x = 32812, y = 32335, z = 11, stackpos = 0},
	{x = 32813, y = 32335, z = 11, stackpos = 0},
	{x = 32814, y = 32335, z = 11, stackpos = 0},
	{x = 32814, y = 32333, z = 11, stackpos = 0},
	{x = 32813, y = 32333, z = 11, stackpos = 0}
}

local holeId = {
	294, 369, 370, 383, 392, 408, 409, 410, 427, 428, 430, 462, 469, 470, 482,
	484, 485, 489, 924, 3135, 3136, 7933, 7938, 8170, 8286, 8285, 8284, 8281,
	8280, 8279, 8277, 8276, 8567, 8585, 8596, 8595, 8249, 8250, 8251,
	8252, 8253, 8254, 8255, 8256, 8972, 9606, 9625, 13190, 14461, 19519, 21536
}

local holes = {468, 481, 483, 7932}

local function revertCask(toPosition)
	toPosition:sendMagicEffect(CONST_ME_MAGIC_GREEN)
	local tile = toPosition:getTile()
	if tile then
		local thing = tile:getItemById(2249)
		if thing then
			thing:transform(5539)
		end
	end
end

local function revertIce(toPosition)
	local tile = toPosition:getTile()
	if tile then
		local thing = tile:getItemById(7186)
		if thing then
			thing:transform(7185)
		end
	end
end

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local tile = toPosition:getTile()
	local ground = tile:getGround()
	if ground and isInArray(ropeSpots, ground.itemid) or tile:getItemById(14435) then
		player:teleportTo({x = toPosition.x, y = toPosition.y + 1, z = toPosition.z - 1}, false)
	elseif isInArray(holeId, target.itemid) then
		toPosition.z = toPosition.z + 1
		tile = toPosition:getTile()
		if tile then
			local thing = tile:getTopVisibleThing()
			if thing:isItem() and thing:getType():isMovable() then
				return thing:moveTo({x = toPosition.x, y = toPosition.y + 1, z = toPosition.z - 1})
			elseif thing:isCreature() and thing:isPlayer() then
				return thing:teleportTo({x = toPosition.x, y = toPosition.y + 1, z = toPosition.z - 1})
			end
		end
	elseif (target.uid <= 65535 or target.actionid > 0) and (target.itemid == 354 or target.itemid == 355) then
		target:transform(392)
		target:decay()
		toPosition:sendMagicEffect(CONST_ME_POFF)
	elseif target.itemid == 3621 and target.actionid == 12026 then
		local chakoyas = {'chakoya toolshaper', 'chakoya tribewarden', 'chakoya windcaller'}
		if player:getStorageValue(Storage.TheIceIslands.Mission02) > 0 and player:getStorageValue(Storage.TheIceIslands.PickAmount) < 3 and player:getStorageValue(Storage.TheIceIslands.Questline) == 3  then
			player:setStorageValue(Storage.TheIceIslands.PickAmount, player:getStorageValue(Storage.TheIceIslands.PickAmount) + 1)
			player:setStorageValue(Storage.TheIceIslands.Mission02, player:getStorageValue(Storage.TheIceIslands.Mission02) + 1) -- Questlog The Ice Islands Quest, Nibelor 1: Breaking the Ice
			Game.createMonster(chakoyas[math.random(3)], toPosition)
			toPosition:sendMagicEffect(CONST_ME_TELEPORT)
			tile:getItemById(7185):transform(7186)
			addEvent(revertIce, 60 * 1000, toPosition)
			if player:getStorageValue(Storage.TheIceIslands.PickAmount) >= 2 then
				player:setStorageValue(Storage.TheIceIslands.Questline, 4)
				player:setStorageValue(Storage.TheIceIslands.Mission02, 4) -- Questlog The Ice Islands Quest, Nibelor 1: Breaking the Ice
			end
		end
	elseif target.itemid == 7200 then
		target:transform(7236)
		target:decay()
		toPosition:sendMagicEffect(CONST_ME_HITAREA)
	elseif isInArray(holes, target.itemid) then
		target:transform(target.itemid + 1)
		target:decay()
	elseif target.itemid == 231 or target.itemid == 9059 then
		local rand = math.random(100)
		if target.actionid == 100 and rand <= 20 then
			target:transform(489)
			target:decay()
		elseif rand == 1 then
			Game.createItem(2159, 1, toPosition)
		elseif rand > 95 then
			Game.createMonster('Scarab', toPosition)
		end
		toPosition:sendMagicEffect(CONST_ME_POFF)
	elseif target.actionid == 4654 and player:getStorageValue(Storage.GravediggerOfDrefia.Mission49) == 1 and player:getStorageValue(Storage.GravediggerOfDrefia.Mission50) < 1 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You found a piece of the scroll. You pocket it quickly.')
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		player:addItem(21250, 1)
		player:setStorageValue(Storage.GravediggerOfDrefia.Mission50, 1)
	elseif target.actionid == 4668 and player:getStorageValue(Storage.GravediggerOfDrefia.Mission67) == 1 and player:getStorageValue(Storage.GravediggerOfDrefia.Mission68) < 1 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'A torn scroll piece emerges. Probably gnawed off by rats.')
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		player:addItem(21250, 1)
		player:setStorageValue(Storage.GravediggerOfDrefia.Mission68, 1)
	elseif target.actionid == 50118 then
		local position = Position(32717, 31492, 11)
		if Tile(position):getItemById(7131) then
			Game.createItem(8749, 1, position)
			toPosition:sendMagicEffect(CONST_ME_POFF)
		end
	elseif target.itemid == 8749 then
		local tile = Tile(Position(32699, 31492, 11))
		if tile:getItemById(8749) then
			tile:getItemById(8749):remove()
			toPosition:sendMagicEffect(CONST_ME_POFF)
			Tile(Position(32699, 31494, 11)):getItemById(8642):setActionId(50119)
		end
	elseif isInArray({2782, 19433}, target.itemid) then
		target:transform(target.itemid == 19433 and 19431 or target.itemid - 1)
		target:decay()
	elseif target.itemid == 2739 and item.itemid == 10513 then
		target:transform(2737)
		target:decay()
		Game.createItem(2694, 1, toPosition)
	elseif item.itemid == 10515 then
		if target.uid == 3071 then -- In Service Of Yalahar Quest
			if player:getStorageValue(Storage.InServiceofYalahar.SewerPipe01) < 1 then
				doSetMonsterOutfit(player, 'skeleton', 3 * 1000)
				fromPosition:sendMagicEffect(CONST_ME_ENERGYHIT)
				player:setStorageValue(Storage.InServiceofYalahar.SewerPipe01, 1)
				player:setStorageValue(Storage.InServiceofYalahar.Mission01, player:getStorageValue(Storage.InServiceofYalahar.Mission01) + 1) -- StorageValue for Questlog 'Mission 01: Something Rotten'
				for x = -1, 1 do
					for y = -1, 1 do
						Position({x = player:getPosition().x + x, y = player:getPosition().y + y, z = player:getPosition().z}):sendMagicEffect(CONST_ME_YELLOWENERGY)
					end
				end
			end
		elseif target.uid == 3072 then -- In Service Of Yalahar Quest
			if player:getStorageValue(Storage.InServiceofYalahar.SewerPipe02) < 1 then
				player:setStorageValue(Storage.InServiceofYalahar.SewerPipe02, 1)
				player:setStorageValue(Storage.InServiceofYalahar.Mission01, player:getStorageValue(Storage.InServiceofYalahar.Mission01) + 1) -- StorageValue for Questlog 'Mission 01: Something Rotten'
				for x = -1, 1 do
					for y = -1, 1 do
						if math.random(2) == 2 then
							Game.createMonster('rat', {x = player:getPosition().x + x, y = player:getPosition().y + y, z = player:getPosition().z})
							Position({x = player:getPosition().x + x, y = player:getPosition().y + y, z = player:getPosition().z}):sendMagicEffect(CONST_ME_TELEPORT)
						end
					end
				end
			end
		elseif target.uid == 3073 then -- In Service Of Yalahar Quest
			if player:getStorageValue(Storage.InServiceofYalahar.SewerPipe03) < 1 then
				player:say('You have used the crowbar on a grate.', TALKTYPE_MONSTER_SAY)
				player:setStorageValue(Storage.InServiceofYalahar.SewerPipe03, 1)
				player:setStorageValue(Storage.InServiceofYalahar.Mission01, player:getStorageValue(Storage.InServiceofYalahar.Mission01) + 1) -- StorageValue for Questlog 'Mission 01: Something Rotten'
			end
		elseif target.uid == 3074 then -- In Service Of Yalahar Quest
			if player:getStorageValue(Storage.InServiceofYalahar.SewerPipe04) < 1 then
				doSetMonsterOutfit(player, 'bog raider', 5 * 1000)
				player:say('You have used the crowbar on a knot.', TALKTYPE_MONSTER_SAY)
				player:setStorageValue(Storage.InServiceofYalahar.SewerPipe04, 1)
				player:setStorageValue(Storage.InServiceofYalahar.Mission01, player:getStorageValue(Storage.InServiceofYalahar.Mission01) + 1) -- StorageValue for Questlog 'Mission 01: Something Rotten'
			end
		elseif target.itemid == 5539 and target.actionid == 12127 and player:getStorageValue(Storage.TheApeCity.Mission07) <= 3 then -- The Ape City - Mission 7: Destroying Casks With Crowbar
			toPosition:sendMagicEffect(CONST_ME_POFF)
			player:setStorageValue(Storage.TheApeCity.Mission07, player:getStorageValue(Storage.TheApeCity.Mission07) + 1) -- The Ape City Questlog - Mission 7: Destroying Casks With Crowbar
			if player:getStorageValue(Storage.TheApeCity.Mission07) == 4 then
				player:setStorageValue(Storage.TheApeCity.Questline, 17)
			end
			player:say('You destroyed a cask.', TALKTYPE_MONSTER_SAY)
			target:transform(2249)
			addEvent(revertCask, 30 * 1000, toPosition)
		elseif target.actionid == 100 and target.itemid == 2593 then -- Postman Quest
			if player:getStorageValue(Storage.postman.Mission02) == 1 then
				player:setStorageValue(Storage.postman.Mission02, 2)
				toPosition:sendMagicEffect(CONST_ME_MAGIC_BLUE)
			end
		-- Secret Service Quest
		elseif target.actionid == 12566 and player:getStorageValue(Storage.secretService.TBIMission06) == 1 then
			local playerOutfit = player:getOutfit()
			local yelling = Position(32204, 31157, 8)
			if playerOutfit.lookType == 137 then -- amazon lookType
				player:setStorageValue(Storage.secretService.TBIMission06, 2)
				Game.createMonster('barbarian skullhunter', yelling) -- say
				player:say("Nooooo! What have you done??", TALKTYPE_MONSTER_SAY, false, 0, yelling)
				Game.createMonster('barbarian skullhunter', Position(32204, 31156, 8))
			end
		end
	elseif target.itemid == 1304 then
		if target.uid == 1022 then --The Pits of Inferno Quest
			for i = 1, #lava do
				Game.createItem(5815, 1, lava[i])
			end
			target:transform(2256)
			toPosition:sendMagicEffect(CONST_ME_SMOKE)
		elseif target.actionid == 50058 then -- naginata quest
			local cStorage = GlobalStorage.NaginataStone
			local stoneStorage = Game.getStorageValue(cStorage)
			if stoneStorage ~= 5 then
				Game.setStorageValue(cStorage, math.max(0, stoneStorage or 0) + 1)
			elseif stoneStorage == 5 then
				Item(target.uid):remove()
				Game.setStorageValue(cStorage)
			end

			toPosition:sendMagicEffect(CONST_ME_POFF)
			doTargetCombatHealth(0, player, COMBAT_PHYSICALDAMAGE, -31, -39, CONST_ME_NONE)
		end
	elseif target.itemid == 9025 and target.actionid == 101 then --The Banshee Quest
		target:transform(392)
		target:decay()
		toPosition:sendMagicEffect(CONST_ME_POFF)
	elseif target.actionid == 50090 then
		if player:getStorageValue(Storage.hiddenCityOfBeregar.WayToBeregar) == 1 then -- The Hidden City of Beregar Quest
			player:teleportTo(Position(32566, 31338, 10))
		end
	elseif target.actionid == 50114 then
		if Tile(Position(32617, 31513, 9)):getItemById(1027) and Tile(Position(32617, 31514, 9)):getItemById(1205) then
			Tile(Position(32619, 31514, 9)):getItemById(5709):remove()
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You can\'t remove this pile since it\'s currently holding up the tunnel.')
		end
	elseif target.actionid == 50127 then
		local positions = {
			Position(32551, 31379, 15),
			Position(32551, 31378, 15),
			Position(32551, 31377, 15),
			Position(32551, 31376, 15),
			Position(32551, 31375, 15),
			Position(32551, 31374, 15),
			Position(32551, 31373, 15),
			Position(32550, 31373, 15),
			Position(32550, 31374, 15),
			Position(32550, 31375, 15),
			Position(32550, 31376, 15),
			Position(32550, 31377, 15),
			Position(32550, 31378, 15),
			Position(32550, 31379, 15)
		}
		local tile = Tile(Position(32551, 31379, 15))
		if tile:getItemById(9341) then
			tile:getItemById(9341):remove()
		end
		if tile:getItemById(1304) then
			tile:getItemById(1304):remove()
		end
		for i = 1, #positions do
			local ground = Tile(positions[i]):getGround()
			if ground and ground.itemid == 598 then
				ground:transform(5815)
			end
		end
		local portal = Game.createItem(1387, 1, Position(32551, 31376, 15))
		if portal then
			portal:setActionId(50126)
		end
	elseif target.itemid == 22674 then
		if not player:removeItem(5091, 1) then
			return false
		end

		target:transform(5731)
		target:decay()
		toPosition:sendMagicEffect(CONST_ME_POFF)
	else
		return false
	end

	-- TODO: Add jamming, sickle, spoon and kitchen knife

	return true
end
