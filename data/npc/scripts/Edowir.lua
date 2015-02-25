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
			Npc():say("I'm just an old man, but I know a lot about Tibia.", TALKTYPE_SAY)
		end
	end
	npcHandler:onThink()
end

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, text = "I gather wisdom and knowledge. I am also an astrologer."})

npcHandler:setMessage(MESSAGE_GREET, "Oh, hello |PLAYERNAME|! How nice of you to visit an old man like me.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Come back whenever you're in need of wisdom.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Come back whenever you're in need of wisdom.")

npcHandler:addModule(FocusModule:new())
