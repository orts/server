local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)          npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)       npcHandler:onCreatureDisappear(cid)         end
function onCreatureSay(cid, type, msg)      npcHandler:onCreatureSay(cid, type, msg)        end

local lastSound = 0
function onThink()
	if lastSound < os.time() then
		lastSound = (os.time() + 5)
		if math.random(100) < 25 then
			Npc():say("Mooh! Tah!", TALKTYPE_SAY)
		end
	end
	npcHandler:onThink()
end

local function addSpellKeyword(keyword, spellName, level, price)
	local spellKeyword = keywordHandler:addKeyword(keyword, StdModule.say, {npcHandler = npcHandler, text = string.format("Do you want to learn the spell '%s' for %s?", spellName, price > 0 and price .. ' gold' or 'free')}, function(player) return player:isKnight() end)
		spellKeyword:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, spellName = spellName, level = level, price = price})
		spellKeyword:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, text = 'Maybe next time.', reset = true})
end

addSpellKeyword({'find', 'person'}, 'Find Person', 8, 80)
addSpellKeyword({'light'}, 'Light', 8, 0)
addSpellKeyword({'cure', 'poison'}, 'Cure Poison', 10, 150)
addSpellKeyword({'wound', 'cleansing'}, 'Wound Cleansing', 8, 0)
addSpellKeyword({'great', 'light'}, 'Great Light', 13, 500)

addSpellKeyword({'light', 'healing'}, 'Light Healing', 8, 0)
addSpellKeyword({'conjure', 'arrow'}, 'Conjure Arrow', 13, 450)
addSpellKeyword({'conjure', 'poisoned', 'arrow'}, 'Conjure Poisoned Arrow', 16, 700)
addSpellKeyword({'destroy', 'field'}, 'Destroy Field', 17, 700)
addSpellKeyword({'intense', 'healing'}, 'Intense Healing', 20, 350)
addSpellKeyword({'conjure', 'explosive', 'arrow'}, 'Conjure Explosive Arrow', 25, 1000)
addSpellKeyword({'divine', 'healing'}, 'Divine Healing', 35, 3000)

keywordHandler:addKeyword({'attack', 'spells'}, StdModule.say, {npcHandler = npcHandler, text = 'Sorry, I don\'t teach spells for your vocation.'}, function(player) return not player:isKnight() end)
keywordHandler:addAliasKeyword({'healing', 'spells'})
keywordHandler:addAliasKeyword({'support', 'spells'})
keywordHandler:addAliasKeyword({'spells'})

keywordHandler:addKeyword({'healing', 'spells'}, StdModule.say, {npcHandler = npcHandler, text = "In this category I have '{Bruise Bane}', '{Cure Bleeding}', '{Wound Cleansing}', '{Cure Poison}', '{Intense Wound Cleansing}', '{Recovery}' and '{Intense Recovery}'."})
keywordHandler:addKeyword({'attack', 'spells'}, StdModule.say, {npcHandler = npcHandler, text = {"In this category I have '{Whirlwind Throw}', '{Groundshaker}', '{Berserk}' and '{Fierce Berserk}' as well as ...", "'{Brutal Strike}', '{Front Sweep}', '{Inflict Wound}' and '{Annihilation}'"}})
keywordHandler:addKeyword({'support', 'spells'}, StdModule.say, {npcHandler = npcHandler, text = "In this category I have '{Light}', '{Find Person}', '{Magic Rope}', '{Levitate}', '{Haste}', 'Charge}' and 'Great Light}'."})
keywordHandler:addKeyword({'spells'}, StdModule.say, {npcHandler = npcHandler, text = 'I can teach you {healing spells}, {attack spells} and {support spells}. What kind of spell do you wish to learn? You can also tell me for which level you would like to learn a spell, if you prefer that.'})

npcHandler:setMessage(MESSAGE_GREET, 'I welcome you, |PLAYERNAME|! If you need paladin or knight spells, you\'ve come to the right place.')
npcHandler:setMessage(MESSAGE_FAREWELL, 'May your path be as straight as an arrow.')
npcHandler:setMessage(MESSAGE_WALKAWAY, 'May your path be as straight as an arrow.')

npcHandler:addModule(FocusModule:new())
