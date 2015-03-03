function onKill(player, target)
	if target:isPlayer() or target:getMaster() then
		return true
	end

	local targetName, taskId = target:getName():lower()
	for i = 1, #player:getStartedTasks() do
		taskId = player:getStartedTasks()[i]
		if isInArray(tasks[taskId].creatures, targetName) then
			local killAmount = player:getStorageValue(KILLSSTORAGE_BASE + taskId)
			if killAmount < tasks[taskId].killsRequired then
				player:setStorageValue(KILLSSTORAGE_BASE + taskId, killAmount + 1)
			end
		end
	end
	return true
end