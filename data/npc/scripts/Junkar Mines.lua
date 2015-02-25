local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end

local voices = {
	'So much to do. So many things to be fixed.',
	'Still so much work.'
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

local travelNode = keywordHandler:addKeyword({'kazordoon'}, TravelLib.say, {npcHandler = npcHandler, text = 'So you wish for a trip to Kazordoon? %s?', cost = 10, discount = TravelLib.postmanDiscount})
	travelNode:addChildKeyword({'yes'}, TravelLib.travel, {npcHandler = npcHandler, premium = false, level = 0, msg = 'Full steam ahead!', cost = 10, discount = TravelLib.postmanDiscount, destination = Position(32660, 31957, 15) })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, reset = true, text = 'Well, then you stay here, simple as that.'})

local travelNode = keywordHandler:addKeyword({'thais'}, TravelLib.say, {npcHandler = npcHandler, text = 'So you wish for a trip to Thais? %s?', cost = 90, discount = TravelLib.postmanDiscount})
	travelNode:addChildKeyword({'yes'}, TravelLib.travel, {npcHandler = npcHandler, premium = false, level = 0, msg = 'Full steam ahead!', cost = 90, discount = TravelLib.postmanDiscount, destination = Position(32370, 32180, 13) })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, reset = true, text = 'Well, then you stay here, simple as that.'})

local travelNode = keywordHandler:addKeyword({'robsons isle'}, TravelLib.say, {npcHandler = npcHandler, text = 'So you wish for a trip to Robsons Isle? %s?', cost = 70, discount = TravelLib.postmanDiscount})
	travelNode:addChildKeyword({'yes'}, TravelLib.travel, {npcHandler = npcHandler, premium = false, level = 0, msg = 'Full steam ahead!', cost = 70, discount = TravelLib.postmanDiscount, destination = Position(32527, 32036, 14) })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, reset = true, text = 'Well, then you stay here, simple as that.'})

keywordHandler:addKeyword({'passage'}, StdModule.say, {npcHandler = npcHandler, text = 'Where do you want me to take you? To {Kazordoon}, {Thais} or to {Robsons Isle}?'})

npcHandler:setMessage(MESSAGE_GREET, "Welcome, |PLAYERNAME|! You are lucky that the service is running right now. Save your coal for the days to come though!")
npcHandler:setMessage(MESSAGE_FAREWELL, "See you next time!")
npcHandler:setMessage(MESSAGE_WALKAWAY, "<Sigh> No patience!")

npcHandler:addModule(FocusModule:new())
