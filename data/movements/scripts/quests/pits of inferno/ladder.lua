local ladderPosition = Position(32854, 32321, 11)

function onStepIn(creature, item, position, fromPosition)
	if not creature:isPlayer() then
		return true
	end

	local ladderItem = Tile(ladderPosition):getItemById(5543)
	if not ladderItem then
		Game.createItem(5543, 1, ladderPosition)
	end
	return true
end

function onStepOut(creature, item, position, fromPosition)
	if not creature:isPlayer() then
		return true
	end

	local ladderItem = Tile(ladderPosition):getItemById(5543)
	if ladderItem then
		ladderItem:remove()
	end
	return true
end