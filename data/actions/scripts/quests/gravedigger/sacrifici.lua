function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if player:getStorageValue(Storage.GravediggerOfDrefia.Mission72) == 1 and player:getStorageValue(Storage.GravediggerOfDrefia.Mission73) < 1 then
		local skullItem = Tile(Position(33071, 32442, 11)):getItemById(21476)
		if skullItem then
			skullItem:remove()
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'The scroll burns to dust. The magic stutters. Omrabas\' soul flees to his old hideaway.')
			player:removeItem(21251, 1)
			player:setStorageValue(Storage.GravediggerOfDrefia.Mission73, 1)
			Game.createMonster("Chicken", Position(33015, 32418, 11))
		end
	end
	return true
end