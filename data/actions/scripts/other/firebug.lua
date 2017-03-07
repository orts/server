function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	-- Dreamer Challenge Quest
	if target.uid == 2243 then
		target:transform(1387)
		toPosition:sendMagicEffect(CONST_ME_FIREAREA)
		item:remove()
		return true
	end

	-- The Hidden City of Beregar
	if target.itemid == 8642 and target.actionid == 50119 then
		target:transform(8641)
		return true
	end

	local random = math.random(10)
	if random >= 4 then -- success 6% chance
		if target.itemid == 7538 then -- Destroy spider webs/North - South
			toPosition:sendMagicEffect(CONST_ME_HITBYFIRE)
			target:transform(7544)
			target:decay()
		elseif target.itemid == 7539 then -- Destroy spider webs/EAST- West
			toPosition:sendMagicEffect(CONST_ME_HITBYFIRE)
			target:transform(7545)
			target:decay()
		elseif target.itemid == 5466 then -- Burn Sugar Cane
			toPosition:sendMagicEffect(CONST_ME_FIREAREA)
			target:transform(5465)
			target:decay()
		elseif target.itemid == 1485 then -- Light Up empty coal basins
			toPosition:sendMagicEffect(CONST_ME_HITBYFIRE)
			target:transform(1484)
		elseif target.actionid == 12550 or target.actionid == 12551 then -- Secret Service Quest
			if player:getStorageValue(Storage.secretService.TBIMission01) == 1 then
				Game.createItem(1487, 1, Position(32893, 32012, 6))
				player:setStorageValue(Storage.secretService.TBIMission01, 2)
			end
		end
	elseif random == 2 then -- it remove the fire bug 2% chance
		item:remove(1)
		toPosition:sendMagicEffect(CONST_ME_POFF)
	elseif random == 1 then -- it explode on the user 1% chance
		doTargetCombatHealth(0, player, COMBAT_FIREDAMAGE, -5, -5, CONST_ME_HITBYFIRE)
		player:say('OUCH!', TALKTYPE_MONSTER_SAY)
		item:remove(1)
	else
		toPosition:sendMagicEffect(CONST_ME_POFF) -- it fails, but dont get removed 3% chance
	end

	return true
end
