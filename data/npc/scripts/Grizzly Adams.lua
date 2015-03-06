local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end

local voices = {
	'Where is Ben, the old walking bag of fleas? Oh well, he\'ll come back when he\'s hungry.',
	'Hi there, do you want to join the \'Paw and Fur - Hunting Elite\'?.'
}

local lastSound = 0
function onThink()
	if lastSound < os.time() then
		lastSound = (os.time() + 5)
		if math.random(100) < 20 then
			Npc():say(voices[math.random(#voices)], TALKTYPE_SAY)
		end
	end
	npcHandler:onThink()
end


local choose = {}
local cancel = {}
local available = {}
local tradeItems = {}

local ranks = {
		[2] = {
			{id=5907, buy=34000, sell=0, name='Slingshot'},

			{id=11214, buy=0, sell=50, name='Antlers'},
			{id=10550, buy=0, sell=100, name='Bloody Pincers'},
			{id=13303, buy=0, sell=550, name='Cavebear Skull'},
			{id=20098, buy=0, sell=150, name='Cheesy Gigurine'},
			{id=12470, buy=0, sell=110, name='Colourful Feather'},
			{id=11189, buy=0, sell=35, name='Crab Pincers'},
			{id=10574, buy=0, sell=55, name='Cyclops Toe'},
			{id=7398, buy=0, sell=500, name='Cyclops Trophy'},
			{id=11315, buy=0, sell=15000, name='Draken Trophy'},
			{id=13296, buy=0, sell=800, name='Draptor Scales'},
			{id=21311, buy=0, sell=115, name='Elven Hoof'},
			{id=10565, buy=0, sell=30, name='Frosty Ear Of a Troll'},
			{id=13304, buy=0, sell=950, name='Giant Crab Pincer'},
			{id=12495, buy=0, sell=20, name='Goblin Ear'},
			{id=13301, buy=0, sell=400, name='Hollow Stampor Hoof'},
			{id=11199, buy=0, sell=600, name='Hydra Head'},
			{id=11372, buy=0, sell=80, name='Lancer Beetle Shell'},
			{id=11336, buy=0, sell=8000, name='Lizard Trophy'},
			{id=12445, buy=0, sell=280, name='Mantassin Tail'},
			{id=19741, buy=0, sell=65, name='Marsh Stalker Beak'},
			{id=19742, buy=0, sell=50, name='Marsh Stalker Feather'},
			{id=13302, buy=0, sell=250, name='Maxilla'},
			{id=7401, buy=0, sell=500, name='Minotaur Trophy'},
			{id=10579, buy=0, sell=420, name='Mutated Bat Ear'},
			{id=13026, buy=0, sell=750, name='Panther Head'},
			{id=13027, buy=0, sell=300, name='Panther Paw'},
			{id=12447, buy=0, sell=500, name='Quara Bone'},
			{id=12444, buy=0, sell=350, name='Quara Eye'},
			{id=12446, buy=0, sell=410, name='Quara Pincers'},
			{id=12443, buy=0, sell=140, name='Quara Tentacle'},
			{id=13159, buy=0, sell=50, name='Rabbit\'s Foot'},
			{id=21310, buy=0, sell=70, name='Rorc Feather'},
			{id=11228, buy=0, sell=400, name='Sabretooth'},
			{id=11373, buy=0, sell=20, name='Sandcrawler Shell'},
			{id=10548, buy=0, sell=280, name='Scarab Pincers'},
			{id=13299, buy=0, sell=280, name='Stampor Horn'},
			{id=13300, buy=0, sell=150, name='Stampor Talons'},
			{id=11371, buy=0, sell=60, name='Terramite Legs'},
			{id=11369, buy=0, sell=170, name='Terramite Shell'},
			{id=11190, buy=0, sell=95, name='Terrorbird Beak'}
		},

		[3] = {},
		[4] = {
			{id=11161, buy=0, sell=6000, name='Bonebeast Trophy'},
			{id=7397, buy=0, sell=3000, name='Deer Trophy'},
			{id=7400, buy=0, sell=3000, name='Lion Trophy'},
			{id=7394, buy=0, sell=3000, name='Wolf Trophy'}
		},

		[5] = {
			{id=7393, buy=0, sell=40000, name='Demon Trophy'},
			{id=7396, buy=0, sell=20000, name='Behemoth Trophy'},
			{id=7399, buy=0, sell=10000, name='Dragon Lord Trophy'},
			{id=11338, buy=0, sell=3000, name='Disgusting Trophy'},

			{id=10518, buy=1000, sell=0, name='Demon Backpack'},
		},
		[6] = {},

	}


local function greetCallback(cid)
	local player = Player(cid)
	if player:getStorageValue(JOIN_STOR) == -1 then
		npcHandler:setMessage(MESSAGE_GREET, 'Welcome |PLAYERNAME|. Would you like to join the \'Paw and Fur - Hunting Elite\'?')
	else
		npcHandler:setMessage(MESSAGE_GREET, 'Welcome back old chap. What brings you here this time?')
	end
	return true
end

local function createText(started)
	local text, sep = '', ', '
	table.sort(started, (function(a, b) return (a < b) end))
	for i = 1, #started do
		if (i == #started - 1) then
			sep = ' and '
		elseif (i == #started) then
			sep = '.'
		end
		text = text .. '{' .. (tasks[started[i]].name or tasks[started[i]].raceName) .. '}' .. sep
	end
	return text
end


local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then return false end

	local player = Player(cid)
	local rankPos = player:getPawAndFurRank()

	if msgcontains('trade', msg) then
		if rankPos >= 2 then

			for i = 2, rankPos do
				for _,v in pairs(ranks[i]) do
					tradeItems[v.id] = v
				end
			end

			openShopWindow(cid, tradeItems, onBuy, onSell)

			return npcHandler:say('It\'s my offer.', cid)
		else
			return npcHandler:say('You don\'t have any rank.', cid)
		end

	elseif table.contains(msg:lower(), {'join', 'yes'}) and npcHandler.topic[cid] == 0 and player:getStorageValue(JOIN_STOR) ~= 1 then
		player:setStorageValue(JOIN_STOR, 1)
		npcHandler:say('Great!, now you can start tasks.', cid) --I'm not sure if this is as real tibia. I let this piece of code because it was in the original file.

	elseif table.contains(msg:lower(), {'tasks', 'task', 'mission'}) then
		local can = player:getTasks()
		if player:getStorageValue(JOIN_STOR) == -1 then
			return npcHandler:say('You\'ll have to {join}, to get any {tasks}.',cid)
		end
		if #can > 0 then
			npcHandler:say('The current task' .. (#can > 1 and 's' or '') .. ' that you can choose ' .. (#can > 1 and 'are' or 'is') .. ' ' .. createText(can), cid)
			npcHandler.topic[cid] = 0
		else
			npcHandler:say('I don\'t have any task for you right now.', cid)
		end

	elseif msg ~= '' and player:canStartTask(msg) then
		if #player:getStartedTasks() >= tasksByPlayer then
			npcHandler:say('Sorry, but you already started ' .. tasksByPlayer .. ' tasks. You can check their {status} or {cancel} a task.', cid)
			return true
		end
		local task = getTaskByName(msg)
		if task and player:getStorageValue(QUESTSTORAGE_BASE + task) > 0 then
			return false
		end
		npcHandler:say('In this task you must defeat ' .. tasks[task].killsRequired .. ' ' .. tasks[task].raceName .. '. Are you sure that you want to start this task?', cid)
		choose[cid] = task
		npcHandler.topic[cid] = 1
	elseif msg:lower() == 'yes' and npcHandler.topic[cid] == 1 then
		player:setStorageValue(QUESTSTORAGE_BASE + choose[cid], 1)
		player:setStorageValue(KILLSSTORAGE_BASE + choose[cid], 0)
		npcHandler:say('Excellent! You can check the {status} of your task saying {report} to me. Also you can {cancel} tasks to.', cid)
		choose[cid] = nil
		npcHandler.topic[cid] = 0

	elseif msgcontains('status', msg) then
		local started = player:getStartedTasks()
		if started and #started > 0 then
			npcHandler:say('The status of your current tasks is:\n' .. createText(started), cid)
		else
			npcHandler:say('You haven\'t started any task yet.', cid)
		end
	elseif msgcontains('report', msg) then
		local started = player:getStartedTasks()
		local finishedAtLeastOne = false
		local finished = 0
		if started and #started > 0 then
			local id, reward
			for i = 1, #started do
				id = started[i]
				if player:getStorageValue(KILLSSTORAGE_BASE + id) >= tasks[id].killsRequired then
					for j = 1, #tasks[id].rewards do
						reward = tasks[id].rewards[j]
						local deny = false
						if reward.storage then
							if player:getStorageValue(reward.storage[1]) >= reward.storage[2] then
								deny = true
							end
						end
						if 'money' == reward.type and not deny then
							player:addMoney(reward.value[1])
						elseif isInArray({'exp', 'experience'}, reward.type:lower()) and not deny then
							player:addExperience(reward.value[1], true)
						elseif isInArray({'achievement', 'ach'}, reward.type:lower()) and not deny then
							player:addAchievement(reward.value[1])
						elseif isInArray({'storage', 'stor'}, reward.type:lower()) and not deny then
							player:setStorageValue(reward.value[1], reward.value[2])
						elseif isInArray({'points', 'point'}, reward.type:lower()) and not deny then
							player:setStorageValue(POINTSSTORAGE, getPlayerTasksPoints(cid) + reward.value[1])
						elseif isInArray({'item', 'items', 'object'}, reward.type:lower()) and not deny then
							player:addItem(reward.value[1], reward.value[2])
						end

						if reward.storage then
							player:setStorageValue(reward.storage[1], reward.storage[2])
						end
					end

					player:setStorageValue(QUESTSTORAGE_BASE + id, (tasks[id].norepeatable and 2 or 0))
					player:setStorageValue(KILLSSTORAGE_BASE + id, -1)
					player:setStorageValue(REPEATSTORAGE_BASE + id, math.max(player:getStorageValue(REPEATSTORAGE_BASE + id), 0))
					player:setStorageValue(REPEATSTORAGE_BASE + id, player:getStorageValue(REPEATSTORAGE_BASE + id) + 1)
					finishedAtLeastOne = true
					finished = finished + 1
				end
			end
			if not finishedAtLeastOne then
				local started = player:getStartedTasks()
				if started and #started > 0 then
					npcHandler:say('The current task' .. (#started > 1 and 's' or '') .. ' that you started ' .. (#started > 1 and 'are' or 'is') .. ' ' .. createText(started), cid)
				end
			else
				npcHandler:say('Awesome! you finished ' .. (finished > 1 and 'various' or 'a') .. ' task' .. (finished > 1 and 's' or '') .. '. Talk to me again if you want to start a {task}.', cid)
			end
		else
			npcHandler:say('You haven\'t started any task yet.', cid)
		end
		--//////////////////////NEED To ReWork /////////////////////
		elseif msg:lower() == 'started' then
		local started = player:getStartedTasks()
		if started and #started > 0 then
			npcHandler:say('The current task' .. (#started > 1 and 's' or '') .. ' that you started ' .. (#started > 1 and 'are' or 'is') .. ' ' .. createText(started), cid)
		else
			npcHandler:say('You haven\'t started any task yet.', cid)
		end
	elseif msg:lower() == 'cancel' then
		local started = player:getStartedTasks()
		local task = getTaskByName(msg)
		if started and #started > 0 then
			npcHandler:say('Cancelling a task will make the counter restart. Which of these tasks you want cancel?' .. (#started > 1 and '' or '') .. ' ' .. createText(started), cid)
			npcHandler.topic[cid] = 2
		else
			npcHandler:say('You haven\'t started any task yet.', cid)
		end
	elseif getTaskByName(msg) and npcHandler.topic[cid] == 2 and isInArray(player:getStartedTasks(), getTaskByName(msg)) then
		local task = getTaskByName(msg)
		if player:getStorageValue(KILLSSTORAGE_BASE + task) > 0 then
			npcHandler:say('You currently killed ' .. player:getStorageValue(KILLSSTORAGE_BASE + task) .. '/' .. tasks[task].killsRequired .. ' ' .. tasks[task].raceName .. '. Cancelling this task will restart the count. Are you sure you want to cancel this task?', cid)
		else
			npcHandler:say('Are you sure you want to cancel this task?', cid)
		end
		npcHandler.topic[cid] = 3
		cancel[cid] = task
	elseif getTaskByName(msg) and npcHandler.topic[cid] == 1 and isInArray(player:getStartedTasks(), getTaskByName(msg)) then
		local task = getTaskByName(msg)
		if player:getStorageValue(KILLSSTORAGE_BASE + task) > 0 then
			npcHandler:say('You currently killed ' .. player:getStorageValue(KILLSSTORAGE_BASE + task) .. '/' .. tasks[task].killsRequired .. ' ' .. tasks[task].raceName .. '.', cid)
		else
			npcHandler:say('You currently killed 0/' .. tasks[task].killsRequired .. ' ' .. tasks[task].raceName .. '.', cid)
		end
		npcHandler.topic[cid] = 0
	elseif msg:lower() == 'yes' and npcHandler.topic[cid] == 3 then
		player:setStorageValue(QUESTSTORAGE_BASE + cancel[cid], -1)
		player:setStorageValue(KILLSSTORAGE_BASE + cancel[cid], -1)
		npcHandler:say('You have cancelled the task ' .. (tasks[cancel[cid]].name or tasks[cancel[cid]].raceName) .. '.', cid)
		npcHandler.topic[cid] = 0
	elseif isInArray({'points', 'rank'}, msg:lower()) then
		if player:getPawAndFurPoints() < 1 then
			npcHandler:say('At this time, you haven\'t been ranked yet', cid)
		else
			local rankString = {
								[0] = 'haven\'t been ranked yet.',
								[1] = 'are a Member.',
								[2] = 'are a Huntsman.',
								[3] = 'are a Ranger.',
								[4] = 'are a Big Game Hunter.',
								[5] = 'are a Trophy Hunter.',
								[6] = 'are an Elite Hunter.',
								}

			npcHandler:say('At this time, you have ' .. player:getPawAndFurPoints() .. ' Paw & Fur points. You ' .. rankString[rankPos], cid)
		end
		npcHandler.topic[cid] = 0
	elseif isInArray({'special task'}, msg:lower()) then
		if rankPos >= 5 then -- Tiquandas Revenge 90 points
			if player:getStorageValue(Storage.KillingInTheNameOf.MissionTiquandasRevenge) == 1 then  -- Check if he has already started the task.
				npcHandler:say('You have already started the task. Go find Tiquandas Revenge and take revenge yourself!', cid)
			else
				npcHandler:say({
					'Have you heard about Tiquandas Revenge? It is said that the jungle itself is alive and takes revenge for all the bad things people have done to it. ...',
					'I myself believe that there is some truth in this clap trap. Something \'real\' which therefore must have a hideout somewhere. Go find it and take revenge yourself!'
				}, cid)
				player:setStorageValue(Storage.KillingInTheNameOf.TiquandasRevengeTeleport, 1) -- Task needed to enter Tiquandas Revenge TP
				player:setStorageValue(Storage.KillingInTheNameOf.MissionTiquandasRevenge, 1) -- Won't give this task again.
			end
		end
		if rankPos >= 6 then -- Demodras 100 points
			if player:getStorageValue(Storage.KillingInTheNameOf.MissionDemodras) == 1 then  -- Check if he has already started the task.
				npcHandler:say('You have already started the special task. Find Demodras and kill it.', cid)
			else
				npcHandler:say('This task is a very dangerous one. I want you to look for Demodras\' hideout. It might be somewhere under the Plains of Havoc. Good luck, old chap.', cid)
				player:setStorageValue(Storage.KillingInTheNameOf.DemodrasTeleport, 1) -- Task needed to enter Demodras TP
				player:setStorageValue(Storage.KillingInTheNameOf.MissionDemodras, 1) -- Won't give this task again.
			end
		end
		npcHandler.topic[cid] = 0
	end
end

function onBuy(cid, item, subType, amount, ignoreCap, inBackpacks)
	local player = Player(cid)

	if not ignoreCap and player:getFreeCapacity() < ItemType(item):getWeight(amount) then
		return player:sendTextMessage(MESSAGE_INFO_DESCR, 'You don\'t have enough cap.')
	end
	if player:addItem(tradeItems[item].id, amount, false) then --addItem(arg, arg, FALSE) to not drop on ground
		player:removeMoney(amount * tradeItems[item].buy)
		return player:sendTextMessage(MESSAGE_INFO_DESCR, 'Bought '..amount..'x '..tradeItems[item].name..' for '..tradeItems[item].buy * amount..' gold coins.')
	else
		return player:sendTextMessage(MESSAGE_INFO_DESCR, 'You don\'t have enough container.')
	end
end

function onSell(cid, item, subType, amount, ignoreCap, inBackpacks) 
	local player = Player(cid)
	player:removeItem(tradeItems[item].id, amount)
	player:addMoney(tradeItems[item].sell * amount)
	return player:sendTextMessage(MESSAGE_INFO_DESCR, 'Sold '..amount..'x '..tradeItems[item].name..' for '..tradeItems[item].sell * amount..' gold coins.')
end

npcHandler:setMessage(MESSAGE_FAREWELL, 'Happy hunting, old chap!')
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
