local tile = Tile(Position(32571, 31508, 9))

function onUse(player, item, fromPosition, target, toPosition, isHotkey)

	if player:getStorageValue(Storage.hiddenCityOfBeregar.RoyalRescue) == 1 and tile:getItemId(7122) then
		player:setStorageValue(Storage.hiddenCityOfBeregar.RoyalRescue, 2)
		player:teleportTo(Position(32578, 31507, 9))
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:say("You safely passed the gap but your bridge collapsed behind you.", TALKTYPE_MONSTER_SAY, false, 0, pos)
		if tile then
			local thing = tile:getItemId(7122)
			if thing then
				thing:remove()
			end
			local secondThing = tile:getItemId(5779)
			if secondThing then
				secondThing:remove()
			end
		end
	else
		player:teleportTo(Position(32580, 31487, 9))
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:say("You need to build a bridge to pass the gap.", TALKTYPE_MONSTER_SAY, false, 0, pos)
	end
	return true
end
