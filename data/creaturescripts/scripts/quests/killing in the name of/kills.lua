function onKill(creature, target)
	if target:isPlayer() or target:getMaster() then
		return true
	end

	local player, targetName = creature:getPlayer(), target:getName():lower()
	for _, taskId in ipairs(player:getStartedTasks()) do
		if isInArray(tasks[taskId].creatures, targetName) then
			local killAmount = player:getStorageValue(KILLSSTORAGE_BASE + taskId)
			if killAmount < tasks[taskId].killsRequired then
				player:setStorageValue(KILLSSTORAGE_BASE + taskId, killAmount + 1)
			end
		end
	end
	return true
end