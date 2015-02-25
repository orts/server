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
	if(msgcontains(msg, "mission")) then
		if player:getStorageValue(Storage.BigfootBurden.QuestLine) >= 14 and player:getStorageValue(Storage.BigfootBurden.QuestLine) < 15 then
			npcHandler:say("For your {rank} there are four missions avaliable: {crystal keeper}, {spark hunting}.", cid)
			npcHandler:say("If you lose a mission item you can probably buy it from Gnomally. ", cid)
			npcHandler.topic[cid] = 0
		elseif player:getStorageValue(Storage.BigfootBurden.QuestLine) >= 15 then
			npcHandler:say("For your {rank} there are four missions avaliable: {crystal keeper}, {spark hunting}, {monster extermination} and {mushroom digging}. By the way, you {rank} now allows you to take aditional missions from {Gnomeral} in {Gnomebase Alpha}. ... ", cid)
			npcHandler:say("If you lose a mission item you can probably buy it from Gnomally. ", cid)
			npcHandler.topic[cid] = 0
		end
	-- Crystal Keeper
	elseif(msgcontains(msg, "keeper")) then
		if player:getStorageValue(Storage.BigfootBurden.MissionCrystalKeeper) < 1 and player:getStorageValue(Storage.BigfootBurden.CrystalKeeperTimout) < os.time() then
			npcHandler:say("You will have to repair some damaged crystals. Go into the Crystal grounds and repair them, using this harmonic crystal. Repair five of them and return to me. ", cid)
			npcHandler:say("If you lose a mission item you can probably buy it from Gnomally. ", cid)
			player:setStorageValue(Storage.BigfootBurden.MissionCrystalKeeper, 1)
			player:setStorageValue(Storage.BigfootBurden.RepairedCrystalCount, 0)
			player:addItem(18219, 1)
			npcHandler.topic[cid] = 0
		elseif(npcHandler.topic[cid] == 1 or npcHandler.topic[cid] == 2) then
			if player:getStorageValue(Storage.BigfootBurden.RepairedCrystalCount) == 5 and player:removeItem(18219, 1) then
				player:setStorageValue(Storage.BigfootBurden.Rank, player:getStorageValue(Storage.BigfootBurden.Rank) + 5)
				player:addItem(18422, 1)
				player:addItem(18215, 1)
				player:setStorageValue(Storage.BigfootBurden.MissionCrystalKeeper, 0)
				player:setStorageValue(Storage.BigfootBurden.CrystalKeeperTimout, os.time() + 72000)
				player:setStorageValue(Storage.BigfootBurden.RepairedCrystalCount, -1)
				player:addAchievement('Crystal Keeper')
				player:checkGnomeRank()
				npcHandler:say("You did well. That will help us a lot. Take your token and this gnomish supply package as a reward. ", cid)
				npcHandler.topic[cid] = 0
			end
		end
	-- Crystal Keeper

	-- Raiders of the Lost Spark
	elseif(msgcontains(msg, "spark")) then
		if player:getStorageValue(Storage.BigfootBurden.MissionRaidersOfTheLostSpark) < 1 and player:getStorageValue(Storage.BigfootBurden.RaidersOfTheLostSparkTimeout) < os.time() then
			npcHandler:say("Take this extractor and drive it into a body of a slain crystal crusher. This will charge your own body with energy sparks. Charge it with seven sparks and return to me. ...", cid)
			npcHandler:say("Don't worry. The gnomes assured me you'd be save. That is if nothing strange or unusual occurs! ", cid)
			player:setStorageValue(Storage.BigfootBurden.MissionRaidersOfTheLostSpark, 1)
			player:setStorageValue(Storage.BigfootBurden.ExtractedCount, 0)
			player:addItem(18213, 1)
			npcHandler.topic[cid] = 0
		elseif(npcHandler.topic[cid] == 1 or npcHandler.topic[cid] == 2) then
			if player:getStorageValue(Storage.BigfootBurden.ExtractedCount) == 7 then
				player:setStorageValue(Storage.BigfootBurden.Rank, player:getStorageValue(Storage.BigfootBurden.Rank) + 5)
				player:addItem(18422, 1)
				player:addItem(18215, 1)
				player:setStorageValue(Storage.BigfootBurden.MissionCrystalKeeper, 0)
				player:setStorageValue(Storage.BigfootBurden.ExtractedCount, -1)
				player:setStorageValue(Storage.BigfootBurden.RaidersOfTheLostSparkTimeout, os.time() + 72000)
				player:addAchievement('Call Me Sparky')
				player:checkGnomeRank()
				npcHandler:say("You did well. That will help us a lot. Take your token and this gnomish supply package as a reward. ", cid)
				npcHandler.topic[cid] = 0
			end
		end
	-- Raiders of the Lost Spark

	-- Exterminators
	elseif(msgcontains(msg, "extermination")) then
		if player:getStorageValue(Storage.BigfootBurden.MissionExterminators) < 1 and player:getStorageValue(Storage.BigfootBurden.ExterminatorsTimeout) < os.time() and player:getStorageValue(Storage.BigfootBurden.QuestLine) >= 15 then
			npcHandler:say("The wigglers have become a pest that threaten our resources and supplies. Kill 10 wigglers in the caves like the mushroon gardens or the truffles ground. Report back to me when you are done. ", cid)
			player:setStorageValue(Storage.BigfootBurden.MissionExterminators, 1)
			player:setStorageValue(Storage.BigfootBurden.ExterminatedCount, 0)
			npcHandler.topic[cid] = 0
		elseif(npcHandler.topic[cid] == 2) then
			if player:getStorageValue(Storage.BigfootBurden.ExterminatedCount) == 10 then
				player:setStorageValue(Storage.BigfootBurden.Rank, player:getStorageValue(Storage.BigfootBurden.Rank) + 5)
				player:addItem(18422, 1)
				player:addItem(18215, 1)
				player:setStorageValue(Storage.BigfootBurden.MissionExterminators, 0)
				player:setStorageValue(Storage.BigfootBurden.ExterminatedCount, -1)
				player:setStorageValue(Storage.BigfootBurden.ExterminatorsTimeout, os.time() + 72000)
				player:addAchievement('One Foot Vs. Many')
				player:checkGnomeRank()
				npcHandler:say("You did well. That will help us a lot. Take your token and this gnomish supply package as a reward. ", cid)
				npcHandler.topic[cid] = 0
			end
		end
	-- Exterminators

	-- Mushroom Digger
	elseif(msgcontains(msg, "digging")) then
		if player:getStorageValue(Storage.BigfootBurden.MissionMushroomDigger) < 1 and player:getStorageValue(Storage.BigfootBurden.MushroomDiggerTimeout) < os.time() and player:getStorageValue(Storage.BigfootBurden.QuestLine) >= 15 then
			npcHandler:say({
				"Take this little piggy here. It will one day become a great mushroom hunter for sure. For now it is depended on you and other pigs. ...",
				"Well other pigs then itself of course. I was not comparing you with a pig of course! Go to the truffels area and follow the truffel pigs there. When they dig up some truffels let the little pig eat the mushrooms. ...",
				"You'll have to feed it three times. Then return it to me. ...",
				"Keep in mind that the pig has to be returned to his mother after a while. When you don't do it, the gnomes will recall it via teleport cryrstals."
			}, cid)
			player:setStorageValue(Storage.BigfootBurden.MissionMushroomDigger, 1)
			player:setStorageValue(Storage.BigfootBurden.MushroomCount, 0)
			player:addItem(18339, 1)
			npcHandler.topic[cid] = 0
		elseif(npcHandler.topic[cid] == 2) then
			if player:getStorageValue(Storage.BigfootBurden.MushroomCount) == 3 and player:removeItem(18339, 1) then
				player:setStorageValue(Storage.BigfootBurden.Rank, player:getStorageValue(Storage.BigfootBurden.Rank) + 5)
				player:addItem(18422, 1)
				player:addItem(18215, 1)
				player:setStorageValue(Storage.BigfootBurden.MissionMushroomDigger, 0)
				player:setStorageValue(Storage.BigfootBurden.MushroomCount, -1)
				player:setStorageValue(Storage.BigfootBurden.MushroomDiggerTimeout, os.time() + 72000)
				player:addAchievement('The Picky Pig')
				player:checkGnomeRank()
				npcHandler:say("You did well. That will help us a lot. Take your token and this gnomish supply package as a reward. ", cid)
				npcHandler.topic[cid] = 0
			end
		end
	-- Mushroom Digger

	elseif(msgcontains(msg, "report")) then
		if player:getStorageValue(Storage.BigfootBurden.QuestLine) >= 14 and player:getStorageValue(Storage.BigfootBurden.QuestLine) < 15 then
			npcHandler:say("Which mission do you want to report: {crystal keeper}, {spark hunting}?", cid)
			npcHandler.topic[cid] = 1
		elseif player:getStorageValue(Storage.BigfootBurden.QuestLine) >= 15 then
			npcHandler:say("Which mission do you want to report: {crystal keeper}, {spark hunting}, {extermination} or {mushroom digging}?", cid)
			npcHandler.topic[cid] = 2
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
