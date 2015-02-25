function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	--The Ice Islands Quest
	if player:getStorageValue(Storage.TheIceIslands.Questline) >= 21 then
		if target.itemid == 388 then
			if player:getStorageValue(Storage.TheIceIslands.SulphurLava) < 1 then
				player:addItem(8301, 1)
				player:setStorageValue(Storage.TheIceIslands.SulphurLava, 1)
				toPosition:sendMagicEffect(CONST_ME_MAGIC_RED)
				player:say('You retrive a fine sulphur from a lava hole.', TALKTYPE_MONSTER_SAY)
			end
		elseif target.itemid == 4184 then
			if player:getStorageValue(Storage.TheIceIslands.SporesMushroom) < 1 then
				player:addItem(7251, 1)
				player:setStorageValue(Storage.TheIceIslands.SporesMushroom, 1)
				toPosition:sendMagicEffect(CONST_ME_MAGIC_RED)
				player:say('You retrive spores from a mushroom.', TALKTYPE_MONSTER_SAY)
			end
		end
	end

	-- What a foolish Quest - Mission 8 (Sulphur)
	if target.itemid == 8573 then
		if player:getStorageValue(Storage.WhatAFoolishQuest.Questline) ~= 21
				or player:getStorageValue(Storage.WhatAFoolishQuest.InflammableSulphur) == 1 then
			return true
		end

		player:setStorageValue(Storage.WhatAFoolishQuest.InflammableSulphur, 1)
		player:addItem(8204, 1)
		toPosition:sendMagicEffect(CONST_ME_YELLOW_RINGS)
	end
	return true
end
