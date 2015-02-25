local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

local function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	local player = Player(cid)
	if(msgcontains(msg, "warzones")) then
		if player:getStorageValue(Storage.BigfootBurden.QuestLine) == 17 then
			npcHandler:say({
				"There are three warzones. In each warzone you will find fearsome foes. At the end you'll find their mean master. The masters is well protected though. ...",
				"Make sure to talk to our gnomish agent in there for specifics of its' protection. ...",
				"Oh, and to be able to enter the second warzone you have to best the first. To enter the third you have to best the second. ...",
				"And you can enter each one only once every twenty hours. Your normal teleport crystals won't work on these teleporters. You will have to get mission crystals from Gnomally."
			}, cid)
			npcHandler.topic[cid] = 1
		end
	elseif(msgcontains(msg, "job")) then
		if player:getStorageValue(Storage.BigfootBurden.QuestLine) == 17 then
			npcHandler:say("I am responsible for our war missions, to trade with seasoned soldiers and rewarding war heroes. You have to be rank 4 to enter the warzones.", cid)
			npcHandler.topic[cid] = 2
		end
	elseif(msgcontains(msg, "heroes")) then
		if(npcHandler.topic[cid] == 2) then
			npcHandler:say({
				"You can trade special spoils of war to get a permission to use the war teleporters to the area of the corresponding boss without need of mission crystals. ...",
				"Which one would you like to trade: the deathstrike's snippet, gnomevil's hat or the abyssador lash?"
			}, cid)
			npcHandler.topic[cid] = 3
		end
	elseif(msgcontains(msg, "snippet")) then
		if(npcHandler.topic[cid] == 3) then
			if player:removeItem(18430, 1) then
				player:setStorageValue(Storage.BigfootBurden.Warzone1Access, 1)
				npcHandler:say("As a war hero you are allowed to use the warzone teleporter one for free!", cid)
				npcHandler.topic[cid] = 0
			end
		end
	elseif(msgcontains(msg, "lash")) then
		if(npcHandler.topic[cid] == 3) then
			if player:removeItem(18496, 1) then
				player:setStorageValue(Storage.BigfootBurden.Warzone2Access, 1)
				npcHandler:say("As a war hero you are allowed to use the warzone teleporter two for free!", cid)
				npcHandler.topic[cid] = 0
			end
		end
	elseif(msgcontains(msg, "hat")) then
		if(npcHandler.topic[cid] == 3) then
			if player:removeItem(18495, 1) then
				player:setStorageValue(Storage.BigfootBurden.Warzone3Access, 1)
				npcHandler:say("As a war hero you are allowed to use the warzone teleporter three for free!", cid)
				npcHandler.topic[cid] = 0
			end
		end
	elseif(msgcontains(msg, "mission")) then
		if(npcHandler.topic[cid] == 1) then
			npcHandler:say("Fine, I grant you the permission to enter the warzones. Be warned though, this will be not a picnic. Better bring some friends with you. Bringing a lot of them sounds like a good idea.", cid)
			player:setStorageValue(Storage.BigfootBurden.QuestLine, 18)
			player:setStorageValue(Storage.BigfootBurden.WarzoneStatus, 1)
			npcHandler.topic[cid] = 0
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
