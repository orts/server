local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_GREEN)

local condition = createConditionObject(CONDITION_OUTFIT)
setConditionParam(condition, CONDITION_PARAM_TICKS, 20000)
addOutfitCondition(condition, 0, 230, 0, 0, 0, 0)
addOutfitCondition(condition, 0, 231, 0, 0, 0, 0)
addOutfitCondition(condition, 0, 232, 0, 0, 0, 0)
addOutfitCondition(condition, 0, 233, 0, 0, 0, 0)
addOutfitCondition(condition, 0, 234, 0, 0, 0, 0)
addOutfitCondition(condition, 0, 235, 0, 0, 0, 0)
addOutfitCondition(condition, 0, 236, 0, 0, 0, 0)
addOutfitCondition(condition, 0, 237, 0, 0, 0, 0)
addOutfitCondition(condition, 0, 238, 0, 0, 0, 0)
addOutfitCondition(condition, 0, 239, 0, 0, 0, 0)
addOutfitCondition(condition, 0, 240, 0, 0, 0, 0)
addOutfitCondition(condition, 0, 241, 0, 0, 0, 0)
addOutfitCondition(condition, 0, 242, 0, 0, 0, 0)
addOutfitCondition(condition, 0, 243, 0, 0, 0, 0)
addOutfitCondition(condition, 0, 244, 0, 0, 0, 0)
addOutfitCondition(condition, 0, 245, 0, 0, 0, 0)
addOutfitCondition(condition, 0, 246, 0, 0, 0, 0)
addOutfitCondition(condition, 0, 247, 0, 0, 0, 0)
setCombatCondition(combat, condition)

local area = createCombatArea({
	{1, 1, 1},
	{1, 3, 1},
	{1, 1, 1}
})
setCombatArea(combat, area)

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end
