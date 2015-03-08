local config = {
	[7737] = {'orc warrior', 'pirate cutthroat', 'dworc voodoomaster', 'dwarf guard', 'minotaur mage'}, -- common
	[7739] = {'serpent spawn', 'demon', 'juggernaut', 'behemoth', 'ashmunrah'}, -- uncommon
	[9076] = {'quara hydromancer', 'diabolic imp', 'banshee', 'frost giant', 'lich'} -- deluxe
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local monsterNames = config[item.itemid]
	if not monsterNames then
		return true
	end

	doSetMonsterOutfit(player, monsterNames[math.random(#monsterNames)], 5 * 60 * 60 * 1000)
	player:addAchievementProgress('Masquerader', 100)
	item:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
	item:remove()
	return true
end
