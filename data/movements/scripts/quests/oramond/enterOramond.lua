function onStepIn(player, item, position, fromPosition)
	if item.actionid == 42626 and player:getStorageValue(Storage.RathletonQuest.Rank) < 300 then
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:teleportTo(Position(33539, 32014, 6))
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:say('Slrrp!', TALKTYPE_MONSTER_SAY)
		elseif item.actionid == 42626 and player:getStorageValue(Storage.RathletonQuest.Rank) >= 300 then
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:teleportTo(Position(33636, 31891, 6))
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:say('Slrrp!', TALKTYPE_MONSTER_SAY)
	end
	if item.actionid == 42627 then
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:teleportTo(Position(33491, 31985,7))
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:say('Slrrp!', TALKTYPE_MONSTER_SAY)
	end
	if item.actionid == 42628 and player:getStorageValue(Storage.RathletonQuest.Rank) < 300 then
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:teleportTo(Position(33636, 31891, 6))
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:say('Slrrp!', TALKTYPE_MONSTER_SAY)
		elseif item.actionid == 42628 and player:getStorageValue(Storage.RathletonQuest.Rank) >= 300 then
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:teleportTo(Position(33491, 31985, 7))
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:say('Slrrp!', TALKTYPE_MONSTER_SAY)
	end
	return true
end
