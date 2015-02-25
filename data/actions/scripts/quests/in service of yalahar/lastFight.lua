local waves = {
	Position(32779, 31166, 10),
	Position(32787, 31166, 10),
	Position(32782, 31162, 10),
	Position(32784, 31162, 10),
	Position(32782, 31170, 10),
	Position(32784, 31170, 10)
}

local creatureName = {
	[1] = 'rift worm',
	[2] = 'rift scythe',
	[3] = 'rift brood',
	[4] = 'war golem'
}

function doClearAreaAzerus()
	if Game.getStorageValue(GlobalStorage.InServiceOfYalahar.LastFight) == 1 then
		local othermonsters = Game.getSpectators(Position(32783, 31166, 10), false, false, 10, 10, 10, 10)
		for _, othermonster in ipairs(othermonsters) do
			if othermonster:isMonster() then
				othermonster:getPosition():sendMagicEffect(CONST_ME_POFF)
				othermonster:remove()
			end
		end
		Game.setStorageValue(GlobalStorage.InServiceOfYalahar.LastFight, 0)
	end
	return true
end

function doChangeAzerus()
	local azeruses = Game.getSpectators(Position(32783, 31166, 10), false, false, 10, 10, 10, 10)
	for _, azerus in ipairs(azeruses) do
		if azerus:isMonster() and azerus:getName():lower() == "azerus" then
			azerus:say("No! I am losing my energy!", TALKTYPE_MONSTER_SAY)
			local azeruspos = azerus:getPosition()
			azerus:remove()
			Game.createMonster("Azerus", azeruspos)
			return true
		end
	end
	return false
end

local function summonMonster(name, position)
	Game.createMonster(name, position)
	position:sendMagicEffect(CONST_ME_TELEPORT)
end

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item.uid == 3086 then
		if Game.getStorageValue(GlobalStorage.InServiceOfYalahar.LastFight) ~= 1 then -- Fight
			local amountOfPlayers = 3
			local spectators = Game.getSpectators(Position(32783, 31166, 10), false, true, 10, 10, 10, 10)
			if #spectators < amountOfPlayers then
				for _, spectator in ipairs(spectators) do
					spectator:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You need atleast "..amountOfPlayers.." players inside the quest room.")
				end
				return true
			end
			Game.setStorageValue(GlobalStorage.InServiceOfYalahar.LastFight, 1)
			addEvent(Game.createMonster, 18 * 1000, "Azerus2", Position(32783, 31167, 10))
			local azeruswavemonster
			for i = 1, 4 do
				azeruswavemonster = creatureName[i]
				for k = 1, #waves do
					addEvent(summonMonster, (i - 1) * 60 * 1000, azeruswavemonster, waves[k])
				end
			end
			for x = 32779, 32787, 8 do
				for y = 31161, 31171, 10 do
					Position(x, y, 10):sendMagicEffect(CONST_ME_HOLYAREA)
				end
			end
			addEvent(doChangeAzerus, 4 * 20 * 1000)
			addEvent(doClearAreaAzerus, 5 * 60 * 1000)
		else
			player:say('You have to wait some time before this globe charges.', TALKTYPE_MONSTER_SAY)
		end
	end
	return true
end
