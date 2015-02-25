local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end

local voices = {
	"Ahhhh!",
	"Have mercy!",
	"I admit! I admit!",
	"I repent!",
	"Noooooo!",
	"Please! I beg you to stop!",
	"Take it away! Please!"
}

local lastSound = 0
function onThink()
	if lastSound < os.time() then
		lastSound = (os.time() + 10)
		if math.random(100) < 20 then
			Npc():say(voices[math.random(#voices)], TALKTYPE_YELL)
		end
	end
	npcHandler:onThink()
end

npcHandler:addModule(FocusModule:new())
