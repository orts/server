function onCastSpell(creature, var, isHotkey)
	local position = Variant.getPosition(var)
	if position ~= Position(32824, 32243, 12) then
		local tile = position:getTile()
		local field = tile and tile:getItemByType(ITEM_TYPE_MAGICFIELD)
		if field and isInArray(FIELDS, field.itemid) then
			field:remove()
			position:sendMagicEffect(CONST_ME_POFF)
			return true
		end
	end

	creature:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
	creature:getPosition():sendMagicEffect(CONST_ME_POFF)
	return false
end
