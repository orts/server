local config = {
	[4226] = {premium = true, destination = Position(32243, 32598, 8)},
	[4227] = {destination = Position(32624, 31855, 11)},
	[4228] = {level = {25, 49}, destination = Position(32228, 32596, 8)},
	[4229] = {destination = Position(32237, 32605, 8)},
	[4230] = {level = {25, 49}, destination = Position(32244, 32618, 9)},
	[4231] = {destination = Position(32237, 32605, 9)},
	[4232] = {level = {25, 49}, destination = Position(32241, 32619, 10)},
	[4233] = {destination = Position(32237, 32605, 10)},
	[4234] = {level = {50, 79}, destination = Position(32228, 32591, 11)},
	[4235] = {destination = Position(32237, 32605, 11)},
	[4236] = {level = {50, 79}, destination = Position(32237, 32613, 12)},
	[4237] = {destination = Position(32237, 32605, 12)},
	[4238] = {level = 80, destination = Position(32243, 32610, 13)},
	[4239] = {destination = Position(32237, 32605, 13)},
	[4240] = {level = 80, destination = Position(32243, 32581, 14)},
	[4241] = {destination = Position(32237, 32605, 14)},
	[4242] = {level = 80, destination = Position(32225, 32599, 15)},
	[4243] = {destination = Position(32237, 32605, 15)}
}

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local targetPortal = config[item.actionid]
	if not targetPortal then
		return true
	end

	if targetPortal.premium then
		if not player:isPremium() then
			local toPosition = Position(32624, 31855, 11)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Only premium accounts can use this teleporter.')
			player:teleportTo(toPosition)
			position:sendMagicEffect(CONST_ME_TELEPORT)
			toPosition:sendMagicEffect(CONST_ME_TELEPORT)
			return true
		end
	end

	if targetPortal.level then
		local inRange
		if type(targetPortal.level) == 'table' then
			inRange = player:getLevel() >= targetPortal.level[1] and player:getLevel() <= targetPortal.level[2]
		else
			inRange = player:getLevel() >= targetPortal.level
		end

		if not inRange then
			local toPosition = Position(32237, 32605, position.z)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'This area is not suitable for your skills.')
			player:teleportTo(toPosition)
			position:sendMagicEffect(CONST_ME_TELEPORT)
			toPosition:sendMagicEffect(CONST_ME_TELEPORT)
			return true
		end
	end

	player:teleportTo(targetPortal.destination)
	position:sendMagicEffect(CONST_ME_TELEPORT)
	targetPortal.destination:sendMagicEffect(CONST_ME_TELEPORT)
	return true
end
