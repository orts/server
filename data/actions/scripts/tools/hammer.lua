function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if not target or not target:isItem() then
		return false
	end

	local targetActionId = target:getActionId()
	-- Lay down the wood
	if targetActionId == 50109 then
		if player:getItemCount(5901) >= 3 and player:getItemCount(8309) >= 3 then
			player:removeItem(5901, 3)
			player:removeItem(8309, 3)
			player:say("KLING KLONG!", TALKTYPE_MONSTER_SAY)

			local bridge = Game.createItem(5770, 1, Position(32571, 31508, 9))
			if bridge then
				bridge:setActionId(50110)
			end
		end

	-- Lay down the rails
	elseif targetActionId == 50110 then
		if player:getItemCount(10033) >= 1 and player:getItemCount(10034) >= 2 and player:getItemCount(8309) >= 3 then
			player:removeItem(10033, 1)
			player:removeItem(10034, 2)
			player:removeItem(8309, 3)
			player:say("KLING KLONG!", TALKTYPE_MONSTER_SAY)

			local rails = Game.createItem(7122, 1, Position(32571, 31508, 9))
			if rails then
				rails:setActionId(50111)
			end
		end
	else
		return false
	end

	return true
end
