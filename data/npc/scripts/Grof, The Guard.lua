local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)	npcHandler:onCreatureSay(cid, type, msg)	end
function onThink()						npcHandler:onThink()						end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	local player = Player(cid)
	if msgcontains(msg, "trouble") and player:getStorageValue(Storage.TheInquisition.GrofGuard) < 1 and player:getStorageValue(Storage.TheInquisition.Mission01) ~= -1 then
		npcHandler:say("I think it'll rain soon and I left some laundry out for drying.", cid)
		npcHandler.topic[cid] = 1
	elseif msgcontains(msg, "authorities") then
		if npcHandler.topic[cid] == 1 then
			npcHandler:say("Yes I'm pretty sure they have failed to send the laundry police to take care of it, you fool.", cid)
			npcHandler.topic[cid] = 0
			if player:getStorageValue(Storage.TheInquisition.GrofGuard) < 1 then
				player:setStorageValue(Storage.TheInquisition.GrofGuard, 1)
				player:setStorageValue(Storage.TheInquisition.Mission01, player:getStorageValue(Storage.TheInquisition.Mission01) + 1) -- The Inquisition Questlog- "Mission 1: Interrogation"
				player:getPosition():sendMagicEffect(CONST_ME_HOLYAREA)
			end
		end
	end
	return true
end

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, text = "It's my duty to protect the city."})

npcHandler:setMessage(MESSAGE_GREET, "LONG LIVE THE KING!")
npcHandler:setMessage(MESSAGE_FAREWELL, "LONG LIVE THE KING!")
npcHandler:setMessage(MESSAGE_WALKAWAY, "LONG LIVE THE KING!")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
