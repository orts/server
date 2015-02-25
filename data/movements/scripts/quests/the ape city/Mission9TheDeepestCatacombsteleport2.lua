local config = {
	amphoraPositions = {
		Position(32792, 32527, 10),
		Position(32823, 32525, 10),
		Position(32876, 32584, 10),
		Position(32744, 32586, 10)
	},
	brokenAmphoraId = 4997
}


function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	for i = 1, #config.amphoraPositions do
		local amphoraItem = Tile(config.amphoraPositions[i]):getItemById(config.brokenAmphoraId)
		if not amphoraItem then
			player:teleportTo({x = 32852, y = 32544, z = 10})
			position:sendMagicEffect(CONST_ME_TELEPORT)
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:sendTextMessage(MESSAGE_STATUS_SMALL, "There are 4 large amphoras that must be broken in order to open the teleporter.")
			return true
		end
	end

	player:teleportTo({x = 32885, y = 32632, z = 11})
	position:sendMagicEffect(CONST_ME_TELEPORT)
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	return true
end


