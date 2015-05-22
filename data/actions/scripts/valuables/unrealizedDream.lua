function onUse(player, item, fromPosition, target, toPosition, isHotkey)

local amountOfPlayers = 1
local spectators = Game.getSpectators(Position(33628, 32370, 5), false, true, 20, 20, 20, 20)
	if #spectators < amountOfPlayers then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "you need a dreamcatcher device.")
	return true
end

--Unrealized Dream--
chance = math.random(1,22)

if chance == 1 then
player:addItem(2111,1) -- Snowball
player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You try to concentrate and your dream comes true. You wished for something cool.")

elseif chance == 2 then
player:addItem(2223,1) -- Rubbish
player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You try to concentrate and your dream comes true. You knew it would be some rubbish!")

elseif chance == 3 then
player:addItem(2114,1) -- Piggy Bank
player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You try to concentrate and your dream comes true. You just thought about your wealth.")

elseif chance == 4 then
player:addItem(2745,1) -- Blue Rose
player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You try to concentrate and your dream comes true. You just thought about spring.")

elseif chance == 5 then
player:addItem(2072,1) -- Lute
player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You try to concentrate and your dream comes true. Well, part of. You thought about getting rich and a pile of loot...")

elseif chance == 6 then
player:addItem(9074,1) -- Present (Explosive)
player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You try to concentrate and your dream comes true. You were that curious for the surprise.")

elseif chance == 7 then
player:addItem(2657,1) -- Simple Dress
player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You try to concentrate and ... Oops, where did that dream come from?")

elseif chance == 8 then
player:addItem(22604,1) -- Silver Prison Key
player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You try to concentrate and your dream comes true. You just thought about a true challenge.")

elseif chance == 9 then
player:addItem(7735,1) -- Spellwand
player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You try to concentrate and your dream comes true. Somehow you seemed to get distracted when you thought of Ferumbras.")

elseif chance == 10 then
player:addItem(5792,1) -- Die
player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You try to concentrate and your dream comes true. You just wondered if you\'d be lucky this time.")

elseif chance == 11 then
player:addItem(2560,1) -- Mirror
player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You try to concentrate and your dream comes true. You shouldn\'t really think about yourself that often.")

elseif chance == 12 then
player:addItem(22396,1) -- Cluster of Solace
player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You try to concentrate and your dream comes true. You thought of your last night\'s dream, You try to concentrate and your dream comes true. You couldn\'t focus on anything specific.")

elseif chance == 13 then
player:addItem(2666,1) -- Meat
player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You try to concentrate and your dream comes true. Unfortunately you were subconsciouly thinking about something to eat.")

elseif chance == 14 then
player:addItem(5929,1) -- Goldfish Bowl
player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You try to concentrate and your dream comes true. You just thought about a loyal companion.")

elseif chance == 15 then
player:addItem(22605,1) -- Copper Prison Key
player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You try to concentrate and your dream comes true. You just thought about a true challenge.")

elseif chance == 16 then
player:addItem(22606,1) -- Bronze Prison Key
player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You try to concentrate and your dream comes true. You just thought about a true challenge.")

elseif chance == 17 then
player:addItem(22607,1) -- Golden Prison Key
player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You try to concentrate and your dream comes true. You just thought about a true challenge.")

elseif chance == 18 then
player:addItem(2121,1) -- Wedding Ring
player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You try to concentrate and your dream comes true. You wonder what were you thinking about.")

elseif chance == 19 then
player:addItem(2355,1) -- Stuffed Bunny
player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You try to concentrate and your dream comes true. You just thought about having a true friend.")

elseif chance == 20 then
player:addItem(22609,1) -- Dream Warden Claw
player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You try to concentrate and your dream comes true. You wonder what were you thinking about.")

elseif chance == 21 then
player:addItem(7459,1) -- Pair of Earmuffs
player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You try to concentrate and your dream comes true. Sadly you had cold ears just in that moment.")

elseif chance == 22 then
player:addItem(13537,1) -- Bag of Apple Slices
player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You try to concentrate and your dream comes true. You thought about your sore feet.")
end

item:getPosition():sendMagicEffect(26)
item:remove(1)
return true
end
