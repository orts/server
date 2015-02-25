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
		if math.random(100) < 25  then
			Npc():say("Alone ... so alone. So cold.", TALKTYPE_SAY)
		end
	end
	npcHandler:onThink()
end

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, text = "Once I was a member of the order of the nightmare knights. Now I am but a shadow who walks these cold halls."})

npcHandler:setMessage(MESSAGE_GREET, "I feel you. I hear your thoughts. You are ... alive.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Alone ... so alone. So cold.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Alone ... so alone. So cold.")

npcHandler:addModule(FocusModule:new())
