local levers = {
	[50113] = Position(32696, 31453, 13),
	[50114] = Position(32692, 31453, 13),
	[50115] = Position(32687, 31452, 13),
	[50116] = Position(32682, 31455, 13),
	[50117] = Position(32688, 31456, 13),
	[50118] = Position(32692, 31459, 13),
	[50119] = Position(32696, 31461, 13),
	[50120] = Position(32695, 31464, 13),
	[50121] = Position(32690, 31465, 13),
	[50122] = Position(32684, 31464, 13),
	[50123] = Position(32688, 31469, 13)
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local lever = levers[item.uid]
	if lever then
		local tile = Tile(lever)
		if tile:getItemById(7130) then
			tile:getItemById(7130):transform(7121)
		else
			local targetItem = tile:getItems()[1]
			targetItem:transform(targetItem:getId() + 1)
		end
	end
	item:transform(item.itemid == 10044 and 10045 or 10044)
	return true
end
