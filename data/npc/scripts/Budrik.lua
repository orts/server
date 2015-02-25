local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)

	if msgcontains(msg, "mission") then
		if player:getStorageValue(Storage.toOutfoxAFoxQuest) < 1 then
			npcHandler:say({
				"Funny that you are asking me for a mission! There is indeed something you can do for me. Ever heard about The Horned Fox? Anyway, yesterday his gang has stolen my mining helmet during a raid. ...",
				"It belonged to my father and before that to my grandfather. That helmet is at least 600 years old! I need it back. Are you willing to help me?"
			}, cid)
			npcHandler.topic[cid] = 1
		elseif player:getStorageValue(Storage.toOutfoxAFoxQuest) == 1 then
			if player:removeItem(7497, 1) then
				player:setStorageValue(Storage.toOutfoxAFoxQuest, 2)
				player:addItem(7939, 1)
				npcHandler:say("I always said it to the others 'This brave fellow will bring me my mining helmet back' and here you are with it!! Here take my spare helmet, I don't need it anymore!", cid)
			else
				npcHandler:say("We presume the hideout of The Horned Fox is somewhere in the south-west near the coast, good luck finding my mining helmet!", cid)
			end
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, "yes") then
		if npcHandler.topic[cid] == 1 then
			player:setStorageValue(Storage.toOutfoxAFoxQuest, 1)
			npcHandler:say("I knew you have the guts for that task! We presume the hideout of The Horned Fox somewhere in the south-west near the coast. Good luck!", cid)
			npcHandler.topic[cid] = 0
		end
	end
	return true
end

npcHandler:setMessage(MESSAGE_WALKAWAY, "Bye, bye.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Bye, bye.")
npcHandler:setMessage(MESSAGE_GREET, "Hiho, hiho |PLAYERNAME|.")
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
