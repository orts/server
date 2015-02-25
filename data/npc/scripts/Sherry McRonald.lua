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
			Npc():say("Isn't this a beautiful day? Perfect for farming.", TALKTYPE_SAY)
		end
	end
	npcHandler:onThink()
end

npcHandler:setMessage(MESSAGE_GREET, "Hello |PLAYERNAME|! Welcome to our humble farm.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Grace our home with another visit soon, |PLAYERNAME|.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "What a strange person.")

npcHandler:addModule(FocusModule:new())
