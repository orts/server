local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

local function venoreOnTravelCallback(cid)
	local player = Player(cid)
	if player:getStorageValue(Storage.postman.Mission01) == 3 then
		player:setStorageValue(Storage.postman.Mission01, 4)
	end
end

local travelNode = keywordHandler:addKeyword({'venore'}, TravelLib.say, {npcHandler = npcHandler, text = 'Do you seek a passage to Venore for %s?', cost = 40, discount = TravelLib.postmanDiscount})
	travelNode:addChildKeyword({'yes'}, TravelLib.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 40, discount = TravelLib.postmanDiscount, destination = Position(32954, 32022, 6), onTravelCallback = venoreOnTravelCallback })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, reset = true, text = 'We would like to serve you some time.'})

local travelNode = keywordHandler:addKeyword({'thais'}, TravelLib.say, {npcHandler = npcHandler, text = 'Do you seek a passage to Thais for %s?', cost = 160, discount = TravelLib.postmanDiscount})
	travelNode:addChildKeyword({'yes'}, TravelLib.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 160, discount = TravelLib.postmanDiscount, destination = Position(32310, 32210, 6) })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, reset = true, text = 'We would like to serve you some time.'})

local travelNode = keywordHandler:addKeyword({'carlin'}, TravelLib.say, {npcHandler = npcHandler, text = 'Do you seek a passage to Carlin for %s?', cost = 110, discount = TravelLib.postmanDiscount})
	travelNode:addChildKeyword({'yes'}, TravelLib.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 110, discount = TravelLib.postmanDiscount, destination = Position(32387, 31820, 6) })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, reset = true, text = 'We would like to serve you some time.'})

local travelNode = keywordHandler:addKeyword({'ab\'dendriel'}, TravelLib.say, {npcHandler = npcHandler, text = 'Do you seek a passage to Ab\'Dendriel for %s?', cost = 70, discount = TravelLib.postmanDiscount})
	travelNode:addChildKeyword({'yes'}, TravelLib.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 70, discount = TravelLib.postmanDiscount, destination = Position(32734, 31668, 6) })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, reset = true, text = 'We would like to serve you some time.'})

local travelNode = keywordHandler:addKeyword({'gray island'}, TravelLib.say, {npcHandler = npcHandler, text = 'Do you seek a passage to Gray Island for %s?', cost = 150, discount = TravelLib.postmanDiscount})
	travelNode:addChildKeyword({'yes'}, TravelLib.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 150, discount = TravelLib.postmanDiscount, destination = Position(33196, 31984, 7) })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, reset = true, text = 'We would like to serve you some time.'})

local travelNode = keywordHandler:addKeyword({'port hope'}, TravelLib.say, {npcHandler = npcHandler, text = 'Do you seek a passage to Port Hope for %s?', cost = 150, discount = TravelLib.postmanDiscount})
	travelNode:addChildKeyword({'yes'}, TravelLib.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 150, discount = TravelLib.postmanDiscount, destination = Position(32527, 32784, 6) })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, reset = true, text = 'We would like to serve you some time.'})

local travelNode = keywordHandler:addKeyword({'liberty bay'}, TravelLib.say, {npcHandler = npcHandler, text = 'Do you seek a passage to Liberty Bay for %s?', cost = 170, discount = TravelLib.postmanDiscount})
	travelNode:addChildKeyword({'yes'}, TravelLib.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 170, discount = TravelLib.postmanDiscount, destination = Position(32285, 32892, 6) })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, reset = true, text = 'We would like to serve you some time.'})

local travelNode = keywordHandler:addKeyword({'ankrahmun'}, TravelLib.say, {npcHandler = npcHandler, text = 'Do you seek a passage to Ankrahmun for %s?', cost = 160, discount = TravelLib.postmanDiscount})
	travelNode:addChildKeyword({'yes'}, TravelLib.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 160, discount = TravelLib.postmanDiscount, destination = Position(33092, 32883, 6) })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, reset = true, text = 'We would like to serve you some time.'})

local travelNode = keywordHandler:addKeyword({'cormaya'}, TravelLib.say, {npcHandler = npcHandler, text = 'Do you seek a passage to Cormaya for %s?', cost = 20, discount = TravelLib.postmanDiscount})
	travelNode:addChildKeyword({'yes'}, TravelLib.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 20, discount = TravelLib.postmanDiscount, destination = Position(33288, 31956, 6) })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, reset = true, text = 'We would like to serve you some time.'})

keywordHandler:addKeyword({'sail'}, StdModule.say, {npcHandler = npcHandler, text = 'Where do you want to go? To {Thais}, {Carlin}, {Ab\'Dendriel}, {Venore}, {Port Hope}, {Ankrahmun}, {Liberty Bay}, {Gray Island} or the isle {Cormaya}?'})
keywordHandler:addKeyword({'passage'}, StdModule.say, {npcHandler = npcHandler, text = 'Where do you want to go? To {Thais}, {Carlin}, {Ab\'Dendriel}, {Venore}, {Port Hope}, {Ankrahmun}, {Liberty Bay}, {Gray Island} or the isle {Cormaya}?'})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, text = 'My name is Captain Seahorse from the Royal Tibia Line.'})
keywordHandler:addKeyword({'edron'}, StdModule.say, {npcHandler = npcHandler, text = 'This is Edron. Where do you want to go?'})
keywordHandler:addKeyword({'yalahar'}, StdModule.say, {npcHandler = npcHandler, text = 'I\'m sorry, but we don\'t serve this route. However, I heard that Wyrdin here in Edron is looking for adventurers to go on a trip to Yalahar for him.'})

npcHandler:setMessage(MESSAGE_GREET, 'Welcome on board, |PLAYERNAME|. Where may I {sail} you today?')
npcHandler:setMessage(MESSAGE_FAREWELL, 'Good bye. Recommend us if you were satisfied with our service.')
npcHandler:setMessage(MESSAGE_WALKAWAY, 'Good bye then.')
npcHandler:addModule(FocusModule:new())
