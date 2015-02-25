local voices = {
	"Hear me! Hear me! The mage Wyrdin in the Edron academy is looking for brave adventurers to undertake a task!",
	"Hear me! Hear me! The postmaster's guild has open spots for aspiring postmen! Contact Kevin Postner at the post office in the plains south of Kazordoon!",
	"Hear me! Hear me! The inquisition is looking for daring people to fight evil! Apply at the inquisition headquarters next to the Thaian jail!",
	"Hear me! Hear me! Stand and deliver! That's what they shout, robbing banks in main's coastal towns and then hide out. Catch the thieves and make us proud, bring back the gold to please the crowd!",
	"Hear me! Hear me! A river is flooding, south of the outlaw base. Explore a new isle, an unknown place. Don't be afraid, but ready your blade.",
	"Hear me! Hear me! The volcano on Goroma is spitting fire. Creatures are spawning, strong and dire. Lava is heading up the land. Adventurer, be careful or it will be your last stand!",
	"Hear me! Hear me! It is Kingsday, people, let us celebrate and sing! Decorate Thais and let the bells ring! Come to the arena to hear the swords cling. Let us rejoice! Hail to the King!",
	"Hear me! Hear me! North of the Queen's town, the royal trees are cut down. Will you deal with the suspect or report such kind of disrespect?",
	"Hear me! Hear me! Noodles is gone, the King in despair! Find the little rascal, look everywhere. Bring him back to get rewarded for your care!",
	"Hear me! Hear me! Ankrahmun's desert is the nomads' land. Find their camp in the golden sand, and a treasure may be close at hand!",
	"Hear me! Hear me! What a lucky and beautiful day! Visit Carlin, Ankrahmun, or Liberty Bay. Yasir, the oriental trader might be there. Gather your creature products, for this chance is rare.",
	"Hear me! Hear me! In Zao Steppe the river runs deep. If you catch a strange fish it is yours to keep.",
	"Hear me! Hear me! Tiquanda's elephants are terrified, the Ape God's footsteps are a scary sight. So hunt for theirs tusks while they are filled with fright!",
	"Hear me! Hear me! Mammoths silently watch as the snow melts away. It reveals special flowers which are not meant to stay. Grow their seeds to brighten up your day!",
	"Hear me! Hear me! The witch Wyda seems to be bored. Pay her a visit but sharpen your sword. She might come up with a terrible surprise, are you brave enough to believe your eyes?"
}

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local lastSound = 0
function onThink()
	if lastSound < os.time() then
		lastSound = (os.time() + 10)
		if math.random(100) < 25 then
			Npc():say(voices[math.random(#voices)], TALKTYPE_SAY)
		end
	end
	npcHandler:onThink()
end
