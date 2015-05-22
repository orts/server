local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({'arrow'}, 2544, 3, 'arrow')
shopModule:addBuyableItem({'assassin star'}, 7368, 100, 'assassin star')
shopModule:addBuyableItem({'bolt'}, 2543, 4, 'bolt')
shopModule:addBuyableItem({'bow'}, 2456, 400, 'bow')
shopModule:addBuyableItem({'crossbow'}, 2455, 500, 'crossbow')
shopModule:addBuyableItem({'spear'}, 2389, 9, 'spear')

local function greetCallback(cid)
	if Player(cid):getCondition(CONDITION_FIRE) then
		npcHandler:setMessage(MESSAGE_GREET, 'Hehe. That\'s a good show, |PLAYERNAME|, with all the pyro effects. You got my attention. For a minute or so.')
	else
		return false
	end
	return true
end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)

	if msgcontains(msg, 'addon') then
		if player:hasOutfit(player:getSex() == PLAYERSEX_FEMALE and 156 or 152, 1) and player:getStorageValue(Storage.OutfitQuest.AssassinSecondAddon) < 1 then
			npcHandler:say('You managed to deceive Erayo? Impressive. Well, I guess, since you have come that far, I might as well give you a task too, eh?', cid)
			npcHandler.topic[cid] = 1
		else
			npcHandler:say('I don\'t know what you are talking about.', cid)
		end
	elseif msgcontains(msg, 'nose ring') then
		if player:getStorageValue(Storage.OutfitQuest.AssassinSecondAddon) == 1 then
			if player:getItemCount(5804) > 0 and player:getItemCount(5930) > 0 then
				player:removeItem(5804, 1)
				player:removeItem(5930, 1)
				player:addOutfitAddon(156, 2)
				player:addOutfitAddon(152, 2)
				player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
				player:setStorageValue(Storage.OutfitQuest.AssassinSecondAddon, 2)
				player:addAchievement('Swift Death')
				npcHandler:say('I see you brought my stuff. Good. I\'ll keep my promise: Here\'s katana in return.', cid)
			else
				npcHandler:say('You don\'t have the required items.', cid)
			end
		end
	elseif msgcontains(msg, 'yes') then
		if npcHandler.topic[cid] == 1 then
			npcHandler:say('Okay, listen up. I don\'t have a list of stupid objects, I just want two things. A {behemoth claw} and a {nose ring}. Got that?', cid)
			npcHandler.topic[cid] = 2
		elseif npcHandler.topic[cid] == 2 then
			if player:getStorageValue(Storage.OutfitQuest.DefaultStart) ~= 1 then
				player:setStorageValue(Storage.OutfitQuest.DefaultStart, 1)
			end
			player:setStorageValue(Storage.OutfitQuest.AssassinSecondAddon, 1)
			npcHandler:say('Good. Come back when you have BOTH. Should be clear where to get a behemoth claw from. There\'s a horned fox who wears a nose ring. Good luck.', cid)
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, 'no') and npcHandler.topic[cid] > 0 then
		npcHandler:say('Maybe another time.', cid)
		npcHandler.topic[cid] = 0
	end
	return true
end

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
