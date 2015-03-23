local spawns = {
	-- Vampires
	[1] = {position = Position(32962, 32412, 12), monster = 'Arachir The Ancient One'},
	[2] = {position = Position(32009, 32795, 10), monster = 'Diblis The Fair'},
	[3] = {position = Position(33266, 31767, 10), monster = 'Sir Valorcrest'},
	[4] = {position = Position(32788, 31673, 14), monster = 'Zevelon Duskbringer'},

	-- Mounts
	[5] = {position = Position(32109, 32783, 12), monster = 'Crustacea Gigantica'},
	[6] = {position = Position(33188, 31241, 7), monster = 'Draptor'},
	[7] = {position = Position(32837, 32700, 7), monster = 'Midnight Panther'},
	[8] = {position = Position(31914, 32559, 10), monster = 'Undead Cavebear'},

	-- PoI bosses
	[9] = {position = Position(32794, 32372, 15), monster = 'Countess Sorrow'},
	[10] = {position = Position(32840, 32310, 15), monster = 'Dracola'},
	[11] = {position = Position(32869, 32267, 15), monster = 'Massacre'},
	[12] = {position = Position(32759, 32243, 15), monster = 'Mr. Punish'},
	[13] = {position = Position(32785, 32276, 15), monster = 'The Handmaiden'},
	[14] = {position = Position(32845, 32325, 15), monster = 'The Plasmother'},
	[15] = {position = Position(32913, 32212, 15), monster = 'The Imperor'},

	-- Bosses
	[16] = {position = Position(33234, 32278, 12), monster = 'Demodras'},
	[17] = {position = Position(33101, 32138, 8), monster = 'Dharalion'},
	[18] = {position = Position(32855, 32333, 6), monster = 'Fernfang'},
	[19] = {position = Position(32121, 31134, 7), monster = 'Man in the Cave'},
	[20] = {position = Position(31948, 32572, 10), monster = 'Necropharus'},
	[21] = {position = Position(32466, 31965, 8), monster = 'The Horned Fox'},
	[22] = {position = Position(32023, 31580, 7), monster = 'Yeti'},
	[23] = {position = Position(32122, 32057, 12), monster = 'Apprentice Sheng'},
	[24] = {position = Position(32419, 32147, 15), monster = 'General Murius'}
}

function onThink(interval, lastExecution, thinkInterval)
	if math.random(1000) > 50 then
		return true
	end

	local spawn = spawns[math.random(#spawns)]
	Game.createMonster(spawn.monster, spawn.position, false, true)
	return true
end
