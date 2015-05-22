local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local function greetCallback(cid)
	npcHandler:setMessage(MESSAGE_GREET,'Greetings! I guess you are here for the {food}.')
	return true
end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)
	local harvestedCount = player:getStorageValue(Storage.Oramond.HarvestedRootCount)
	local votingPoints = player:getStorageValue(Storage.Oramond.VotingPoints)
	-- START TASK
	if msgcontains(msg, "food") then
		if player:getStorageValue(Storage.Oramond.MissionToTakeRoots) < 0 then
			npcHandler:say({
				'Hey there, just to let you know - I am not a man of many words. I prefer \'deeds\', you see? The poor of this city will not feed themselves. ...',
				'So in case you\'ve got nothing better to do - and it sure looks that way judging by how long you\'re already loitering around in front of my nose - please help us. ...',
				'If you can find some of the nutritious, juicy {roots} in the outskirts of Rathleton, bring them here. We will gladly take bundles of five roots each, and hey - helping us, helps you in the long term, trust me.'
			}, cid)
			player:setStorageValue(Storage.Oramond.QuestLine, 1)
			player:setStorageValue(Storage.Oramond.MissionToTakeRoots, 1)
			player:setStorageValue(Storage.Oramond.HarvestedRootCount, 0)
			npcHandler.topic[cid] = 1
		elseif player:getStorageValue(Storage.Oramond.MissionToTakeRoots) == 1 then
			npcHandler:say("Yes? You brought some juicy roots? How nice of you - That's one additional voice in the {magistrate} of {Rathleton} for you!... ", cid)
			npcHandler.topic[cid] = 2
		end
	end
	--ANSWER YES
	if(msgcontains(msg, "yes")) then
		if npcHandler.topic[cid] == 1 and player:getStorageValue(Storage.Oramond.HarvestedRootCount) >= 5 then
			npcHandler:say("Come when you are done.", cid)
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 2 and player:getStorageValue(Storage.Oramond.HarvestedRootCount) >= 5 then
			npcHandler:say("Spend it wisley, thought, put in a word for the poor, will ye? Sure you will. ", cid)
			npcHandler.topic[cid] = 3
		elseif npcHandler.topic[cid] == 3 then
			player:setStorageValue(Storage.Oramond.VotingPoints, votingPoints + 1)
			player:setStorageValue(Storage.Oramond.HarvestedRootCount, harvestedCount - 5)
			player:removeItem(23662, 5)
			npcHandler.topic[cid] = 0
			end
		end
	-- ANSWER NO
	if(msgcontains(msg, "no")) then
		if npcHandler.topic[cid] == 3 then
			npcHandler:say("Take care out there!", cid)
			npcHandler.topic[cid] = 0
			end
		end
	return true
end

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
local focusModule = FocusModule:new()
npcHandler:addModule(focusModule)
