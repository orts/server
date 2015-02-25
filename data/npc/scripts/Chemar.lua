local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
local voices = {
	'Ask me if you need letters or parcels. I\'ll deliver them via airmail, of course!',
	'Feel the wind in your hair during one of my carpet rides!'
}

local lastSound = 0
function onThink()
	if lastSound < os.time() then
		lastSound = (os.time() + 10)
		if math.random(100) < 20 then
			Npc():say(voices[math.random(#voices)], TALKTYPE_SAY)
		end
	end
	npcHandler:onThink()
end

local travelNode = keywordHandler:addKeyword({'farmine'}, TravelLib.say, {npcHandler = npcHandler, text = 'Do you seek a ride to Farmine for %s?', cost = 60, discount = TravelLib.postmanDiscount, storage = Storage.TheNewFrontier.Mission10})
	travelNode:addChildKeyword({'yes'}, TravelLib.travel, {npcHandler = npcHandler, premium = true, level = 0, msg = 'Hold on!', cost = 60, discount = TravelLib.postmanDiscount, destination = Position(32983, 31539, 1) })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, reset = true, text = 'You shouldn\'t miss the experience.'})

local travelNode = keywordHandler:addKeyword({'edron'}, TravelLib.say, {npcHandler = npcHandler, text = 'Do you seek a ride to Edron for %s?', cost = 40, discount = TravelLib.postmanDiscount})
	travelNode:addChildKeyword({'yes'}, TravelLib.travel, {npcHandler = npcHandler, premium = true, level = 0, msg = 'Hold on!', cost = 40, discount = TravelLib.postmanDiscount, destination = Position(33193, 31784, 3) })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, reset = true, text = 'You shouldn\'t miss the experience.'})

local travelNode = keywordHandler:addKeyword({'svargrond'}, TravelLib.say, {npcHandler = npcHandler, text = 'Do you seek a ride to Svargrond for %s?', cost = 60, discount = TravelLib.postmanDiscount})
	travelNode:addChildKeyword({'yes'}, TravelLib.travel, {npcHandler = npcHandler, premium = true, level = 0, msg = 'Hold on!', cost = 60, discount = TravelLib.postmanDiscount, destination = Position(32253, 31097, 4) })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, reset = true, text = 'You shouldn\'t miss the experience.'})

local travelNode = keywordHandler:addKeyword({'femor hills'}, TravelLib.say, {npcHandler = npcHandler, text = 'Do you seek a ride to the Femor Hills for %s?', cost = 60, discount = TravelLib.postmanDiscount})
	travelNode:addChildKeyword({'yes'}, TravelLib.travel, {npcHandler = npcHandler, premium = true, level = 0, msg = 'Hold on!', cost = 60, discount = TravelLib.postmanDiscount, destination = Position(32536, 31837, 4) })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, reset = true, text = 'You shouldn\'t miss the experience.'})

local travelNode = keywordHandler:addKeyword({'hills'}, TravelLib.say, {npcHandler = npcHandler, text = 'Do you seek a ride to the Femor Hills for %s?', cost = 60, discount = TravelLib.postmanDiscount})
	travelNode:addChildKeyword({'yes'}, TravelLib.travel, {npcHandler = npcHandler, premium = true, level = 0, msg = 'Hold on!', cost = 60, discount = TravelLib.postmanDiscount, destination = Position(32536, 31837, 4) })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, reset = true, text = 'You shouldn\'t miss the experience.'})

local travelNode = keywordHandler:addKeyword({'kazordoon'}, TravelLib.say, {npcHandler = npcHandler, text = 'Do you seek a ride to Kazordoon for %s?', cost = 80, discount = TravelLib.postmanDiscount})
	travelNode:addChildKeyword({'yes'}, TravelLib.travel, {npcHandler = npcHandler, premium = true, level = 0, msg = 'Hold on!', cost = 80, discount = TravelLib.postmanDiscount, destination = Position(32588, 31941, 0) })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, reset = true, text = 'You shouldn\'t miss the experience.'})

npcHandler:setMessage(MESSAGE_GREET, 'Daraman\'s blessings, traveller |PLAYERNAME|.')
npcHandler:setMessage(MESSAGE_FAREWELL, 'It was a pleasure to help you, |PLAYERNAME|.')
npcHandler:setMessage(MESSAGE_WALKAWAY, 'It was a pleasure to help you, |PLAYERNAME|.')

npcHandler:addModule(FocusModule:new())
