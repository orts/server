local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(creature, type, msg)
	if not (msgcontains(msg, 'hi') or msgcontains(msg, 'hello')) then
		npcHandler:say('LEAVE THE DRAGONS\' CEMETERY AT ONCE!', creature.uid)
	end
	npcHandler:onCreatureSay(creature, type, msg)
end

local lastSound = 0
function onThink()
	if lastSound < os.time() then
		lastSound = (os.time() + 5)
		if math.random(100) < 25 then
			Npc():say("AHHHH THE PAIN OF AGESSS! THE PAIN!", TALKTYPE_SAY)
		end
	end
	npcHandler:onThink()
end

local function greetCallback(cid)
	local player = Player(cid)
	if player:getStorageValue(Storage.Dragonfetish) == 1 then
		npcHandler:say('LEAVE THE DRAGONS\' CEMETERY AT ONCE!', cid)
		return false
	end

	if not player:removeItem(2787, 1) then
		npcHandler:say('AHHHH THE PAIN OF AGESSS! I NEED MUSSSSHRROOOMSSS TO EASSSE MY PAIN! BRRRING ME MUSHRRROOOMSSS!', cid)
		return false
	end

	player:setStorageValue(Storage.Dragonfetish, 1)
	player:addItem(2319, 1)
	npcHandler:say('AHHH MUSHRRROOOMSSS! NOW MY PAIN WILL BE EASSSED FOR A WHILE! TAKE THISS AND LEAVE THE DRAGONSSS\' CEMETERY AT ONCE!', cid)
	return false
end

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:addModule(FocusModule:new())
