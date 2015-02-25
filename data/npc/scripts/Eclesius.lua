local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end

local voices = {
	"I'm looking for a new assistant!",
	"Err, what was it again that I wanted...?",
	"Do come in! Mind the step of the magical door, though.",
	"I'm so sorry... I promise it won't happen again. Problem is, I can't remember where I made the error...",
	"Actually, I STILL prefer inexperienced assistants. They're easier to keep an eye on and don't tend to backstab you.",
	"So much to do, so much to do... uh... where should I start?"
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

npcHandler:setMessage(MESSAGE_GREET, "Who are you? What do you want? You seem too experienced to become my assistant. Please leave.")

npcHandler:addModule(FocusModule:new())
