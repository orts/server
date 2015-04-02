local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()		npcHandler:onThink()		end

-- Greeting and Farewell
keywordHandler:addKeyword({'hi'}, StdModule.say, {npcHandler = npcHandler, onlyUnfocus = true, text = 'CHILD! COME BACK WHEN YOU HAVE GROWN UP!'}, function(player) return player:getLevel() < 8 end)

keywordHandler:addGreetKeyword({'hi'}, {npcHandler = npcHandler, text = '|PLAYERNAME|, I CAN\'T LET YOU LEAVE - YOU ARE TOO STRONG ALREADY! YOU CAN ONLY LEAVE WITH LEVEL 8 OR 9.'}, function(player) return player:getLevel() >= 10 end)

local hiKeyword = keywordHandler:addGreetKeyword({'hi'}, {npcHandler = npcHandler, text = '|PLAYERNAME|, ARE YOU PREPARED TO FACE YOUR DESTINY?'})
	local yesKeyword = hiKeyword:addChildKeyword({'yes'}, StdModule.say, {npcHandler = npcHandler, text = 'I WILL BRING YOU TO THE ISLAND OF DESTINY AND YOU WILL BE UNABLE TO RETURN HERE! ARE YOU SURE?'})
		yesKeyword:addChildKeyword({'yes'}, StdModule.say, {npcHandler = npcHandler, text = 'SO BE IT!', ungreet = true}, nil,
			function(player)
				local islandOfDestiny = Town('Island Of Destiny')
				player:teleportTo(islandOfDestiny:getTemplePosition())
				player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
				player:setTown(islandOfDestiny:getId())
			end
		)
	hiKeyword:addChildKeyword({''}, StdModule.say, {npcHandler = npcHandler, text = 'COME BACK WHEN YOU ARE PREPARED TO FACE YOUR DESTINY!', ungreet = true})
keywordHandler:addAliasKeyword({'hello'})

keywordHandler:addFarewellKeyword({'bye'}, {npcHandler = npcHandler, text = 'COME BACK WHEN YOU ARE PREPARED TO FACE YOUR DESTINY!'})

npcHandler:setMessage(MESSAGE_WALKAWAY, 'COME BACK WHEN YOU ARE PREPARED TO FACE YOUR DESTINY!')

npcHandler:addModule(FocusModule:new())
