function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	if player:getStorageValue(Storage.WrathoftheEmperor.PrisonReleaseStatus) == 1 then
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:teleportTo(Position(33363, 31188, 8))
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		-- doSetCreatureOutfit(cid, {lookType = 352}, 1) -- adjust to meta
		player:setStorageValue(Storage.WrathoftheEmperor.PrisonReleaseStatus, 0)
	end
	return true
end
