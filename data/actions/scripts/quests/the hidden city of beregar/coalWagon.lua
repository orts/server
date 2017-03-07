local wagons = {
	[7131] = Position(32717, 31492, 11),
	[8749] = Position(32699, 31492, 11)
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local lastPosition = wagons[item.itemid]
	if not lastPosition then
		return false
	end

	local wagonPosition = item:getPosition()
	if wagonPosition == lastPosition then
		return false
	end

	local tile = Tile(wagonPosition)
	if item.itemid == 7131 then
		wagonPosition.x = wagonPosition.x + 2
		tile:getTopTopItem():moveTo(wagonPosition)
	elseif item.itemid == 8749 and item.actionid == 50117 then
		wagonPosition.x = wagonPosition.x - 2
		tile:getItemById(7131):moveTo(wagonPosition)
		tile:getItemById(8749):moveTo(wagonPosition)
	end

	player:say("SQUEEEEAK", TALKTYPE_MONSTER_SAY, false, 0, wagonPosition)

	return true
end
