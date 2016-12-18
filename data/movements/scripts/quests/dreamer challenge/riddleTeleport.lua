local destination = Position(32766, 32275, 14)

local topLeftPosition = Position(32817, 32333, 9)
local pillowPositions = {
	{itemid = 1686, center = topLeftPosition + Position(2, 2, 0)},
	{itemid = 1687, center = topLeftPosition + Position(2, 5, 0)},
	{itemid = 1688, center = topLeftPosition + Position(5, 2, 0)},
	{itemid = 1689, center = topLeftPosition + Position(5, 5, 0)}
}

function onStepIn(player, item, position, fromPosition)
	if not player:getPlayer() then
		return true
	end

	-- Check pillows
	local pillows = {}
	for i = 1, #pillowPositions do
		local pillowPos = pillowPositions[i]
		for x = -1, 1 do
			for y = -1, 1 do
				local item = Tile(pillowPos.center + Position(x, y, 0)):getThing(1)
				
				-- Wrong pillow arrangement
				if not item or item.itemid ~= pillowPos.itemid then
					player:teleportTo(fromPosition, true)
					fromPosition:sendMagicEffect(CONST_ME_TELEPORT)
					return true
				end
				
				pillows[#pillows + 1] = item
			end
		end
	end

	player:teleportTo(destination)
	destination:sendMagicEffect(CONST_ME_TELEPORT)

	-- Shuffle pillows
	for x = 1, 6 do
		for y = 1, 6 do
			local index = math.random(#pillows)
			pillows[index]:moveTo(topLeftPosition + Position(x, y, 0))
			table.remove(pillows, index)
		end
	end
	return true
end
