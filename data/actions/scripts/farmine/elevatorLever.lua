local config = {
	[9118] = Position(32991, 31539, 4),
	[9119] = Position(32991, 31539, 1),
	[9120] = Position(33061, 31527, 14),
	[9121] = Position(32993, 31547, 4)
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local targetPosition = config[item.actionid]
	if not targetPosition then
		return true
	end

	item:transform(item.itemid == 1945 and 1946 or 1945)

	toPosition.x = toPosition.x - 1
	local creature = Tile(toPosition):getTopCreature()
	if not creature or not creature:isPlayer() then
		return true
	end

	if item.itemid ~= 1945 then
		return true
	end

	if item.actionid == 9120 then
		if creature:getStorageValue(Storage.TheNewFrontier.Mission05) == 7 then
			targetPosition.z = 10
		elseif creature:getStorageValue(Storage.TheNewFrontier.Mission03) == 3 then
			targetPosition.z = 12
		end
	end

	creature:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	creature:teleportTo(targetPosition)
	targetPosition:sendMagicEffect(CONST_ME_TELEPORT)
	return true
end
