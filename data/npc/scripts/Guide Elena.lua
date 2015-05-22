local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

local voices = {
	{ text = 'I can inform you about the status of this world, if you\'re interested.' },
	{ text = 'Hello, is this your first visit to Venore? I can show you around a little.' },
	{ text = 'Talk to me if you need directions.' },
	{ text = 'Need some help finding your way through Venore? Let me assist you.' },
	{ text = 'Free escort to the depot for newcomers!' }
}

npcHandler:addModule(VoiceModule:new(voices))

keywordHandler:addKeyword({'information'}, StdModule.say, {npcHandler = npcHandler, text = "Currently, I can tell you all about the {town}, its {temple}, the {bank}, {shops} - well, {warehouses} - {spell} {trainers} and the {depot}."})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, text = "I will help you find your way in the buzzing city of Venore. I can {mark} important locations on your {map} and give you some {information} about the town."})

npcHandler:setMessage(MESSAGE_GREET, "Welcome to Venore, |PLAYERNAME|! Would you like some {information} and a {map} guide?")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Good bye.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye and enjoy your stay in Venore, |PLAYERNAME|.")

npcHandler:addModule(FocusModule:new())
