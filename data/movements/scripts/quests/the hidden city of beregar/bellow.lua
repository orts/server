function onStepIn(creature, item, position, fromPosition)
	if not creature:isPlayer() then
		return true
	end

	local crucibleItem = Tile(Position(32699, 31495, 11)):getItemById(10040)
	if not crucibleItem then
		return true
	end

	if crucibleItem.actionid == 0 then
		crucibleItem:setActionId(50120)
		Position(32696, 31494, 11):sendMagicEffect(CONST_ME_POFF)
	elseif crucibleItem.actionid == 50120 then
		crucibleItem:setActionId(50121)
		Position(32695, 31494, 10):sendMagicEffect(CONST_ME_POFF)
	elseif crucibleItem.actionid == 50121 then
		Tile(Position(32699, 31494, 11)):getItemById(8641):setActionId(50121)
		creature:say('TSSSSHHHHH', TALKTYPE_MONSTER_SAY, false, 0, Position(32695, 31494, 11))
		creature:say('CHOOOOOOOHHHHH', TALKTYPE_MONSTER_SAY, false, 0, Position(32698, 31492, 11))
	end
	return true
end
