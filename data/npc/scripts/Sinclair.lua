local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end

local voices = {
	'Indeed, there has to be some other way.',
	'Mmh, interesting.',
	'Yes indeed, all of the equipment should be checked and calibrated regularly.',
	'No, we have to give this another go.'
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

npcHandler:setMessage(MESSAGE_GREET, "Greetings |PLAYERNAME|. I have - very - little time, please make it as short as possible. I may be able to help you if you are here to help us with any of our tasks or missions.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Goodbye and good luck |PLAYERNAME|.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Goodbye and good luck |PLAYERNAME|.")

npcHandler:addModule(FocusModule:new())
