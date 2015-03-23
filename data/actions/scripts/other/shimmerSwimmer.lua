local targetItems = {
	[13870] = 13875, -- Eye of a Deepling => Shimmer Glower
	[13942] = 13873, -- Yielocks => Shimmer Bow
	[13943] = 13871, -- Flintstone => Shimmer Sword
	[13877] = 13880, -- Broken Ring of Ending => Shimmer Wand
	[13881] = 13872 -- Yielowax => Shimmer Rod
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local targetItem = targetItems[target.itemid]
	if targetItem then
		player:addItem(targetItem, 1)
	elseif isInArray({8669, 8670, 10039, 10040}, target.itemid) then -- Bellow => Shimmer Ball
		player:addItem(13944, 1)
	end
	item:remove(1)
	return true
end
