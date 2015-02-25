function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	item:transform(item.itemid == 1945 and 1946 or 1945)

	if item.itemid ~= 1945 then
		return true
	end

	local ticTacPosition = Position(32838, 32264, 14)
	Game.createItem(2638, 1, ticTacPosition)
	Game.createItem(2639, 1, ticTacPosition)
	ticTacPosition:sendMagicEffect(CONST_ME_MAGIC_BLUE)
	return true
end