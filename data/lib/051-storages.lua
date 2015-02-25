-- STORAGES --
-- (HIGHLY RECOMMENDED -> ONE mission per STORAGE) --
-- Sort it in Values -

Storage = {
	SweetyCyclops = {
		AmuletTimer = 48,
		AmuletStatus = 49
	},
	ExplorerSociety = {
		QuestLine = 90,
		bansheeDoor = 91,
		bonelordsDoor = 92,
		calassaDoor = 93,
		edronDoor = 94,
		elvenDoor = 95,
		orcDoor = 96,
		urnDoor = 97
	},
	TravellingTrader = {
		Mission01 = 101,
		Mission02 = 102,
		Mission03 = 103,
		Mission04 = 104,
		Mission05 = 105,
		Mission06 = 106,
		Mission07 = 107,
		packageDoor = 108
	},
	DjinnWar = {
		Faction = {
			Greeting = 50717,
			Marid = 50718,
			Efreet = 50719
		},

		RecievedLamp = 50720,

		-- blue djinn
		MaridFaction = {
			Start = 110,
			Mission01 = 111,
			Mission02 = 112,
			RataMari = 113,
			Mission03 = 114,
			DoorToLamp = 115,
			DoorToEfreetTerritory = 116
		},
		-- green djinn
		EfreetFaction = {
			Start = 120,
			Mission01 = 121,
			Mission02 = 122,
			Mission03 = 123,
			DoorToLamp = 124,
			DoorToMaridTerritory = 125
		}
	},
	VampireHunter = {
		Rank = 402
	},
	BigfootBurden = {
		QuestLine = 900,
		Test = 901,
		Shooting = 902,

		MelodyTone1 = 904,
		MelodyTone2 = 905,
		MelodyTone3 = 906,
		MelodyTone4 = 907,
		MelodyTone5 = 908,
		MelodyTone6 = 909,
		MelodyTone7 = 910,

		MelodyStatus = 911,

		Rank = 921,

		MissionCrystalKeeper = 930,
		CrystalKeeperTimout = 931,
		RepairedCrystalCount = 932,

		MissionRaidersOfTheLostSpark = 933,
		ExtractedCount = 934,
		RaidersOfTheLostSparkTimeout = 935,

		MissionExterminators = 936,
		ExterminatedCount = 937,
		ExterminatorsTimeout = 938,

		MissionMushroomDigger = 939,
		MushroomCount = 940,
		MushroomDiggerTimeout = 941,

		MissionMatchmaker = 942,
		MatchmakerStatus = 943,
		MatchmakerTimeout = 944,

		MissionTinkersBell = 945,
		GolemCount = 946,
		TinkerBellTimeout = 947,

		MissionSporeGathering = 948,
		SporeCount = 949,
		SporeGatheringTimeout = 950,

		MissionGrindstoneHunt = 951,
		GrindstoneStatus = 952,
		GrindstoneTimeout = 953,

		WarzoneStatus = 954,
		Warzone1Access = 955,
		Warzone2Access = 956,
		Warzone3Access = 957,

		Warzone1Reward = 958,
		Warzone2Reward = 959,
		Warzone3Reward = 960
	},
	TheirMastersVoice = {
		SlimeGobblerTimeout = 984,
		SlimeGobblerReceived = 985
	},
	KosheiTheDeathless = {
		RewardDoor = 3066
	},
	ElementalSphere = {
		QuestLine = 10000,
		BossStorage = 10001,
		MachineGemCount = 10002
	},
	GravediggerOfDrefia = {
		-- Just numbered the storages by the order they are used in the quest
		-- should be renamed to the correct mission names etc.
		QuestStart = 9990,
		Mission01 = 9991,
		Mission02 = 9992,
		Mission03 = 9993,
		Mission04 = 9994,
		Mission05 = 9995,
		Mission06 = 9996,
		Mission07 = 9997,
		Mission08 = 9998,
		Mission09 = 9999,
		Mission10 = 9950,
		Mission11 = 9951,
		Mission12 = 9952,
		Mission13 = 9953,
		Mission14 = 9954,
		Mission15 = 9955,
		Mission16 = 9956,
		Mission17 = 9957,
		Mission18 = 9958,
		Mission19 = 9959,
		Mission20 = 9960,
		Mission21 = 9961,
		Mission22 = 9962,
		Mission23 = 9963,
		Mission24 = 9964,
		Mission25 = 9965,
		Mission26 = 9966,
		Mission27 = 9967,
		Mission28 = 9968,
		Mission29 = 9969,
		Mission30 = 9970,
		Mission31 = 9971,
		Mission32 = 9972,
		Mission32a = 9973,
		Mission32b = 9974,
		Mission33 = 9975,
		Mission34 = 9976,
		Mission35 = 9977,
		Mission36 = 9978,
		Mission36a = 9979,
		Mission37 = 9980,
		Mission38 = 9981,
		Mission38a = 9982,
		Mission38b = 9983,
		Mission38c = 9984,
		Mission39 = 9985,
		Mission40 = 9986,
		Mission41 = 9987,
		Mission42 = 9988,
		Mission43 = 9989,
		Mission44 = 9920,
		Mission45 = 9921,
		Mission46 = 9922,
		Mission47 = 9923,
		Mission48 = 9924,
		Mission49 = 9925,
		Mission50 = 9926,
		Mission51 = 9927,
		Mission52 = 9928,
		Mission53 = 9929,
		Mission54 = 9930,
		Mission55 = 9931,
		Mission56 = 9932,
		Mission57 = 9933,
		Mission58 = 9934,
		Mission59 = 9935,
		Mission60 = 9936,
		Mission61 = 9937,
		Mission62 = 9938,
		Mission63 = 9939,
		Mission64 = 9940,
		Mission65 = 9941,
		Mission66 = 9942,
		Mission67 = 9943,
		Mission68 = 9944,
		Mission69 = 9945,
		Mission70 = 9946,
		Mission71 = 9947,
		Mission72 = 9948,
		Mission73 = 9949,
		Mission74 = 9876
	},
	OutfitQuest = {
		DefaultStart = 12010, -- until all outfit quests are completed
		Ref = 12010,

		Afflicted = {
			Outfit = 12005,
			AddonPlagueMask = 12006,
			AddonPlagueBell = 12007
		},

		Citizen = {
			-- Mission storages for temporary questlog entries
			MissionHat = 12009,
			AddonHat = 12011,

			MissionBackpack = 12008,
			AddonBackpack = 12012,
			AddonBackpackTimer = 12017
		},

		-- Begger Outfit Quest
		BeggarFirstAddon = 22029,
		BeggarSecondAddon = 22030,

		-- Druid-outfit Quest
		DruidHatAddon = 12013,
		DruidBodyAddon = 12014,
		DruidAmuletDoor = 12020,

		-- Barbarian-outfit Quest
		BarbarianAddon = 12015,
		BarbarianAddonWaitTimer = 12016,

		-- Beggar
		BeggarOutfit = 12018,
		BeggarOutfitTimer = 12019,

		-- Hunter-outfit Quest
		HunterMusicSheet01 = 12050,
		HunterMusicSheet02 = 12051,
		HunterMusicSheet03 = 12052,
		HunterMusicSheet04 = 12053,
		HunterBodyAddon = 12054,
		HunterHatAddon = 12055,

		Hunter = {
			AddonGlove = 12054,
			AddonHat = 12055
		},

		Knight = {
			AddonSword = 12153,

			MissionHelmet = 12154,
			AddonHelmet = 12155,
			AddonHelmetTimer = 12156,
			RamsaysHelmetDoor = 12160
		},

		MageSummoner = {
			AddonWand = 12061,
			AddonBelt = 12062,
			MissionHatCloak = 12063,
			AddonHatCloak = 12064
		},

		-- Nobleman Outfit
		NoblemanFirstAddon = 12069,
		NoblemanSecondAddon = 12070,

		-- Norseman-outfit Quest
		NorsemanAddon = 12065,

		-- Warrior-outfit Quest
		WarriorShoulderAddon = 12067,
		WarriorSwordAddon = 12068,
		WarriorShoulderTimer = 12071,

		-- Wizard-outfit Quest
		WizardAddon = 12066,

		-- Pirate-outfit Quest
		PirateSabreAddon = 50002,
		PirateHatAddon = 22034,

		-- Assassin Outfit
		AssassinBaseOutfit = 50080,
		AssassinFirstAddon = 50081,
		AssassinSecondAddon = 50082,

		NightmareOutfit = 50083,
		NightmareDoor = 3040,
		BrotherhoodOutfit = 50084,
		BrotherhoodDoor = 3044,

		Shaman = {
			AddonStaffMask = 15000,
			MissionStaff = 15001,
			MissionMask = 15002
		},

		firstOrientalAddon = 50137,
		secondOrientalAddon = 50138
	},
	TheAncientTombs = {
		DefaultStart = 12100,
		VashresamunInstruments = 12109,
		MorguthisBlueFlameStorage1 = 50214,
		MorguthisBlueFlameStorage2 = 50215,
		MorguthisBlueFlameStorage3 = 50216,
		MorguthisBlueFlameStorage4 = 50217,
		MorguthisBlueFlameStorage5 = 50218,
		MorguthisBlueFlameStorage6 = 50219,
		MorguthisBlueFlameStorage7 = 50220
	},
	TheApeCity = {
		Started = 12120,
		Questline = 12121, -- Storage through the Quest
		DworcDoor = 12122,
		ChorDoor = 12123,
		ParchmentDecyphering = 12124,
		FibulaDoor = 12125,
		WitchesCapSpot = 12126,
		CasksDoor = 12127,
		Casks = 12128,
		HolyApeHair = 12129,
		SnakeDestroyer = 12151,
		ShamanOufit = 12152
	},
	TheNewFrontier = {
		Questline = 12130, -- Storage through the Quest
		Mission01 = 12131,
		Mission02 = 12132,
		Mission03 = 12133,
		Mission04 = 12134,
		Mission05 = 12135,
		Mission06 = 12136,
		Mission07 = 12137,
		Mission08 = 12138,
		Mission09 = 12139,
		Mission10 = 12140,
		TomeofKnowledge = 12141,
		Beaver1 = 12142,
		Beaver2 = 12143,
		Beaver3 = 12144,
		BribeKing = 12145,
		BribeLeeland = 12146,
		BribeExplorerSociety = 12147,
		BribeWydrin = 12148,
		BribeTelas = 12149,
		BribeHumgolf = 12150
	},
	TheInquisition = {
		Questline = 12160, -- Storage through the Quest
		Mission01 = 12161,
		Mission02 = 12162,
		Mission03 = 12163,
		Mission04 = 12164,
		Mission05 = 12165,
		Mission06 = 12166,
		Mission07 = 12167,
		GrofGuard = 12170,
		KulagGuard = 12171,
		MilesGuard = 12172,
		TimGuard = 12173,
		WalterGuard = 12174,
		StorkusVampiredust = 12175,
		EnterTeleport = 12176,
		Reward = 12177
	},
	BarbarianTest = {
		Questline = 12190, -- Storage through the Quest
		Mission01 = 12191,
		Mission02 = 12192,
		Mission03 = 12193,
		MeadTotalSips = 12194,
		MeadSuccessSips = 12195
	},
	TheIceIslands = {
		Questline = 12200, -- Storage through the Quest
		Mission01 = 12201, -- Befriending the Musher
		Mission02 = 12202, -- Nibelor 1: Breaking the Ice
		Mission03 = 12203, -- Nibelor 2: Ecological Terrorism
		Mission04 = 12204, -- Nibelor 3: Artful Sabotage
		Mission05 = 12205, -- Nibelor 4: Berserk Brewery
		Mission06 = 12206, -- Nibelor 5: Cure the Dogs
		Mission07 = 12207, -- The Secret of Helheim
		Mission08 = 12208, -- The Contact
		Mission09 = 12209, -- Formorgar Mines 1: The Mission
		Mission10 = 12210, -- Formorgar Mines 2: Ghostwhisperer
		Mission11 = 12211, -- Formorgar Mines 3: The Secret
		Mission12 = 12212, -- Formorgar Mines 4: Retaliation
		PickAmount = 12213,
		PaintSeal = 12214,
		SulphurLava = 12215,
		SporesMushroom = 12216,
		FrostbiteHerb = 12217,
		FlowerCactus = 12218,
		FlowerBush = 12219,
		MemoryCrystal = 12220,
		Obelisk01 = 12221,
		Obelisk02 = 12222,
		Obelisk03 = 12223,
		Obelisk04 = 12224,
		yakchalDoor = 7814
	},
	TheWayToYalahar = {
		QuestLine = 30
	},
	InServiceofYalahar = {
		Questline = 12240, -- Storage through the Quest
		Mission01 = 12241,
		Mission02 = 12242,
		Mission03 = 12243,
		Mission04 = 12244,
		Mission05 = 12245,
		Mission06 = 12246,
		Mission07 = 12247,
		Mission08 = 12248,
		Mission09 = 12249,
		Mission10 = 12250,
		SewerPipe01 = 12251,
		SewerPipe02 = 12252,
		SewerPipe03 = 12253,
		SewerPipe04 = 12254,
		DiseasedDan = 12255,
		DiseasedBill = 12256,
		DiseasedFred = 12257,
		AlchemistFormula = 12258,
		BadSide = 12259,
		GoodSide = 12260,
		MrWestDoor = 12261,
		MrWestStatus = 12262,
		TamerinStatus = 12263,
		MorikSummon = 12264,
		QuaraState = 12265,
		QuaraSplasher = 12266,
		QuaraSharptooth = 12267,
		QuaraInky = 12268,
		MatrixState = 12269,
		SideDecision = 12270,
		MatrixReward = 12271,
		NotesPalimuth = 12272,
		NotesAzerus = 12273,
		DoorToAzerus = 12274,
		DoorToBog = 12275,
		DoorToLastFight = 12276,
		DoorToMatrix = 12277,
		DoorToQuara = 12278,
		DoorToReward = 12279
	},
	ChildrenoftheRevolution = {
		Questline = 12300, -- Storage through the Quest
		Mission00 = 12301, -- Prove Your Worzz!
		Mission01 = 12302,
		Mission02 = 12303,
		Mission03 = 12304,
		Mission04 = 12305,
		Mission05 = 12306,
		SpyBuilding01 = 12307,
		SpyBuilding02 = 12308,
		SpyBuilding03 = 12309,
		StrangeSymbols = 12310
	},
	UnnaturalSelection = {
		Questline = 12330, -- Storage through the Quest
		Mission01 = 12331,
		Mission02 = 12332,
		Mission03 = 12333,
		Mission04 = 12334,
		Mission05 = 12335,
		Mission06 = 12336,
		DanceStatus = 12337
	},
	WrathoftheEmperor = {
		Questline = 12350, -- Storage through the Quest
		Mission01 = 12351,
		Mission02 = 12352,
		Mission03 = 12353,
		Mission04 = 12354,
		Mission05 = 12355,
		Mission06 = 12356,
		Mission07 = 12357,
		Mission08 = 12358,
		Mission09 = 12359,
		Mission10 = 12360,
		Mission11 = 12361,
		Mission12 = 12362,
		CrateStatus = 12363, --1068
		GuardcaughtYou = 12364, --1062
		ZumtahStatus = 12365, --1066
		PrisonReleaseStatus = 12366, --1067
		GhostOfAPriest01 = 12367, --1070
		GhostOfAPriest02 = 12368, --1071
		GhostOfAPriest03 = 12369, --1072
		InterdimensionalPotion = 12370, --1084
		BossStatus = 12371, --1090
		platinumReward = 12372,
		backpackReward = 12373,
		mainReward = 12374,

		-- never set just added here
		TeleportAccess = 1060
	},
	FriendsandTraders = {
		DefaultStart = 12400,
		TheSweatyCyclops = 12401,
		TheMermaidMarina = 12402,
		TheBlessedStake = 12403,
		TheBlessedStakeWaitTime = 12404
	},
	postman = {
		Mission01 = 12450,
		Mission02 = 12451,
		Mission03 = 12452,
		Mission04 = 12453,
		Mission05 = 12454,
		Mission06 = 12455,
		Mission07 = 12456,
		Mission08 = 12457,
		Mission09 = 12458,
		Mission10 = 12459,
		Rank = 12460,
		Door = 12461,

		TravelCarlin = 251,
		TravelEdron = 252,
		TravelVenore = 253,
		TravelCormaya = 254
	},
	thievesGuild = {
		Quest = 12501,
		Mission01 = 12502,
		Mission02 = 12503,
		Mission03 = 12504,
		Mission04 = 12505,
		Mission05 = 12506,
		Mission06 = 12507,
		Mission07 = 12508,
		Mission08 = 12509,
		Door = 12510,
		Reward = 12513,
		TheatreScript = 12514
	},
	CaptainHaba = 12540,
	secretService = {
		Quest = 12550,
		TBIMission01 = 12551,
		AVINMission01 = 12552,
		CGBMission01 = 12553,
		TBIMission02 = 12554,
		AVINMission02 = 12555,
		CGBMission02 = 12556,
		TBIMission03 = 12557,
		AVINMission03 = 12558,
		CGBMission03 = 12559,
		TBIMission04 = 12560,
		AVINMission04 = 12561,
		CGBMission04 = 12562,
		TBIMission05 = 12563,
		AVINMission05 = 12564,
		CGBMission05 = 12565,
		TBIMission06 = 12566,
		AVINMission06 = 12567,
		CGBMission06 = 12568,
		Mission07 = 12569,
		RottenTree = 12578
	},
	hiddenCityOfBeregar = {
		DefaultStart = 12600,
		WayToBeregar = 12601,
		OreWagon = 12602,
		GoingDown = 12603,
		JusticeForAll = 12604,
		GearWheel = 12605,
		SweetAsChocolateCake = 12606,
		RoyalRescue = 12607,
		TheGoodGuard = 12608,
		PythiusTheRotten = 12609,
		DoorNorthMine = 12610,
		DoorWestMine = 12611,
		DoorSouthMine = 12612,
		BrownMushrooms = 12613
	},
	TibiaTales = {
		DefaultStart = 12650,
		ultimateBoozeQuest = 12651,
		AgainstTheSpiderCult = 12652,
		AnInterestInBotany = 12653,
		AnInterestInBotanyChest = 12654,
		IntoTheBonePit = 3938,
		TheExterminator = 3939,
		RestInHallowedGround = {
			Questline = 3940,
			HolyWater = 3941,
			Graves = {
				Grave1 = 3942,
				Grave2 = 3943,
				Grave3 = 3944,
				Grave4 = 3945,
				Grave5 = 3946,
				Grave6 = 3947,
				Grave7 = 3948,
				Grave8 = 3949,
				Grave9 = 3950,
				Grave10 = 3951,
				Grave11 = 3952,
				Grave12 = 3953,
				Grave13 = 3954,
				Grave14 = 3955,
				Grave15 = 3956,
				Grave16 = 3957
			}
		}
	},
	TheShatteredIsles = {
		DefaultStart = 12700,
		TheGovernorDaughter = 12701,
		TheErrand = 12702,
		AccessToMeriana = 12703,
		APoemForTheMermaid = 12704,
		ADjinnInLove = 12705,
		AccessToLagunaIsland = 12706,
		AccessToGoroma = 12707,
		Shipwrecked = 12708,
		DragahsSpellbook = 12709,
		TheCounterspell = 12710
	},
	KillingInTheNameOf = {
		LugriNecromancers = 50000,
		LugriNecromancerCount = 50001,

		MissionTiquandasRevenge = 22222,
		TiquandasRevengeTeleport = 22555,
		MissionDemodras = 22223,
		DemodrasTeleport = 22556

	},
	QueenOfBansheesQuest = {
		FirstSeal = 50013,
		SecondSeal = 50019,
		ThirdSeal = 50018,
		FourthSeal = 50016,
		FifthSeal = 50015,
		SixthSeal = 50014,
		LastSeal = 50021,

		ThirdSealWarlocks = 50017,
		Kiss = 50020
	},
	HotCuisineQuest = {
		QuestStart = 50022,
		CurrentDish = 50023,
		QuestLog = 50024,
		CookbookDoor = 50028
	},
	RookgaardTutorialIsland = {
		tutorialHintsStorage = 50085,
		SantiagoNpcGreetStorage = 50086,
		SantiagoQuestLog = 50087,
		cockroachKillStorage = 50088,
		cockroachLegsMsgStorage = 50089,
		cockroachBodyMsgStorage = 50090,
		ZirellaNpcGreetStorage = 50091,
		ZirellaQuestLog = 50092,
		CarlosNpcGreetStorage = 50097,
		CarlosQuestLog = 50098
	},
	DeeperBanutaShortcut = 50095,
	AnnihilatorDone = 2215,
	DemonOak = {
		Done = 1010,
		Progress = 1013,
		Squares = 1014,

		AxeBlowsBird = 8288,
		AxeBlowsLeft = 8289,
		AxeBlowsRight = 8290,
		AxeBlowsFace = 8291
	},
	SvargrondArena = {
		Arena = 1100,
		Pit = 1101,

		QuestLogGreenhorn = 50140,
		QuestLogScrapper = 50141,
		QuestLogWarlord = 50142,

		RewardGreenhorn = 26300,
		RewardScrapper = 27300,
		RewardWarlord = 28300,

		TrophyGreenhorn = 1103,
		TrophyScrapper = 1105,
		TrophyWarlord = 1107,

		-- Reward Doors
		Greenhorn = 26100,
		Scrapper = 27100,
		Warlord = 28100
	},
	QuestChests = {
		-- Todo: Move to a seperate range
		KosheiTheDeathlessLegs = 3067,
		KosheiTheDeathlessGold = 3068,

		TutorialShovel = 50093,
		TutorialRope = 50094,

		DemonHelmetQuestDemonShield = 2212,
		DemonHelmetQuestDemonHelmet = 2213,
		DemonHelmetQuestSteelBoots = 2214,

		FormorgarMinesHoistSkeleton = 3057,
		FormorgarMinesHoistChest = 3058,

		-- Custom Quests, currently not using system.lua (aid 2000)
		BlackKnightTreeCrownShield = 490,
		BlackKnightTreeCrownArmor = 491,
		BlackKnightTreeKey = 9196,

		KosheiAmulet1 = 3062,
		KosheiAmulet2 = 3064,

		SilverBrooch = 9185,
		FamilyBrooch = 2286,

		DCQGhoul = 9155,

		FirewalkerBoots = 9130,

		DeeperFibulaKey = 9136,

		SixRubiesQuest = 50057,

		ParchmentRoomQuest = 60994,

		WarzoneReward1 = 9172,
		WarzoneReward2 = 9173,
		WarzoneReward3 = 9174,

		FathersBurdenQuestWood = 3500,
		FathersBurdenQuestIron = 3501,
		FathersBurdenQuestRoot = 3502,
		FathersBurdenQuestCrystal = 3503,
		FathersBurdenQuestSilk = 3504,
		FathersBurdenQuestCloth = 3505,

		OutlawCampKey1 = 3301,
		OutlawCampKey2 = 3302,
		OutlawCampKey3 = 3303,

		DoubletQuest = 64121,
		HoneyFlower = 64131,
		BananaPalm = 64132,

		WhisperMoss = 50033,
		OldParchment = 50034
	},
	PitsOfInferno = {
		ShortcutHub = 8819,
		ShortcutLevers = 8818,
		Pumin = 50096,

		WeaponReward = 10544,

		ThroneInfernatil = 2080,
		ThroneTafariel = 2081,
		ThroneVerminor = 2082,
		ThroneApocalypse = 2083,
		ThroneBazir = 2084,
		ThroneAshfalor = 2085,
		ThronePumin = 2086
	},
	HorestisTomb = {
		JarFloor1 = 50006,
		JarFloor2 = 50007,
		JarFloor3 = 50008,
		JarFloor4 = 50009,
		JarFloor5 = 50010
	},
	WhiteRavenMonasteryQuest = {
		QuestLog = 50200,
		Passage = 50201,
		Diary = 50202
	},
	FathersBurdenQuest = {
		QuestLog = 50203,
		Progress = 50204,
		Status = 50205,
		Sinew = 50206,
		Wood = 50207,
		Cloth = 50208,
		Silk = 50209,
		Crystal = 50210,
		Root = 50211,
		Iron = 50212,
		Scale = 50213,

		Corpse = {
			Scale = 3006,
			Sinew = 3007
		}
	},
	WhatAFoolishQuest = {
		Questline = 3900,
		Mission1 = 3901,
		Mission2 = 3902,
		Mission3 = 3903,
		Mission4 = 3904,
		Mission5 = 3905,
		Mission6 = 3906,
		Mission7 = 3907,
		Mission8 = 3908,
		Mission9 = 3909,
		Mission10 = 3910,
		Mission11 = 3911,
		PieBuying = 3912,
		PieBoxTimer = 3913,
		TriangleTowerDoor = 3914,
		EmperorBeardShave = 3915,
		JesterOutfit = 3916,
		WhoopeeCushion = 3917,
		QueenEloiseCatDoor = 3918,
		CatBasket = 3919,
		ScaredCarina = 3920,
		InflammableSulphur = 3921,
		SpecialLeaves = 3922,
		Cigar = 3923,
		Contract = 3924,
		CookieDelivery = {
			SimonTheBeggar = 3925,
			Markwin = 3926,
			Ariella = 3927,
			Hairycles = 3928,
			Djinn = 3929,
			AvarTar = 3930,
			OrcKing = 3931,
			Lorbas = 3932,
			Wyda = 3933,
			Hjaern = 3934
		},
		OldWornCloth = 3935,
		LostDisguise = 3936,
		ScaredKazzan = 3937
	},

	SeaOfLightQuest = {
		Questline = 50250,
		Mission1 = 50251,
		Mission2 = 50252,
		Mission3 = 50253,
		StudyTimer = 50254,
		LostMinesCrystal = 50255
	},

	Diapason = {
		Lyre = 500,
		LyreTimer = 501,
		Edala = 502,
		EdalaTimer = 503
	},

	-- Promotion Storage cannot be changed, it is set in source code
	Promotion = 30018,

	SwampDiggingTimeout = 50143,
	HydraEggQuest = 320,
	Dragonfetish = 504,
	EdronRopeQuest = 505,
	GhostShipQuest = 5556,
	OrcKingGreeting = 83,
	MarkwinGreeting = 258,
	SamsOldBackpack = 330,
	wagonTicket = 1131,
	BloodHerbQuest = 50032,
	firstMageWeapon = 50079,
	toOutfoxAFoxQuest = 50135,
	madMageQuest = 50136,
	KawillBlessing = 50139,
	RentedHorseTimer = 50561,
	FountainOfLife = 50572,
	KnightwatchTowerDoor = 9054,

	RookgaardHints = 50700,
	RookgaardDestiny = 50701,

	AdventurersGuild = {
		Stone = 50702,
		MagicDoor = 50703,

		FreeStone = {
			Alia = 50704,
			Amanda = 50705,
			Brewster = 50706,
			Isimov = 50707,
			Kasmir = 50708,
			Kjesse = 50709,
			Lorietta = 50710,
			Maealil = 50711,
			Quentin = 50712,
			RockWithASoftSpot = 50713,
			Tyrias = 50714,
			Yberius = 50715,
			Rahkem = 50716
		}

	},

	DreamersChallenge = {
		Reward = 9050
	},

	EruaranGreeting = 3250,
	Factions = 50716,
	MaryzaCookbook = 50721,
	combatProtectionStorage = 50722,
	blockMovementStorage = 100000
}

GlobalStorage = {
	FuryGates = 100,
	TheirMastersVoice = {
		CurrentServantWave = 984,
		ServantsKilled = 985
	},
	InServiceOfYalahar = {
		LastFight = 982,
		WarGolemsMachine1 = 23700,
		WarGolemsMachine2 = 23701
	},
	Yakchal = 987,
	PitsOfInfernoLevers = 1000,
	Warzones = 3143,
	Weeper = 3144,
	Versperoth = {
		Battle = 3147,
		Health = 3148
	},
	WrathOfTheEmperor = {
		Light01 = 8018,
		Light02 = 8019,
		Light03 = 8020,
		Light04 = 8021,

		Bosses = {
			Fury = 3189,
			Wrath = 3190,
			Scorn = 3191,
			Spite = 3192
		}
	},
	ElementalSphere = {
		BossRoom = 10004,

		KnightBoss = 8568,
		SorcererBoss = 8569,
		PaladinBoss = 8570,
		DruidBoss = 8578,

		Machine1 = 10005,
		Machine2 = 10006,
		Machine3 = 10007,
		Machine4 = 10008
	},
	TheAncientTombs = {
		ThalasSwitchesGlobalStorage = 200,
		DiprathSwitchesGlobalStorage = 201,
		AshmunrahSwitchesGlobalStorage = 202
	},
	NaginataStone = 50058,
	SwordOfFury = 5635
}
