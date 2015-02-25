function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if player:getStorageValue(Storage.GravediggerOfDrefia.Mission69) == 1 and player:getStorageValue(Storage.GravediggerOfDrefia.Mission70) < 1 then
		player:setStorageValue(Storage.GravediggerOfDrefia.Mission70, 1)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have found a crumpled paper.')
		player:addItem(21474, 1)
	end
	return true
end