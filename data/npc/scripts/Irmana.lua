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
	if(msgcontains(msg, "addon")) then
		if player:getStorageValue(Storage.OutfitQuest.NoblemanFirstAddon) < 1 then
			npcHandler:say("Currently we are offering accessories for the nobleman - and, of course, noblewoman - outfit. Would you like to hear more about our offer?", cid)
			npcHandler.topic[cid] = 1
		elseif player:getStorageValue(Storage.OutfitQuest.NoblemanSecondAddon) < 1 then
			npcHandler:say("Currently we are offering accessories for the nobleman - and, of course, noblewoman - outfit. Would you like to hear more about our offer?", cid)
			npcHandler.topic[cid] = 1
		else
			npcHandler:say("You have already bought the two addons.", cid)
		end
	elseif(msgcontains(msg, "yes")) then
		if npcHandler.topic[cid] == 1 then
			npcHandler:say("Especially for you, mylady, we are offering a pretty {hat} and a beautiful {dress} like the ones I wear. Which one are you interested in?", cid)
			npcHandler.topic[cid] = 2
		elseif npcHandler.topic[cid] == 3 then
			if player:removeMoney(150000) and player:getStorageValue(Storage.OutfitQuest.NoblemanFirstAddon) < 1 then
				npcHandler:say("Congratulations! Here is your brand-new accessory, I hope you like it. Please visit us again!", cid)
				player:addOutfitAddon(140, 2)
				player:addOutfitAddon(132, 2)
				player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
				player:setStorageValue(Storage.OutfitQuest.NoblemanFirstAddon, 1)
				npcHandler.topic[cid] = 0
			end
		elseif npcHandler.topic[cid] == 4 then
			if player:removeMoney(150000) and player:getStorageValue(Storage.OutfitQuest.NoblemanSecondAddon) < 1 then
				npcHandler:say("Congratulations! Here is your brand-new accessory, I hope you like it. Please visit us again!", cid)
				player:addOutfitAddon(140, 1)
				player:addOutfitAddon(132, 1)
				player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
				player:setStorageValue(Storage.OutfitQuest.NoblemanSecondAddon, 1)
				npcHandler.topic[cid] = 0
			end
		end
	elseif(msgcontains(msg, "hat") or msgcontains(msg, "accessory")) and (npcHandler.topic[cid] == 2 and player:getStorageValue(Storage.OutfitQuest.NoblemanFirstAddon) < 1) then
		npcHandler:say({
			"This accessory requires a small fee of 150000 gold pieces. Of course, we do not want to put you at any risk to be attacked while carrying this huge amount of money. ...",
			"This is why we have established our brand-new instalment sale. You can choose to either pay the price at once, or if you want to be safe, by instalments of 10000 gold pieces. ...",
			"I also have to inform you that once you started paying for one of the accessories, you have to finish the payment first before you can start paying for the other one, of course. ...",
			"Are you interested in purchasing this accessory?"
		}, cid)
		npcHandler.topic[cid] = 3
	elseif(msgcontains(msg, "dress") or msgcontains(msg, "coat")) and (npcHandler.topic[cid] == 2 and player:getStorageValue(Storage.OutfitQuest.NoblemanSecondAddon) < 1) then
		npcHandler:say({
			"This accessory requires a small fee of 150000 gold pieces. Of course, we do not want to put you at any risk to be attacked while carrying this huge amount of money. ...",
			"This is why we have established our brand-new instalment sale. You can choose to either pay the price at once, or if you want to be safe, by instalments of 10000 gold pieces. ...",
			"I also have to inform you that once you started paying for one of the accessories, you have to finish the payment first before you can start paying for the other one, of course. ...",
			"Are you interested in purchasing this accessory?"
		}, cid)
		npcHandler.topic[cid] = 4
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
