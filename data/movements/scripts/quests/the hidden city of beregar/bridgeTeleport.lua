function onStepIn(creature, item, position, fromPosition)
	if not creature:isPlayer() then
		return true
	end

	creature:teleportTo(Position(32637, 31509, 10))
	creature:getPosition():sendMagicEffect(CONST_ME_TELEPORT)

	return true
end
