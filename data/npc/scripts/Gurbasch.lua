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
			Npc():say("Passages to Kazordoon! Gotta try the beer there.", TALKTYPE_SAY)
		end
	end
	npcHandler:onThink()
end

local function getFarmineDestination(cid)
	local player, destination = Player(cid), Position(33025, 31553, 14)
	if player:getStorageValue(Storage.TheNewFrontier.Mission05) == 7 then --if The New Frontier Quest 'Mission 05: Getting Things Busy' complete then Stage 3
		destination.z = 10
	elseif player:getStorageValue(Storage.TheNewFrontier.Mission03) == 3 then --if The New Frontier Quest 'Mission 03: Strangers in the Night' complete then Stage 2
		destination.z = 12
	end

	return destination
end

local function newFrontierDiscount(cid, cost)
	local discount = 0
	if Player(cid):getStorageValue(Storage.TheNewFrontier.Mission03) > 0 then
		discount = 50
	end

	return discount + TravelLib.postmanDiscount(cid, cost)
end

local travelNode = keywordHandler:addKeyword({'farmine'}, TravelLib.say, {npcHandler = npcHandler, text = 'Do you seek a ride to Farmine for %s?', cost = 110, discount = newFrontierDiscount})
	travelNode:addChildKeyword({'yes'}, TravelLib.travel, {npcHandler = npcHandler, premium = true, msg = 'Full speed ahead!', level = 0, cost = 110, discount = newFrontierDiscount, destination = getFarmineDestination})
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, reset = true, text = 'You shouldn\'t miss the experience.'})

local travelNode = keywordHandler:addKeyword({'kazordoon'}, TravelLib.say, {npcHandler = npcHandler, text = 'Do you want to go to Kazordoon to try the beer there? %s gold?', cost = 160, discount = TravelLib.postmanDiscount})
	travelNode:addChildKeyword({'yes'}, TravelLib.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 160, discount = TravelLib.postmanDiscount, destination = Position(32660, 31957, 15) })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, reset = true, text = 'Then not.'})

keywordHandler:addKeyword({'passage'}, StdModule.say, {npcHandler = npcHandler, text = 'Do you want me take you to {Kazordoon} or {Farmine}?'})

npcHandler:setMessage(MESSAGE_GREET, 'Welcome, |PLAYERNAME|! May Earth protect you, even whilst sailing!')
npcHandler:setMessage(MESSAGE_FAREWELL, 'Until next time.')
npcHandler:setMessage(MESSAGE_WALKAWAY, 'Until next time.')

npcHandler:addModule(FocusModule:new())
