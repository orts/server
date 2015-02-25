local teleportPosition = Position(33075, 31878, 12)

local function transformTeleport()
	local teleportItem = Tile(teleportPosition):getItemById(1387)
	if not teleportItem then
		return
	end

	teleportItem:transform(18463)
end

local function clearArena()
	local spectators = Game.getSpectators(Position(33088, 31911, 12), false, false, 12, 12, 12, 12)
	local exitPosition = Position(32993, 31912, 12)
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

function onKill(creature, target)
	local targetMonster = target:getMonster()
	if not targetMonster then
		return true
	end

	if targetMonster:getName():lower() ~= 'versperoth' then
		return true
	end

	Game.setStorageValue(GlobalStorage.Versperoth.Battle, 2)
	addEvent(Game.setStorageValue, 30 * 60 * 1000, GlobalStorage.Versperoth.Battle, 0)

	local holeItem = Tile(teleportPosition):getItemById(18462)
	if holeItem then
		holeItem:transform(1387)
	end
	Game.createMonster('abyssador', Position(33086, 31907, 12))

	addEvent(transformTeleport, 30 * 60 * 1000)
	addEvent(clearArena, 32 * 60 * 1000)
	return true
end
