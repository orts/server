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
addSpellKeyword({'light'}, 'Light', 8, 0)
addSpellKeyword({'cure', 'poison'}, 'Cure Poison', 10, 150)
addSpellKeyword({'wound', 'cleansing'}, 'Wound Cleansing', 8, 0)
addSpellKeyword({'great', 'light'}, 'Great Light', 13, 500)

keywordHandler:addKeyword({'attack', 'spells'}, StdModule.say, {npcHandler = npcHandler, text = 'Sorry, I don\'t teach spells for your vocation.'}, function(player) return not player:isKnight() end)
keywordHandler:addAliasKeyword({'healing', 'spells'})
keywordHandler:addAliasKeyword({'support', 'spells'})
keywordHandler:addAliasKeyword({'spells'})

keywordHandler:addKeyword({'healing', 'spells'}, StdModule.say, {npcHandler = npcHandler, text = "In this category I have '{Wound Cleansing}' and '{Cure Poison}'."})
keywordHandler:addKeyword({'support', 'spells'}, StdModule.say, {npcHandler = npcHandler, text = "In this category I have '{Light}', '{Find Person}' and '{Great Light}'."})
keywordHandler:addKeyword({'spells'}, StdModule.say, {npcHandler = npcHandler, text = 'I can teach you {healing spells} and {support spells}. What kind of spell do you wish to learn? You can also tell me for which level you would like to learn a spell, if you prefer that.'})

npcHandler:setMessage(MESSAGE_GREET, 'Hiho, fellow knight |PLAYERNAME|!')
npcHandler:setMessage(MESSAGE_FAREWELL, 'Goodbye.')
npcHandler:setMessage(MESSAGE_WALKAWAY, 'Be carefull out there, jawoll.')

npcHandler:addModule(FocusModule:new())
