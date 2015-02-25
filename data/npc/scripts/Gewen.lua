local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
local lastSound = 0
function onThink()
	if lastSound < os.time() then
		lastSound = (os.time() + 5)
		if math.random(100) < 25 then
			Npc():say("Nothing beats the feeling of flying with a carpet!", TALKTYPE_SAY)
		end
	end
	npcHandler:onThink()
end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)
	if msgcontains(msg, 'ticket') then
		if player:getStorageValue(Storage.wagonTicket) >= os.time() then
			npcHandler:say('Your weekly ticket is still valid. Would be a waste of money to purchase a second one', cid)
			return true
		end

		npcHandler:say('Do you want to purchase a weekly ticket for the ore wagons? With it you can travel freely and swiftly through Kazordoon for one week. 250 gold only. Deal?', cid)
		npcHandler.topic[cid] = 1
	elseif npcHandler.topic[cid] == 1 then
		if msgcontains(msg, 'yes') then
			if not player:removeMoney(250) then
				npcHandler:say('You don\'t have enough money.', cid)
				return true
			end

			player:setStorageValue(Storage.wagonTicket, os.time() + 7 * 24 * 60 * 60)
			npcHandler:say('Here is your stamp. It can\'t be transferred to another person and will last one week from now. You\'ll get notified upon using an ore wagon when it isn\'t valid anymore.', cid)
		elseif msgcontains(msg, 'no') then
			npcHandler:say('No then.', cid)
		end
		npcHandler.topic[cid] = 0
	end
	return true
end

local travelNode = keywordHandler:addKeyword({'farmine'}, TravelLib.say, {npcHandler = npcHandler, text = 'Do you seek a ride to Farmine for %s?', cost = 60, discount = TravelLib.postmanDiscount, storage = Storage.TheNewFrontier.Mission10})
	travelNode:addChildKeyword({'yes'}, TravelLib.travel, {npcHandler = npcHandler, premium = true, level = 0, msg = 'Hold on!', cost = 60, discount = TravelLib.postmanDiscount, destination = Position(32983, 31539, 1) })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, reset = true, text = 'You shouldn\'t miss the experience.'})

local travelNode = keywordHandler:addKeyword({'darashia'}, TravelLib.say, {npcHandler = npcHandler, text = 'Do you seek a ride to Darashia on Darama for %s?', cost = 40, discount = TravelLib.postmanDiscount})
travelNode:addChildKeyword({'yes'}, TravelLib.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 40, msg = 'Hold on!', discount = TravelLib.postmanDiscount, destination = Position(33270, 32441, 6) })
travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, reset = true, text = 'You shouldn\'t miss the experience.'})

local travelNode = keywordHandler:addKeyword({'svargrond'}, TravelLib.say, {npcHandler = npcHandler, text = 'Do you seek a ride to Svargrond for %s', cost = 60, discount = TravelLib.postmanDiscount})
travelNode:addChildKeyword({'yes'}, TravelLib.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 60, msg = 'Hold on!', discount = TravelLib.postmanDiscount, destination = Position(32253, 31097, 4) })
travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, reset = true, text = 'You shouldn\'t miss the experience.'})

local travelNode = keywordHandler:addKeyword({'femor hills'}, TravelLib.say, {npcHandler = npcHandler, text = 'Do you seek a ride to the Femor Hills for %s', cost = 60, discount = TravelLib.postmanDiscount})
travelNode:addChildKeyword({'yes'}, TravelLib.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 60, msg = 'Hold on!', discount = TravelLib.postmanDiscount, destination = Position(32536, 31837, 4) })
travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, reset = true, text = 'You shouldn\'t miss the experience.'})

local travelNode = keywordHandler:addKeyword({'edron'}, TravelLib.say, {npcHandler = npcHandler, text = 'Do you seek a ride to the Edron for %s?', cost = 40, discount = TravelLib.postmanDiscount})
travelNode:addChildKeyword({'yes'}, TravelLib.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 40, msg = 'Hold on!', discount = TravelLib.postmanDiscount, destination = Position(33193, 31784, 3) })
travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, reset = true, text = 'You shouldn\'t miss the experience.'})

npcHandler:setMessage(MESSAGE_GREET, "Greetings, traveller |PLAYERNAME|. Where do you want me to {fly} you? Or do you need a weekly ticket for the Kazordoon public lorry transport?")
npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye!")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Good bye!")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
