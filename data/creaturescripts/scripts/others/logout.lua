function onLogout(player)
	local playerId, staminaTable = player.uid, Game.getStorageValue("stamina")
	if staminaTable[playerId] then
		staminaTable[playerId] = nil
	end
	return true
end
