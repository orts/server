local items = {
	{1032, "Snowball", "You try to concentrate and your dream comes true. You wished for something cool."},
	{1070, "Rubbish", "You try to concentrate and your dream comes true. You knew it would be some rubbish!"},
	{485, "Piggy Bank", "You try to concentrate and your dream comes true. You just thought about your wealth."},
	{956, "Blue Rose", "You try to concentrate and your dream comes true. You just thought about spring."},
	{481, "Lute", "You try to concentrate and your dream comes true. Well, part of. You thought about getting rich and a pile of loot..."},
	{960, 8110, "You try to concentrate and your dream comes true. You were that curious for the surprise."},
	{956, "Simple Dress", "You try to concentrate and ... Oops, where did that dream come from?"},
	{188, "Silver Prison Key", "You try to concentrate and your dream comes true. You just thought about a true challenge."},
	{419, "Spellwand", "You try to concentrate and your dream comes true. Somehow you seemed to get distracted when you thought of Ferumbras."},
	{977, "Dice", "You try to concentrate and your dream comes true. You just wondered if you'd be lucky this time."},
	{95, "Mirror", "You try to concentrate and your dream comes true. You shouldn't really think about yourself that often."},
	{128, "Cluster of Solace", "You try to concentrate and your dream comes true. You thought of your last night's dream, You try to concentrate and your dream comes true. You couldn't focus on anything specific."},
	{320, "Meat", "You try to concentrate and your dream comes true. Unfortunately you were subconsciouly thinking about something to eat."},
	{383, "Goldfish Bowl", "You try to concentrate and your dream comes true. You just thought about a loyal companion."},
	{204, "Copper Prison Key", "You try to concentrate and your dream comes true. You just thought about a true challenge."},
	{203, "Bronze Prison Key", "You try to concentrate and your dream comes true. You just thought about a true challenge."},
	{50, "Golden Prison Key", "You try to concentrate and your dream comes true. You just thought about a true challenge."},
	{60, "Wedding Ring", "You try to concentrate and your dream comes true. You wonder what were you thinking about."},
	{41, "Stuffed Bunny", "You try to concentrate and your dream comes true. You just thought about having a true friend."},
	{51, "Dream Warden Claw", "You try to concentrate and your dream comes true. You wonder what were you thinking about."},
	{59, "Pair of Earmuffs", "You try to concentrate and your dream comes true. Sadly you had cold ears just in that moment."},
	{23, "Bag of Apple Slices", "You try to concentrate and your dream comes true. You thought about your sore feet."}
}

local function randomizeItem() 
	local x, y = 0, 0
	for i = 1, #items do 
		local itemChance = items[i][1]
		x = x + itemChance
	end

	local chance = math.random(x)
	for i = 1, #items do
		local dasChance = items[i][1]
		itemName = items[i][2]
		itemMessage = items[i][3]
		y = y + dasChance
		if y > chance then
			break
		end
	end
	return itemName, itemMessage
end

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local spectators = Game.getSpectators(Position(33628, 32370, 5), false, true, 20, 20, 20, 20)
	if #spectators < 1 then
		return false
	end
	
	for i = 1, #spectators do
		local spectator = spectators[i]
		if spectator.uid ~= player.uid then
			-- should it send some message if player isn't near the dreamcatcher device?
			return false
		end
	end
	
	randomizeItem()
	if not player:addItem(itemName) then
		print("Bug in unrealizedDream.lua. Could not create ".. itemName ..". Player name: ".. player:getName() ..".")
		return false
	end
	
	item:remove(1)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, itemMessage)
	return true
end