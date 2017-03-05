local elevatorPosition = {
	Position(33638, 31903, 5), 
	Position(33638, 31903, 6) 
}

local config = {
	[1] = {
		fromPosition = elevatorPosition[1],
		toPosition = elevatorPosition[2],
		itemIds = { 23432, 23421 },
		transform = {
			position = { elevatorPosition[1], elevatorPosition[2] },
			itemId = { 23421, 23421 },
			transformId = { 23424, 23428 }
		},
		sound = 'Srrrt!',
		soundPosition = Position(33639, 31903, 5),
		relocatePosition = Position(33638, 31902, 5)
	},
	[2] = {
		fromPosition = elevatorPosition[2],
		toPosition = elevatorPosition[1],
		itemIds = { 23432, 23428 },
		transform = {
			position = { elevatorPosition[1], elevatorPosition[1] },
			itemId = { 23424, 23428 },
			transformId = { 23421, 23421 },
		},
		sound = 'Zrrrt!',
		soundPosition = Position(33639, 31903, 6),
		relocatePosition = Position(33638, 31904, 6)
	}
}

local winch = {
	[23422] = { config[2], config[1] },
	[23429] = { config[1], config[2] }
}

local relocate = true

local function moveElevator(config, player)
	for i = 1, #config.itemIds do
		local item = Tile(config.fromPosition):getItemById(config.itemIds[i])
		if item then
			item:moveTo(config.toPosition)
		end
	end

	for i = 1, #config.transform.position do
		local item = Tile(config.transform.position[i]):getItemById(config.transform.itemId[i])
		if item then
			item:transform(config.transform.transformId[i])
		end
	end

	if player then
		player:say(config.sound, TALKTYPE_MONSTER_YELL, false, player, config.soundPosition)
	end
end

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local useItem = winch[item.itemid]
	if not useItem then
		return true
	end

	toPosition.x = toPosition.x - 1
	local tile = Tile(toPosition)
	if not tile:getItemById(23432) then
		local option = useItem[1]
		if relocate then
			Tile(option.fromPosition):relocateTo(option.relocatePosition)
		end

		moveElevator(option, player)
		return true
	end

	local creature = tile:getTopCreature()
	if not creature or creature.uid ~= player.uid then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Step inside the elevator to use it.')
		return true
	end

	local option = useItem[2]
	moveElevator(option, player)
	player:teleportTo(option.toPosition)
	return true
end
