local function revertCrystal(position, itemId, transformId)
	local item = Tile(position):getItemById(itemId)
	if item then
		item:transform(transformId)
	end
end

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if target.itemid ~= 18321 then
		return false
	end

	if player:getStorageValue(Storage.BigfootBurden.MatchmakerStatus) == 1 or player:getStorageValue(Storage.BigfootBurden.MissionMatchmaker) ~= 1 then
		return false
	end

	target:transform(18320)
	addEvent(revertCrystal, 40000, toPosition, 18320, 18321)

	if math.random(5) ~= 5 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'This is not the crystal you\'re looking for!')
		return true
	end

	player:setStorageValue(Storage.BigfootBurden.MatchmakerStatus, 1)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Congratulations! The crystals seem to have fallen in love and your mission is done!')
	return true
end
