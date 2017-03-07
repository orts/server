function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local tile = Tile(Position(32571, 31508, 9))
	if tile and tile:getItemById(7122) and player:getStorageValue(Storage.hiddenCityOfBeregar.RoyalRescue) == 1 then
		player:setStorageValue(Storage.hiddenCityOfBeregar.RoyalRescue, 2)
		player:teleportTo(Position(32578, 31507, 9))
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:say("You safely passed the gap but your bridge collapsed behind you.", TALKTYPE_MONSTER_SAY, false, 0, player:getPosition())

		local thing = tile:getItemById(7122)
		if thing then
			thing:remove()
		end

		local secondThing = tile:getItemById(5779)
		if secondThing then
			secondThing:remove()
		end
	else
		player:teleportTo(Position(32580, 31487, 9))
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:say("You need to build a bridge to pass the gap.", TALKTYPE_MONSTER_SAY, false, 0, player:getPosition())
	end

	return true
end
