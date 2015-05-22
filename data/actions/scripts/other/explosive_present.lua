function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	player:say("KABOOOOOOOOOOM!", TALKTYPE_MONSTER_SAY)
	player:getPosition():sendMagicEffect(CONST_ME_EXPLOSIONHIT)
	item:remove()
	return true
end