function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if player:getStorageValue(Storage.WrathoftheEmperor.CrateStatus) ~= 1 and player:getStorageValue(Storage.WrathoftheEmperor.Questline) == 2 then
		player:setOutfit({lookTypeEx = 12496}, -1)
		player:setStorageValue(Storage.WrathoftheEmperor.CrateStatus, 1)
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
	end
	return true
end