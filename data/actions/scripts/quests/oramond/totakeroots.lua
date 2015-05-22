local function revertRoot(position, itemId, transformId)
	local item = Tile(position):getItemById(itemId)
	if item then
		item:transform(transformId)
	end
end

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local harvestedCount = player:getStorageValue(Storage.Oramond.HarvestedRootCount)
	local rand = math.random(1, 100)
	if item.itemid == 23475 then
		if((rand >= 1) and (rand < 50)) then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You successfully harvest some juicy roots.')
			player:addItem(23662, 1)
			item:transform(item.itemid + 2)
			addEvent(revertRoot, 300000, toPosition, 23477, 23475)
			toPosition:sendMagicEffect(CONST_ME_MAGIC_GREEN)
			if	player:getStorageValue(Storage.Oramond.MissionToTakeRoots) < 0 then
				player:setStorageValue(Storage.Oramond.HarvestedRootCount, 1)
				player:setStorageValue(Storage.Oramond.MissionToTakeRoots, 1)
				player:setStorageValue(Storage.Oramond.QuestLine, 1)
			elseif	player:getStorageValue(Storage.Oramond.MissionToTakeRoots) == 1 then
					player:setStorageValue(Storage.Oramond.HarvestedRootCount, harvestedCount + 1)
			end
		elseif((rand >= 50) and (rand < 100)) then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Your harvesting attempt destroyed more of the juicy roots than you could salvage.')
			item:transform(item.itemid + 2)
			addEvent(revertRoot, 300000, toPosition, 23477, 23475)
			toPosition:sendMagicEffect(CONST_ME_MAGIC_GREEN)
		end
	end
	if item.itemid == 23476 then
		if((rand >= 1) and (rand < 50)) then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You successfully harvest some juicy roots.')
			player:addItem(23662, 1)
			item:transform(item.itemid + 2)
			addEvent(revertRoot, 300000, toPosition, 23478, 23476)
			toPosition:sendMagicEffect(CONST_ME_MAGIC_GREEN)
			if	player:getStorageValue(Storage.Oramond.MissionToTakeRoots) < 0 then
				player:setStorageValue(Storage.Oramond.HarvestedRootCount, 1)
				player:setStorageValue(Storage.Oramond.MissionToTakeRoots, 1)
				player:setStorageValue(Storage.Oramond.QuestLine, 1)
			elseif	player:getStorageValue(Storage.Oramond.MissionToTakeRoots) == 1 then
					player:setStorageValue(Storage.Oramond.HarvestedRootCount, harvestedCount + 1)
			end
		elseif((rand >= 50) and (rand < 100)) then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Your harvesting attempt destroyed more of the juicy roots than you could salvage.')
			item:transform(item.itemid + 2)
			addEvent(revertRoot, 300000, toPosition, 23478, 23476)
			toPosition:sendMagicEffect(CONST_ME_MAGIC_GREEN)
		end
	end
	return true
end
