function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local destination = Position(33187, 31206, 7)
	if item.actionid == 12136 then
	player:teleportTo(destination)
	destination:sendMagicEffect(CONST_ME_POFF)
	fromPosition:sendMagicEffect(CONST_ME_POFF)
	player:say("The slippery vines barely hold your weight and you rather slide than climb down.", TALKTYPE_MONSTER_SAY)
	end
	if item.actionid == 12137 then
	fromPosition:sendMagicEffect(46)
	player:say("The vines are too slippery down here to climb them.", TALKTYPE_MONSTER_SAY)
	end
	return true
end