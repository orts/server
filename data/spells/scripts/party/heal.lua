local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, 0)

local area = createCombatArea(AREA_CROSS5X5)
combat:setArea(area)

local condition = Condition(CONDITION_REGENERATION)
condition:setParameter(CONDITION_PARAM_SUBID, 1)
condition:setParameter(CONDITION_PARAM_BUFF_SPELL, 1)
condition:setParameter(CONDITION_PARAM_TICKS, 2 * 60 * 1000)
condition:setParameter(CONDITION_PARAM_HEALTHGAIN, 20)
condition:setParameter(CONDITION_PARAM_HEALTHTICKS, 2000)

function onCastSpell(creature, var)
	local position = creature:getPosition()
	local party = creature:getParty()
	if not party or party:getMemberCount() < 1 then
		creature:sendCancelMessage('No party members in range.')
		position:sendMagicEffect(CONST_ME_POFF)
		return false
	end

	local partyMembers, affected, member = party:getMembers(), {}
	for i = 1, #partyMembers do
		member = partyMembers[i]
		if member:getPosition():getDistance(position) <= 36 then
			affected[#affected + 1] = member
		end
	end

	local tmp = #affected
	if tmp < 1 then
		creature:sendCancelMessage('No party members in range.')
		position:sendMagicEffect(CONST_ME_POFF)
		return false
	end

	local mana = math.ceil((0.9 ^ (tmp - 1) * 120) * tmp)
	if creature:getMana() < mana then
		creature:sendCancelMessage(RETURNVALUE_NOTENOUGHMANA)
		position:sendMagicEffect(CONST_ME_POFF)
		return false
	end

	if not combat:execute(creature, var) then
		creature:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
		position:sendMagicEffect(CONST_ME_POFF)
		return false
	end

	creature:addMana(-(mana - 120), false)
	creature:addManaSpent((mana - 120) * configManager.getNumber(configKeys.RATE_MAGIC))
	creature:addCondition(condition)
	for i = 1, #affected do
		affected[i]:addCondition(condition)
	end

	return true
end
