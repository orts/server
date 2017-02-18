function onStepIn(creature, item, position, fromPosition)
	item:transform(425)

	local index = item.actionid == 2245 and 'x' or 'y'

	local new_position = Position(position.x, position.y, position.z)
	
	for i = 1, 6 do
		new_position[index] = position[index] + 2 + i - 1
		local tile = Tile(new_position)
		local itemCount = tile:getDownItemCount()
		if itemCount > 0 then
			new_position[index] = position[index] + 2 + i % 6
			tile:getThing(tile:getTopItemCount() + tile:getCreatureCount() + itemCount):moveTo(new_position)
		end
	end
	return true
end

function onStepOut(creature, item, position, fromPosition)
	item:transform(426)
	return true
end
