local condition = Condition(CONDITION_PARALYZE)
condition:setParameter(CONDITION_PARAM_TICKS, 2000)
condition:setFormula(-0.9, 0, -0.9, 0)

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	if item.actionid == 7816 then
		local chance = math.random(5)
		if chance == 1 then
			player:teleportTo(fromPosition)
		elseif chance == 2 then
			position.y = position.y + 1
			player:teleportTo(position, true)
			player:setDirection(DIRECTION_SOUTH)
		elseif chance == 3 then
			player:addCondition(condition)
		end

	elseif item.actionid == 7817 then
		player:setStorageValue(Storage.BigfootBurden.QuestLine, 11)
		player:teleportTo(Position(32760, 31811, 10))
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You passed endurance test.')

	elseif item.actionid == 7818 then
		if player:getStorageValue(Storage.BigfootBurden.QuestLine) == 10 then
			player:teleportTo(Position(32759, 31811, 11))
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		else
			player:teleportTo(fromPosition)
		end
	end
	return true
end
