local positions = {
	Position(33097, 31976, 11),
	Position(33097, 31977, 11),
	Position(33097, 31978, 11),
	Position(33097, 31979, 11)
}


local barrierPositions = {
	Position(33098, 31976, 11),
	Position(33098, 31977, 11),
	Position(33098, 31978, 11),
	Position(33098, 31979, 11)
}

local function clearArena()
	local spectators = Game.getSpectators(Position(33114, 31956, 11), false, false, 10, 10, 13, 13)
	local exitPosition = Position(33011, 31937, 11)
	for i = 1, #spectators do
		local spectator = spectators[i]
		if spectator:isPlayer() then
			spectator:teleportTo(exitPosition)
			exitPosition:sendMagicEffect(CONST_ME_TELEPORT)
			spectator:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You were teleported out by the gnomish emergency device.')
		else
			spectator:remove()
		end
	end
end

-- This script is unfinished after conversion, but I doubt that it was working as intended before
-- 'last' can never be true
function onKill(creature, target)
	local targetMonster = target:getMonster()
	if not targetMonster then
		return true
	end

	if targetMonster:getName():lower() ~= 'parasite' or Game.getStorageValue(GlobalStorage.Weeper) >= 1 then
		return true
	end

	local targetPosition = targetMonster:getPosition()
	local barrier = false
	for i = 1, #positions do
		if targetPosition == positions[i] then
			barrier = true
			break
		end
	end

	if not barrier then
		return true
	end

	local last = false
	local tile, item
	for i = 1, #barrierPositions do
		tile = Tile(barrierPositions[i])
		if tile then
			item = tile:getItemById(18459)
			if item then
				item:transform(19460)
			end

			item = tile:getItemById(18460)
			if item then
				item:transform(19461)
			end

			--[[
			elseif(getTileItemById(barrier[i], 18459).uid > 0) then
				doRemoveItem(getTileItemById(barrier[i], 18461).uid, 1)
				addEvent(doCreateItem, 30 * 60 * 1000, 18459, 1, barrier[i])
				last = true
			end
			]]
		end
	end

	if not last then
		return true
	end

	Game.setStorageValue(GlobalStorage.Weeper, 1)
	addEvent(Game.setStorageValue, 30 * 60 * 1000, GlobalStorage.Weeper, 0)
	Game.createMonster('gnomevil', Position(33114, 31953, 11))
	addEvent(clearArena, 32 * 60 * 1000)
	return true
end