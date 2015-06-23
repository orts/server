unlockedDoors = { }

local function isDoorLocked(keyId, position)
	if keyId == 0 then
		return false
	end

	if unlockedDoors[keyId] then
		for i = 1, #unlockedDoors[keyId] do
			if position == unlockedDoors[keyId][i] then
				return false
			end
		end
	end

	return true
end

local function toggleDoorLock(doorItem, locked)
	local doorId = doorItem:getId()
	local keyId = doorItem:getActionId()
	local doorPosition = doorItem:getPosition()

	if locked then
		for i = #unlockedDoors[keyId], 1, -1 do
			if unlockedDoors[keyId][i] == doorPosition then
				table.remove(unlockedDoors[keyId], i)
			end
		end

		if not doors[doorId] then
			doorItem:transform(doorId - 1)
		end
		return
	end

	if not unlockedDoors[keyId] then
		unlockedDoors[keyId] = {}
	end

	doorItem:transform(doors[doorId])
	unlockedDoors[keyId][#unlockedDoors[keyId] + 1] = doorPosition
end

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local itemId, actionId = item:getId(), item:getActionId()
	if isInArray(questDoors, itemId) then
		if player:getStorageValue(actionId) ~= -1 then
			item:transform(itemId + 1)
			player:teleportTo(toPosition, true)
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The door seems to be sealed against unwanted intruders.")
		end
		return true

	elseif isInArray(levelDoors, itemId) then
		if actionId > 0 and player:getLevel() >= actionId - 1000 then
			item:transform(itemId + 1)
			player:teleportTo(toPosition, true)
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Only the worthy may pass.")
		end
		return true

	elseif isInArray(keys, itemId) then
		if not target
				or not target:isItem()
				or not target:getType():isDoor()
				or Tile(toPosition):getHouse() then
			return false
		end

		local targetId = target:getId()
		if isInArray(openSpecialDoors, targetId)
				or isInArray(questDoors, targetId)
				or isInArray(levelDoors, targetId) then
			return false
		end

		local targetActionId = target:getActionId()
		if targetActionId > 0 and actionId == targetActionId then
			if not isDoorLocked(targetActionId, toPosition) then
				toggleDoorLock(target, true)
			elseif doors[targetId] then
				toggleDoorLock(target, false)
			end
		else
			player:sendCancelMessage("The key does not match.")
		end

		return true
	end

	if isInArray(horizontalOpenDoors, itemId) or isInArray(verticalOpenDoors, itemId) then
		local doorCreature = Tile(toPosition):getTopCreature()
		if doorCreature then
			toPosition.x = toPosition.x + 1
			local query = Tile(toPosition):queryAdd(doorCreature, bit.bor(FLAG_IGNOREBLOCKCREATURE, FLAG_PATHFINDING))
			if query ~= RETURNVALUE_NOERROR then
				toPosition.x = toPosition.x - 1
				toPosition.y = toPosition.y + 1
				query = Tile(toPosition):queryAdd(doorCreature, bit.bor(FLAG_IGNOREBLOCKCREATURE, FLAG_PATHFINDING))
			end

			if query ~= RETURNVALUE_NOERROR then
				player:sendCancelMessage(query)
				return true
			end

			doorCreature:teleportTo(toPosition, true)
		end
		if not isInArray(openSpecialDoors, itemId) then
			item:transform(itemId - 1)
		end
		return true
	end

	if doors[itemId] then
		if not isDoorLocked(actionId, toPosition) then
			item:transform(doors[itemId])
		else
			player:sendTextMessage(MESSAGE_INFO_DESCR, "It is locked.")
		end
		return true
	end

	return false
end
