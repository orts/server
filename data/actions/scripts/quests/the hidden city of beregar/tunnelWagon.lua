function onUse(player, item, fromPosition, target, toPosition, isHotkey)

	if Tile(Position(32619, 31514, 9)):getItemId(5709) then
		player:teleportTo(Position(32580, 31487, 9))
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:say("You need to build a bridge to pass the gap.", TALKTYPE_MONSTER_SAY, false, 0, pos)
	else
		player:setStorageValue(Storage.hiddenCityOfBeregar.RoyalRescue, 3)
		player:teleportTo(Position(32625, 31514, 9))
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:say("You safely passed the tunnel.", TALKTYPE_MONSTER_SAY, false, 0, pos)
		Game.createItem(5709, 1, Position(32619, 31514, 9))
		local tile = Tile(Position(32617, 31513, 9))
		if tile then
			local thing = tile:getItemById(1027)
			if thing then
				thing:remove()
			end
		end
		local secondTile = Tile(Position(32617, 31514, 9))
		if secondTile then
			local thing = tile:getItemById(1205)
			if thing then
				thing:remove()
			end
		end
	end
	return true
end
