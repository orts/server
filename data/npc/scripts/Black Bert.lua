local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()		npcHandler:onThink()		end

local voices = { {text = 'Psst! Over here!'} }
npcHandler:addModule(VoiceModule:new(voices))

local function getTable(player)
	local itemsList = {}
	local buyList = {
		{id = 10942, buy = 600},		-- Almanac of Magic
		{id = 10154, buy = 10000},		-- Animal Fetish
		{id = 10943, buy = 600},		-- Baby Rotworm
		{id = 7500, buy = 6000},		-- Bale of White Cloth
		{id = 2329, buy = 8000},		-- Bill
		{id = 9369, buy = 50000},		-- Blood Crystal
		{id = 10159, buy = 10000},		-- Bloodkiss Flower
		{id = 10109, buy = 5000},		-- Bundle of Rags
		{id = 10615, buy = 1000},		-- Carrying Device
		{id = 7499, buy = 2000},		-- Cigar
		{id = 2347, buy = 150},			-- Cookbook
		{id = 14338, buy = 40000},		-- Damaged Logbook
		{id = 14352, buy = 17000},		-- Dark Essence
		{id = 10158, buy = 13000},		-- Deep Crystal
		{id = 10169, buy = 8000},		-- Elemental Crystal
		{id = 11397, buy = 600},		-- Empty Beer Bottle
		{id = 8111, buy = 100},			-- Exploding Cookie
		{id = 12501, buy = 4000},		-- Exquisite Silk
		{id = 12503, buy = 4000},		-- Exquisite Wood
		{id = 12500, buy = 600},		-- Faded Last Will
		{id = 4845, buy = 1000},		-- Family Brooch
		{id = 7708, buy = 15000},		-- Family Signet Ring
		{id = 10308, buy = 10000},		-- Fan Club Membership Card
		{id = 10616, buy = 1000},		-- Filled Carrying Device
		{id = 8766, buy = 7000},		-- Fishnapped Goldfish
		{id = 10926, buy = 700},		-- Flask of Crown Polisher
		{id = 11106, buy = 1000},		-- Flask of Extra Greasy Oil
		{id = 10760, buy = 1000},		-- Flask of Poison
		{id = 12506, buy = 4000},		-- Flexible Dragon Scale
		{id = 14351, buy = 5000},		-- Formula for a Memory Potion
		{id = 4858, buy = 6000},		-- Funeral Urn
		{id = 9662, buy = 50000},		-- Ghost's Tear
		{id = 4843, buy = 24000},		-- Giant Ape's Hair
		{id = 10165, buy = 13500},		-- Golem Blueprint
		{id = 10173, buy = 25000},		-- Golem Head
		{id = 10454, buy = 350},		-- Headache Pill
		{id = 2330, buy = 8000},		-- Letterbag
		{id = 12285, buy = 1000},		-- Lump of Clay
		{id = 10307, buy = 8500},		-- Machine Crate
		{id = 12508, buy = 4000},		-- Magic Crystal
		{id = 10167, buy = 13000},		-- Mago Mechanic Core
		{id = 10928, buy = 650},		-- Map to the Unknown
		{id = 7281, buy = 500},			-- Memory Crystal
		{id = 4852, buy = 3000},		-- Memory Stone
		{id = 12507, buy = 4000},		-- Mystic Root
		{id = 10225, buy = 5250},		-- Nautical Map
		{id = 12505, buy = 4000},		-- Old Iron
		{id = 10170, buy = 13000},		-- Old Power Core
		{id = 10613, buy = 1000},		-- Plans for a Strange Device
		{id = 11104, buy = 1000},		-- Rare Crystal
		{id = 12297, buy = 1000},		-- Sacred Earth
		{id = 10155, buy = 12500},		-- Shadow Orb
		{id = 4854, buy = 500},			-- Sheet of Tracing Paper
		{id = 7697, buy = 15000},		-- Suspicious Signet Ring
		{id = 4846, buy = 8000},		-- Snake Destroyer
		{id = 10945, buy = 666},		-- Soul Contract
		{id = 14323, buy = 5000},		-- Special Flask
		{id = 12502, buy = 4000},		-- Spectral Cloth
		{id = 4847, buy = 15000},		-- Spectral Dress
		{id = 2345, buy = 3000},		-- Spyreport
		{id = 10166, buy = 12500},		-- Stabilizer
		{id = 15389, buy = 5000},		-- Strange Powder
		{id = 12504, buy = 4000},		-- Strong Sinew
		{id = 2346, buy = 16000},		-- Tear of Daraman
		{id = 7699, buy = 5000},		-- Technomancer Beard
		{id = 9733, buy = 8000},		-- The Alchemists' Formulas
		{id = 8752, buy = 10000},		-- The Ring of the Count
		{id = 7487, buy = 16000},		-- Toy Mouse
		{id = 10944, buy = 550},		-- Universal Tool
		{id = 12295, buy = 1000},		-- Unworked Sacred Wood
		{id = 4838, buy = 18000},		-- Whisper Moss
		{id = 10157, buy = 12500},		-- Worm Queen Tooth
		{id = 14336, buy = 4000}		-- Wrinkled Parchment
	}

	if player:getStorageValue(Storage.thievesGuild.Quest) >= 9 then
		for i = 1, #buyList do
			itemsList[#itemsList] = buyList[i]
		end
	end

	return itemsList
end

local function setNewTradeTable(table)
	local items, item = {}
	for i = 1, #table do
		item = table[i]
		items[item.id] = {itemId = item.id, buyPrice = item.buy, sellPrice = item.sell, subType = 0, realName = item.name}
	end
	return items
end

local function creatureSayCallback(cid, type, msg)
	if msgcontains(msg, "trade") then
		local player = Player(cid)
		local items = setNewTradeTable(getTable(player))
		local function onBuy(cid, item, subType, amount, ignoreCap, inBackpacks)
			if (ignoreCap == false and (player:getFreeCapacity() < ItemType(items[item].itemId):getWeight(amount) or inBackpacks and player:getFreeCapacity() < (ItemType(items[item].itemId):getWeight(amount) + ItemType(1988):getWeight()))) then
				return player:sendTextMessage(MESSAGE_STATUS_SMALL, 'You don\'t have enough cap.')
			end
			if items[item].buybuy <= player:getMoney() then
				if inBackpacks then
					local container = Game.createItem(1988, 1)
					local bp = player:addItemEx(container)
					if(bp ~= 1) then
						return player:sendTextMessage(MESSAGE_STATUS_SMALL, 'You don\'t have enough container.')
					end
					for i = 1, amount do
						container:addItem(items[item].itemId, items[item])
					end
				else
					return
					player:addItem(items[item].itemId, amount, false, items[item]) and
					player:removeMoney(amount * items[item].buybuy) and
					player:sendTextMessage(MESSAGE_INFO_DESCR, 'You bought '..amount..'x '..items[item].realName..' for '..items[item].buybuy * amount..' gold coins.')
				end
				player:sendTextMessage(MESSAGE_INFO_DESCR, 'You bought '..amount..'x '..items[item].realName..' for '..items[item].buybuy * amount..' gold coins.')
				player:removeMoney(amount * items[item].buybuy)
			else
				player:sendTextMessage(MESSAGE_STATUS_SMALL, 'You do not have enough money.')
			end
			return true
			end

		local function onSell(cid, item, subType, amount, ignoreEquipped)
			if items[item].sellbuy then
				return
				player:removeItem(items[item].itemId, amount, -1, ignoreEquipped) and
				player:addMoney(items[item].sellbuy * amount) and

				player:sendTextMessage(MESSAGE_INFO_DESCR, 'You sold '..amount..'x '..items[item].realName..' for '..items[item].sellbuy * amount..' gold coins.')
			end
			return true
		end

		openShopWindow(cid, getTable(player), onBuy, onSell)
		npcHandler:say("Keep in mind you won't find better offers here. Just browse through my wares.", cid)
	end
	return true
end

npcHandler:setMessage(MESSAGE_GREET, 'Hello.')
npcHandler:setMessage(MESSAGE_FAREWELL, 'It was a pleasure to help you, |PLAYERNAME|.')

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
