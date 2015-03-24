local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end

local voices = {
	"Zgk'ch Cthlhg drch, sire.",
	"Ah. I grieve. All those shadows, in despair...",
	"<Chants a dark tune that makes your ears bleed>"
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

keywordHandler:addKeyword({"name"}, StdModule.say, {npcHandler = npcHandler, text = "My name is unpronouncable in your language."})
keywordHandler:addKeyword({"unpronouncable"}, StdModule.say, {npcHandler = npcHandler, text = "The nearest you may come to is Zg'!kch of Cthle-ZüuKh'lkrlxchwr."})
keywordHandler:addKeyword({"job"}, StdModule.say, {npcHandler = npcHandler, text = "I am the Gate Keeper. I guard the doors and await the {Key} Master"})
keywordHandler:addKeyword({"key"}, StdModule.say, {npcHandler = npcHandler,
	text = {
		"The balance has been broken, the doors pried open, the keys scattered and lost.",
		"The Key Master will find them and close the doors that were not meant to be open.",
		"And then he will unlock the {Other Door}."
	}}
)
keywordHandler:addKeyword({"Other Door"}, StdModule.say, {npcHandler = npcHandler, text = "The Key Master will know."})
keywordHandler:addKeyword({"tibia"}, StdModule.say, {npcHandler = npcHandler, text = "Too many doors open. Too tempting for some. The shadows run and hide."})
keywordHandler:addKeyword({"shadow"}, StdModule.say, {npcHandler = npcHandler, text = "The breath of darkness, the eye of the night, the body of the other."})
keywordHandler:addKeyword({"spirit ground"}, StdModule.say, {npcHandler = npcHandler, text = "The realm between realms, where all doors open on themselves only. The place where the spirits dwell that have unfinished business or were... {called}."})
keywordHandler:addKeyword({"called"}, StdModule.say, {npcHandler = npcHandler, text = "The call of the Ancients was sounded. The Key Master knows it. We too have been summoned to prepare for their arrival."})
keywordHandler:addKeyword({"ancients"}, StdModule.say, {npcHandler = npcHandler, text = "Enough! Don't waste your breath, mortal. Go now onto the grounds to do what you came here to do."})

npcHandler:setMessage(MESSAGE_GREET, "Are you the Key Master?")
npcHandler:setMessage(MESSAGE_FAREWELL, "Yes. For a while.")
npcHandler:addModule(FocusModule:new())
