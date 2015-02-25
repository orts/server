local config = {
	firstboss = "snake god essence",
	bossPosition = Position(33365, 31407, 10),

	trap = "plaguethrower",
	trapPositions = {
		Position(33355, 31403, 10),
		Position(33364, 31403, 10),
		Position(33355, 31410, 10),
		Position(33364, 31410, 10)
	},
	startareaPosition = Position(33357, 31404, 9),
	arenaPosition = Position(33359, 31406, 10)
}


function onUse(player, item, fromPosition, target, toPosition, isHotkey)

	if Game.getStorageValue(Storage.WrathoftheEmperor.Mission11) == 1 then
		player:sendTextMessage(MESSAGE_STATUS_SMALL, 'The arena is already in use.')
		return true
	end

	Game.setStorageValue(Storage.WrathoftheEmperor.Mission11, 1)

	local monsters = Game.getSpectators(config.arenaPosition, false, true, 10, 10, 10, 10)
	for _, monster in ipairs(monsters) do
		monster:remove()
	end

	local spectators = Game.getSpectators(config.startareaPosition, false, true, 0, 5, 0, 5)
	for _, spectator in ipairs(spectators) do
		spectator:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		spectator:teleportTo(config.arenaPosition)
		config.arenaPosition:sendMagicEffect(CONST_ME_TELEPORT)
	end

	for i = 1, #config.trapPositions do
		Game.createMonster(config.trap, config.trapPositions[i])
	end

	Game.createMonster(config.firstboss, config.bossPosition)
	item:transform(item.itemid == 1945 and 1946 or 1945)
	return true
end
