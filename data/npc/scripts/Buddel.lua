local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

-- Travel
local function addTravelKeyword(keyword, text, destination)
	local travelKeyword = keywordHandler:addKeyword({keyword}, StdModule.say, {npcHandler = npcHandler, text = 'Give me |TRAVELCOST| and I bring you to ' .. text, cost = 50, discount = 'postman'})
		travelKeyword:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, cost = 50, discount = 'postman', destination = destination})
		travelKeyword:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, text = 'You shouldn\'t miss the experience.', reset = true})
end

addTravelKeyword('okolnir', 'Okolnir home of the frost dragons. Alright?', Position(32225, 31381, 7))
addTravelKeyword('helheim', 'Heilheim. kay?', Position(32462, 31174, 7))
addTravelKeyword('tyrsung', 'Tyrsung where the Venoran hunters have their settlement. Alright?', Position(32333, 31227, 7))
addTravelKeyword('camp', 'the south of Hrodmir where the camps of the barbarians are located. kay?', Position(32021, 31294, 7))

-- Kick
keywordHandler:addKeyword({'kick'}, StdModule.kick, {npcHandler = npcHandler, text = 'Get out o\' here!*HICKS*', destination = {Position(32255, 31193, 7), Position(32256, 31193, 7), Position(32257, 31193, 7)}})

npcHandler:addModule(FocusModule:new())
