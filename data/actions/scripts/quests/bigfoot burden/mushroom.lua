function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local spore = Game.createItem(math.random(18221, 18224), 1, toPosition)
	if spore then
		spore:decay()
	end
	return true
end