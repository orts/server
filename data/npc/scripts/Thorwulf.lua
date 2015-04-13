local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

local function addSpellKeyword(keyword, spellName, level, price)
	local spellKeyword = keywordHandler:addKeyword(keyword, StdModule.say, {npcHandler = npcHandler, text = string.format("Do you want to learn the spell '%s' for %s?", spellName, price > 0 and price .. ' gold' or 'free')}, function(player) return player:isKnight() end)
		spellKeyword:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, spellName = spellName, level = level, price = price})
		spellKeyword:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, text = 'Maybe next time.', reset = true})
end

addSpellKeyword({'find', 'person'}, 'Find Person', 8, 80)
addSpellKeyword({'great', 'light'}, 'Great Light', 13, 500)
addSpellKeyword({'light'}, 'Light', 8, 0)
addSpellKeyword({'magic', 'rope'}, 'Magic Rope', 9, 200)
addSpellKeyword({'cure', 'poison'}, 'Cure Poison', 10, 150)
addSpellKeyword({'intense', 'wound', 'cleansing'}, 'Intense Wound Cleansing', 80, 6000)
addSpellKeyword({'wound', 'cleansing'}, 'Wound Cleansing', 8, 0)
addSpellKeyword({'levitate'}, 'Levitate', 12, 500)
addSpellKeyword({'haste'}, 'Haste', 14, 600)
addSpellKeyword({'brutal', 'strike'}, 'Brutal Strike', 16, 1000)
addSpellKeyword({'charge'}, 'Charge', 25, 1300)
addSpellKeyword({'whirlwind', 'throw'}, 'Whirlwind Throw', 28, 1500)
addSpellKeyword({'groundshaker'}, 'Groundshaker', 33, 1500)
addSpellKeyword({'fierce', 'berserk'}, 'Fierce Berserk', 90, 7500)
addSpellKeyword({'berserk'}, 'Berserk', 35, 2500)
addSpellKeyword({'inflict', 'wound'}, 'Inflict Wound', 40, 2500)
addSpellKeyword({'cure', 'bleeding'}, 'Cure Bleeding', 45, 2500)
addSpellKeyword({'intense', 'recovery'}, 'Intense Recovery', 100, 10000)
addSpellKeyword({'recovery'}, 'Recovery', 50, 4000)
addSpellKeyword({'front', 'sweep'}, 'Front Sweep', 70, 4000)
addSpellKeyword({'annihilation'}, 'Annihilation', 110, 20000)

keywordHandler:addKeyword({'attack', 'spells'}, StdModule.say, {npcHandler = npcHandler, text = 'Sorry, I don\'t teach spells for your vocation.'}, function(player) return not player:isKnight() end)
keywordHandler:addAliasKeyword({'healing', 'spells'})
keywordHandler:addAliasKeyword({'support', 'spells'})
keywordHandler:addAliasKeyword({'spells'})

keywordHandler:addKeyword({'healing', 'spells'}, StdModule.say, {npcHandler = npcHandler, text = "In this category I have '{Bruise Bane}', '{Cure Bleeding}', '{Wound Cleansing}', '{Cure Poison}', '{Intense Wound Cleansing}', '{Recovery}' and '{Intense Recovery}'."})
keywordHandler:addKeyword({'attack', 'spells'}, StdModule.say, {npcHandler = npcHandler, text = {"In this category I have '{Whirlwind Throw}', '{Groundshaker}', '{Berserk}' and '{Fierce Berserk}' as well as ...", "'{Brutal Strike}', '{Front Sweep}', '{Inflict Wound}' and '{Annihilation}'"}})
keywordHandler:addKeyword({'support', 'spells'}, StdModule.say, {npcHandler = npcHandler, text = "In this category I have '{Light}', '{Find Person}', '{Magic Rope}', '{Levitate}', '{Haste}', '{Charge}' and '{Great Light}'."})
keywordHandler:addKeyword({'spells'}, StdModule.say, {npcHandler = npcHandler, text = 'I can teach you {healing spells}, {attack spells} and {support spells}. What kind of spell do you wish to learn? You can also tell me for which level you would like to learn a spell, if you prefer that.'})

npcHandler:setMessage(MESSAGE_GREET, 'Hi |PLAYERNAME|.')
npcHandler:setMessage(MESSAGE_FAREWELL, 'Bye |PLAYERNAME|.')
npcHandler:setMessage(MESSAGE_WALKAWAY, 'Bye.')

npcHandler:addModule(FocusModule:new())
