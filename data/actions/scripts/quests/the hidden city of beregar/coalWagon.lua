local config = {
	{wagon = 7131, stopPos = Position(32717, 31492, 11)},
	{wagon = 8749, stopPos = Position(32699, 31492, 11)}
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	for i = 1, #config do
		local table = config[i]
		local wagonPos = table.wagon:getPosition()
		if table.wagon == 7131 and wagonPos ~= table.stopPos then
			Tile(wagonPos):getTopTopItem():moveTo(wagonPos, x + 2)
		elseif table.wagon == 8749 and wagonPos ~= table.stopPos then
			Tile(wagonPos):getTopTopItem():moveTo(wagonPos, x - 2)
		end
	player:say("SQUEEEEAK", TALKTYPE_MONSTER_SAY, false, 0, wagonPos)
	end
	return true
end
