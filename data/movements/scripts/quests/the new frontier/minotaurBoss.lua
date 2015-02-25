local config = {
	arenaPosition = Position(33154, 31415, 7),
	exitPosition = Position(33146, 31414, 6),
	successPosition = Position(33145, 31419, 7)
}

local events = {}

local function completeTest(cid)
	local player = Player(cid)
	if not player then
		return true
	end

	if player:getStorageValue(Storage.TheNewFrontier.Questline) == 19 then
		player:teleportTo(config.successPosition)
		player:say('You have passed the test. Report to Curos.', TALKTYPE_MONSTER_SAY)
	end
end

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local playerId = player.uid
	if item.actionid == 12135 then
		if player:getStorageValue(Storage.TheNewFrontier.Questline) == 18 then
			events[playerId] = addEvent(completeTest, 2 * 60 * 1000, playerId)
			player:setStorageValue(Storage.TheNewFrontier.Questline, 19)
			player:teleportTo(config.arenaPosition)
			config.arenaPosition:sendMagicEffect(CONST_ME_TELEPORT)
		else
			player:teleportTo(fromPosition)
			fromPosition:sendMagicEffect(CONST_ME_TELEPORT)
			player:sendTextMessage(MESSAGE_STATUS_SMALL, 'You don\'t have access to this area.')
		end

	elseif item.actionid == 12136 then
		if events[playerId] then
			stopEvent(events[playerId])
			events[playerId] = nil
		end
		if player:getStorageValue(Storage.TheNewFrontier.Questline) == 19 then
			player:setStorageValue(Storage.TheNewFrontier.Questline, 17)
		end
		player:teleportTo(config.exitPosition)
		config.exitPosition:sendMagicEffect(CONST_ME_TELEPORT)
		player:say('You left the arena. Ask Curos again for the mission!', TALKTYPE_MONSTER_SAY)
	end
	return true
end
