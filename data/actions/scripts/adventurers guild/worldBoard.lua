local strings = {
	{storage = 1, string = "Several banks in major coastal towns are being robbed! The thieves are still on the loose!"}, -- Bank Robbery
	{storage = 2, string = "Sharpen your sword! The witch Wyda seems to be bored so pay her a visit!"}, -- Bored
	{storage = GlobalStorage.Chyllfroest, string = "An ice bridge now connects Svargrond to a frosty island, where monsters and a strange frozen creature have been sighted."}, -- Chyllfroest
	{storage = 4, string = "In case you have some spare tentacle pieces, you can now use Devovorga's very essence to enter a boss lair!"}, -- Devovorga's Essence
	{storage = 5, string = "The river south of the outlaw camp is flooding. A small island there should now be reachable safely."}, -- Down the Drain
	{storage = 6, string = "The volcano on Goroma sends his fiery message into the sky. A lot of creatures are flooding the lands together with its lava."}, -- Fire from the Earth
	{storage = GlobalStorage.FuryGates, isOverValue = true, string = "A fiery fury gate has opened near one of the major cities somewhere in Tibia."}, -- Fury Gates
	{storage = 8, string = "Hail to the King! It's Kingsday in Thais, join the celebration!"}, -- Kingsday
	{storage = 9, string = "Looks like the Queen's own royal trees are being cut down! The lumberjacks responsible shall be put to justice."}, -- Lumberjack
	{storage = 10, string = "Nomads travel the eternal sands of Ankrahmun's desert. There must be a camp somewhere."}, -- Nomads
	{storage = 11, string = "Not again! Noodles has taken some royal freedom and left the castle, after him in the name of the king!"}, -- Noodles is Gone
	{storage = GlobalStorage.Yasir, string = "Oriental ships sighted! A trader for exotic creature products may currently be visiting Carlin, Ankrahmun or Liberty Bay."}, -- Oriental Trader
	{storage = 13, string = "The river in Zao Steppe runs deep, there may be more fish than usual!"}, -- River Runs Deep
	{storage = 14, string = "A whole nest of spiders needs to be exterminated as Mamma Longlegs is on the loose."}, -- Spider Nest
	{storage = 15, string = "Adventurers have told of a Spirit Gate in the Daramian mountains. Fight the restless undead!"}, -- Spirit Grounds (Darama)
	{storage = 16, string = "Adventurers have told of a Spirit Gate in the Ghostlands. Fight the restless undead!"}, -- Spirit Grounds (Ghostlands)
	{storage = 17, string = "Adventurers have told of a Spirit Gate in Vengoth. Fight the restless undead!"}, -- Spirit Grounds (Vengoth)
	{storage = 18, string = "Stampede! The Ape God has stirred up Tiquanda's elephants again!"}, -- Stampede
	{storage = 19, string = "Judging by the unnerved mammoths in Svargrond, enough snow has melted away to reveal some very special flora."}, -- Thawing
	{storage = 20, string = "Bibby Bloodbath and her crew are roaming the lands, destroying everything in their path."} -- Warpath
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	for i = 0, #strings do
		local worldChange = strings[i]
		local value = worldChange.value or 1
		if worldChange.isOverValue and Game.getStorageValue(worldChange.storage) >= value or Game.getStorageValue(worldChange.storage) == value then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, strings.string)
		end
	end
	return true
end
