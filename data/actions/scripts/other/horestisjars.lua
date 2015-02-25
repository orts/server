local config = {
	jarPositions = {
		Position(32991, 32721, 8),
		Position(32940, 32778, 9),
		Position(32985, 32772, 10),
		Position(32936, 32752, 11),
		Position(32979, 32737, 12)
	},
	time = 3600,
	brokenJarId = 13495,
	chance = 5,
	randomText = {'Waaaaaah', 'You are too afraid to destroy this object'},
	bossName = 'Horestis',
	bossPosition = Position(32941, 32793, 12),
	storages = {
		[50006] = Storage.HorestisTomb.JarFloor1,
		[50007] = Storage.HorestisTomb.JarFloor2,
		[50008] = Storage.HorestisTomb.JarFloor3,
		[50009] = Storage.HorestisTomb.JarFloor4,
		[50010] = Storage.HorestisTomb.JarFloor5
	}
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item.itemid ~= 13500 then
		player:say('This jar is already broken!', TALKTYPE_MONSTER_SAY)
		return true
	end

	local cStorage = config.storages[item.actionid]
	if player:getStorageValue(cStorage) > os.time() then
		player:say('You are too afraid to destroy this object', TALKTYPE_MONSTER_SAY)
		return true
	end

	player:setStorageValue(cStorage, os.time() + config.time)

	if math.random(100) > config.chance then
		player:say(config.randomText[math.random(#config.randomText)], TALKTYPE_MONSTER_SAY)
		return true
	end

	item:transform(config.brokenJarId)

	local jarsBroken, jarItem = true
	for i = 1, #config.jarPositions do
		jarItem = Tile(config.jarPositions[i]):getItemById(config.brokenJarId)
		if not jarItem then
			jarsBroken = false
			break
		end
	end

	if not jarsBroken then
		return true
	end

	Game.createMonster(config.bossName, config.bossPosition)
	return true
end