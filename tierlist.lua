local p = {}

-- keywords (and now categories) for wikinerds
local keywordMap = {
	-- starter towers!!
	["Scout"] = { file = "DefaultScout3.png", category = "starter", "tower" },
	["Sniper"] = { file = "DefaultSniperIcon1.png", category = "starter", "tower" },
	["Paintballer"] = { file = "NewPaintballerIcon.png", category = "starter", "tower" },
	["Demoman"] = { file = "DefaultDemomanIcon2.png", category = "starter", "tower" },
	["Soldier"] = { file = "KrampusRevengeSoldierIcon.png", category = "starter", "tower" },
	["Shotgunner"] = { file = "EasterShotgunner_Icon.png", category = "starter", "tower" },

	-- intermediate towers!!
	["Freezer"] = { file = "ReworkedFreezerIcon.png", category = "intermediate", "tower" },
	["Assassin"] = { file = "Assassin.png", category = "intermediate", "tower" },
	["Militant"] = { file = "EasterMilitant_Icon.png", category = "intermediate", "tower" },
	["Pyromancer"] = { file = "DefaultPyromancerIcon.png", category = "intermediate", "tower" },
	["Hunter"] = { file = "NewHunterIcon.png", category = "starter", "tower" },
	["Ace Pilot"] = { file = "AcePilotNewIcon.png", category = "intermediate", "tower" },
	["Medic"] = { file = "DefaultMedicIconAug25.png", category = "intermediate", "tower" },
	["Farm"] = { file = "DefaultFarmIcon.png", category = "intermediate", "tower" },
	["Electroshocker"] = { file = "DefaultElectroshockerIcon2.png", category = "intermediate", "tower" },
	["Rocketeer"] = { file = "RocketeerIcon2025.png", category = "intermediate", "tower" },
	["Trapper"] = { file = "TrapperIcon.png", category = "intermediate", "tower" },
	["Military Base"] = { file = "DefaultMilitaryBaseIconM29.png", category = "intermediate", "tower" },
	["Crook Boss"] = { file = "CBRCBossIcon.png", category = "intermediate", "tower" },

	-- advanced towers!!
	["Commander"] = { file = "Commandernew.png", category = "advanced", "tower" },
	["Warden"] = { file = "Warden.png", category = "advanced", "tower" },
	["Cowboy"] = { file = "WDDefaultCowboyIcon.png", category = "advanced", "tower" },
	["DJ Booth"] = { file = "DefaultDJBoothIconAug2024.png", category = "advanced", "tower" },
	["Tesla"] = { file = "TeslaIcon.png", category = "advanced", "tower" },
	["Minigunner"] = { file = "NewMinigunner.png", category = "advanced", "tower" },
	["Ranger"] = { file = "Newranger.png", category = "advanced", "tower" },
	["Pursuit"] = { file = "PursuitNewIcon.png", category = "advanced", "tower" },
	["Gatling Gun"] = { file = "GatlingGunIcon.png", category = "advanced", "tower" },
	["Turret"] = { file = "TurretIcon.png", category = "advanced", "tower" },
	["Mortar"] = { file = "MortarIcon.png", category = "advanced", "tower" },
	["Mercenary Base"] = { file = "DefaultMercenaryBaseIcon.png", category = "advanced", "tower" },

	-- hardcore towers!!
	["Brawler"] = { file = "BrawlerFromTDS.png", category = "hardcore", "tower" },
	["Necromancer"] = { file = "NecromancerTowerIcon.png", category = "hardcore", "tower" },
	["Accelerator"] = { file = "DefaultAcceleratorIcon2.png", category = "hardcore", "tower" },
	["Engineer"] = { file = "EngineerIcon.png", category = "hardcore", "tower" },
	["Hacker"] = { file = "HackerIcon.png", category = "hardcore", "tower" },
	["Juggernaut"] = { file = "EvolvedJuggernautIcon.png", category = "hardcore", "tower" },

	-- golden perks!!
	["Golden Minigunner"] = { file = "Goldenminigunner.png", category = "golden" },
	["Golden Pyromancer"] = { file = "DHGoldenPyroIcon.png", category = "golden" },
	["Golden Crook Boss"] = { file = "NewGoldenCrookBoss.png", category = "golden" },
	["Golden Scout"] = { file = "GoldenScout3.png", category = "golden" },
	["Golden Cowboy"] = { file = "WDGoldenCowboyIcon.png", category = "golden" },
	["Golden Soldier"] = { file = "KR_Golden_Soldier_Icon.png", category = "golden" },
	["Golden Snowballer"] = { file = "GoldenSnowballer.png", category = "golden" },

	-- exclusive towers!!
	["Gladiator"] = { file = "GladiatorIconn.png", category = "exclusive", "tower" },
	["Commando"] = { file = "NewCommandoIcon.png", category = "exclusive", "tower" },
	["Slasher"] = { file = "HexscapeSlasherIcon.png", category = "exclusive", "tower" },
	["Frost Blaster"] = { file = "KRFrostBlasterIcon.png", category = "exclusive", "tower" },
	["Archer"] = { file = "ArcherIcon2025.png", category = "exclusive", "tower" },
	["Swarmer"] = { file = "NewDefaultSwarmerIcon.png", category = "exclusive", "tower" },
	["Toxic Gunner"] = { file = "ToxicGunnerNewIcon.png", category = "exclusive", "tower" },
	["Sledger"] = { file = "OICESledgerIcon.png", category = "exclusive", "tower" },
	["Executioner"] = { file = "DefaultExecutioner2.png", category = "exclusive", "tower" },
	["Elf Camp"] = { file = "ElfCampNewIcon.png", category = "exclusive", "tower" },
	["Jester"] = { file = "JesterIcon.png", category = "exclusive", "tower" },
	["Cryomancer"] = { file = "OICECryomancerIcon.png", category = "exclusive", "tower" },
	["Hallow Punk"] = { file = "HallowPunkIcon.png", category = "exclusive", "tower" },
	["Harvester"] = { file = "HarvesterIcon.png", category = "exclusive", "tower" },
	["Snowballer"] = { file = "SnowballerIcon.png", category = "exclusive", "tower" },
	["Elementalist"] = { file = "ElementalistIcon.png", category = "exclusive", "tower" },
	["Firework Technician"] = { file = "FireworkTechnicianIcon.png", category = "exclusive", "tower" },
	["Biologist"] = { file = "BiologistIcon.png", category = "exclusive", "tower" },
	["Warlock"] = { file = "WarlockNewIcon.png", category = "exclusive", "tower" },
	["Spotlight Tech"] = { file = "SpotlightTechIcon.png", category = "exclusive", "tower" },
	["War Machine"] = { file = "WarMachineIcon.png", category = "exclusive", "tower" },
	["Mecha Base"] = { file = "OUMechaBaseIcon.png", category = "exclusive", "tower" },
	["Sentry"] = { file = "Sentry.png", category = "exclusive", "tower" },

	-- placeholder for testingg --
	["Place"] = { file = "Place.png", category = "TEST" },
	["PlaceC"] = { file = "PlaceC.png", category = "TEST" },

	-- skins below!! (sigh..) --

	-- scout skins --
	["Red Scout"] = { file = "DHRedScout0.png", category = "common" },
	["Green Scout"] = { file = "DHGreenScout0.png", category = "common" },
	["Blue Scout"] = { file = "DHBlueScout0.png", category = "common" },
	["Survivor Scout"] = { file = "DHSurvivorScout0.png", category = "rare" },
	["Black Ops Scout"] = { file = "DHBlackOpsScout0.png", category = "common" },
	["Party Scout"] = { file = "DHPartyScout0.png", category = "exclusive" },
	["Bunny Scout"] = { file = "DHBunnyScout0.png", category = "exclusive" },
	["Eclipse Scout"] = { file = "DHEclipseScout0.png", category = "exclusive" },
	["Valentines Scout"] = { file = "DHValentinesScout0.png", category = "common" },
	["Beach Scout"] = { file = "BeachScout0.png", category = "exclusive" },
	["Intern Scout"] = { file = "InternScout0.png", category = "rare" },
	["Prime Raven Scout"] = { file = "PR_Scout_LVL0.png", category = "legendary" },
	["Holiday Scout"] = { file = "HolidayScout0.png", category = "exclusive" },
	["Cookie Scout"] = { file = "CookieScout0.png", category = "exclusive" },
	["Frost Hunter Scout"] = { file = "NewFrostHunterScout0.png", category = "common" },
	["Plushie Scout"] = { file = "PlushScout_0.png", category = "exclusive" },
	["Ducky Scout"] = { file = "DuckyScout0.png", category = "common" },
	["Skull Trooper Scout"] = { file = "SkullScout0_(1).png", category = "exclusive" },
	["Masquerade Scout"] = { file = "MasquerateScout0.png", category = "exclusive" },
	["Phantom Scout"] = { file = "PhantomScout0.png", category = "uncommon" },
	["Valhalla Scout"] = { file = "VScout0.png", category = "exclusive" },
	["Toilet Scout"] = { file = "ToiletScoutL0.png", category = "legendary" },
	["Guest Scout"] = { file = "GuestScout0.png", category = "exclusive" },
	["Fallen Scout"] = { file = "FallenScoutLv0.png", category = "rare" },
	["King of Rock Scout"] = { file = "KingofRockScout0.png", category = "common" },
	["Haz3mn Scout"] = { file = "Haz3mnScout0.png", category = "exclusive" },
	["Shark Scout"] = { file = "SharkScout0.png", category = "uncommon" },
	["Banned Scout"] = { file = "BannedScoutLevel0.png", category = "exclusive" },
	["Penguin Scout"] = { file = "PinguScout0.png", category = "uncommon" },

	-- sniper skins --
	["Blue Sniper"] = { file = "DHBlueSniper0.png", category = "common" },
	["Red Sniper"] = { file = "DHRedSniper0.png", category = "common" },
	["Ghillie Sniper"] = { file = "DHGhillieSniper0.png", category = "common" },
	["Valentines Sniper"] = { file = "ValentineSniper0.png", category = "common" },
	["Bunny Sniper"] = { file = "DHBunnySniper0.png", category = "exclusive" },
	["Ducky Sniper"] = { file = "DuckySniper0.png", category = "common" },
	["Silent Sniper"] = { file = "NewSilentSniper0.png", category = "common" },
	["Davinchi Sniper"] = { file = "DavinchiSniper0.png", category = "exclusive" },
	["Redemption Sniper"] = { file = "RedemptionSniper0Fixed.png", category = "uncommon" },
	["Frost Legion Sniper"] = { file = "FrostLegionSniper0.png", category = "common" },
	["Shrimp Sniper"] = { file = "ShrimpSniper0.png", category = "common" },

	-- paintballer skins --
	["Red Paintballer"] = { file = "DHRedPaintballer0.png", category = "common" },
	["Bunny Paintballer"] = { file = "DHBunnyPaintballer0.png", category = "exclusive" },
	["Green Paintballer"] = { file = "GreenPaintballerNew0.png", category = "common" },

	-- demoman skins --
	["Green Demoman"] = { file = "ImprovedAngleDemoG0.png", category = "common" },
	["Blue Demoman"] = { file = "M23BlueDemoman0.png", category = "common" },
	["Military Demoman"] = { file = "M23MilitaryDemoman0.png", category = "uncommon" },
	["Red Demoman"] = { file = "NewRedDemoman0.png", category = "common" },
	["Yellow Demoman"] = { file = "YellowDemoman0.png", category = "common" },
	["Fortress Demoman"] = { file = "FortressDemoman0.png", category = "uncommon" },
	["Pirate Demoman"] = { file = "PirateDemoman0.png", category = "common" },
	["Pumpkin Demoman"] = { file = "PumpkinDemoman0Fixed.png", category = "exclusive" },
	["Ducky Demoman"] = { file = "DuckyDemoman0.png", category = "uncommon" },
	["Ghost Demoman"] = { file = "GhostDemoman0.png", category = "uncommon" },
	["Egg Demoman"] = { file = "EggDemoman0.png", category = "uncommon" },

	-- soldier skins --
	["Blue Soldier"] = { file = "LO Blue Soldier 0.png", category = "common" },
	["Red Soldier"] = { file = "KR Red Soldier 0.png", category = "common" },
	["Cold Soldier Soldier"] = { file = "Cold Soldier Soldier 0.png", category = "uncommon" },
	["Party Soldier"] = { file = "KR Party Soldier 0.png", category = "exclusive" },
	["Toy Soldier"] = { file = "KRToySoldier0.png", category = "common" },
	["Doughboy Soldier"] = { file = "KRDoughboySoldier0.png", category = "common" },
	["Valentines Soldier"] = { file = "KRValentinesSoldier0.png", category = "common" },
	["Ducky Soldier"] = { file = "KRDuckySoldier0.png", category = "common" },
	["Grand Theft Soldier"] = { file = "KRGrandTheftSoldier0.png", category = "common" },
	["Holiday Soldier"] = { file = "KRHolidaySoldier0.png", category = "exclusive" },
	["Beast Slayer Soldier"] = { file = "BSSoldier0.png", category = "exclusive" },
	["Liberator Soldier"] = { file = "LiberatorSoldier0.png", category = "rare" },
	["Toilet Soldier"] = { file = "ToiletSoldier0.png", category = "legendary" },
	["Stealth Ops Soldier"] = { file = "StealthOpsSoldier0.png", category = "rare" },
	["Aerobics Soldier"] = { file = "AerobicsSoldier0.png", category = "common" },
	["Dark Frost Soldier"] = { file = "DFSoldier0.png", category = "uncommon" },
	["Korblox Soldier"] = { file = "KorbloxSoldier0.png", category = "exclusive" },
	["Bunny Soldier"] = { file = "BunnySoldier0.png", category = "uncommon" },
	["Null Soldier"] = { file = "NullSoldier0Noseless.png", category = "uncommon" },


	-- shotgunner skins --
	["Hallow Punk Shotgunner"] = { file = "DHHallowPunk0.png", category = "exclusive" },
	["Slayer Shotgunner"] = { file = "SlayerShotgunner0.png", category = "legendary" },
	["Classic Shotgunner"] = { file = "NewClassicShotgunner0.png", category = "common" },
	["Spooky Shotgunner"] = { file = "DHSpookyShotgunner0.png", category = "exclusive" },
	["Ducky Shotgunner"] = { file = "DuckyShotgunner0.png", category = "uncommon" },
	["Holiday Shotgunner"] = { file = "HolidayShotgunner0.png", category = "exclusive" },
	["Vigilante Shotgunner"] = { file = "VigilanteShotgunner0.png", category = "rare" },
	["Phantom Shotgunner"] = { file = "Phantom Shotgunner 0.png", category = "uncommon" },
	["Dance Fever Shotgunner"] = { file = "DanceFeverShotgunner0.png", category = "uncommon" },
	["Gardener Shotgunner"] = { file = "GardenerShotgunner0.png", category = "rare" },
	["Null Shotgunner"] = { file = "NullShotgunner0.png", category = "uncommon" },
	["Trumpeter Shotgunner"] = { file = "TrumpeterShotgunner0.png", category = "uncommon" },
	["SciBunny Shotgunner"] = { file = "SciBunnyShotgunner0.png", category = "rare" },

	-- freezer skins --
	["Deep Freeze Freezer"] = { file = "KRDFFreezer.png", category = "common" },
	["Mint Choco Freezer"] = { file = "KRMCFreezer.png", category = "uncommon" },
	["IcyTea Freezer"] = { file = "Icytea_skin_2.png", category = "uncommon" },
	["Foam Freezer"] = { file = "FoamFreezer.png", category = "exclusive" },
	["Cryptid Freezer"] = { file = "CFreezer.png", category = "exclusive" },
	["Frost Legion Freezer"] = { file = "FrostLegionFreezerIconIG.png", category = "rare" },
	["Vendor Freezer"] = { file = "VendorFreezerIconIG.png", category = "uncommon" },
	["Polar Bear Freezer"] = { file = "PolarBearFreezerIconIG.png", category = "uncommon" },
	["Bunny Freezer"] = { file = "BunnyFreezer0.png", category = "uncommon" },

	-- assassin skins --
	["Actor Freezer"] = { file = "ActorAssassinIconIG.png", category = "common" },
	["Saber Tooth Tiger Freezer"] = { file = "SaberToothTigerAssassinIconIG.png", category = "uncommon" },
	["SciBunny Assassin"] = { file = "SciBunnyAssassinIconIG.png", category = "rare" },

	-- militant skins --
	["Ace Pilot Militant"] = { file = "ESAcePilotMilitantIcon.png", category = "rare" },
	["Pumpkin Militant"] = { file = "ESPumpkinMilitantIcon.png", category = "exclusive" },
	["Hazmat Militant"] = { file = "NewHazmatMilitantIcon.png", category = "common" },
	["Ghost Militant"] = { file = "GMilitantIcon.png", category = "exclusive" },
	["Chocolatier Militant"] = { file = "ESChocolatierMilitantIcon.png", category = "uncommon" },
	["Ducky Militant"] = { file = "DuckyMilitantIcon.png", category = "uncommon" },
	["Beach Militant"] = { file = "BeachMilitantIcon.png", category = "exclusive" },
	["John Militant"] = { file = "JohnMilitantIcon.png", category = "exclusive" },
	["Lumberjack Militant"] = { file = "LumberjackMilitantIcon.png", category = "uncommon" },
	["Davinchi Militant"] = { file = "Davinchimilitant.png", category = "exclusive" },
	["Fallen Militant"] = { file = "FallenMilitantIconIG.png", category = "rare" },
	["Star Spartan Militant"] = { file = "StarSpartanMilitantIcon.png", category = "rare" },
	["Wasteland Militant"] = { file = "WastelandMilitantIconIG.png", category = "rare" },
	["Easter Militant"] = { file = "EasterMilitantIcon.png", category = "rare" },
	["Acheron Militant"] = { file = "AcheronMilitantIcon.png", category = "uncommon" },
	["Undead Militant"] = { file = "UndeadMilitantIconIG.png", category = "uncommon" },

	-- hunter skins --
	["Halloween Hunter"] = { file = "DHHalloweenHunterIcon.png", category = "exclusive" },
	["Blue Hunter"] = { file = "TowerBlueHunter.png", category = "common" },
	["Vampire Slayer Hunter"] = { file = "TowerVampireSlayerHunter.png", category = "exclusive" },
	["Ducky Hunter"] = { file = "DuckyHunterIconn.png", category = "common" },
	["Pirate Hunter"] = { file = "PirateHunterIcon.png", category = "uncommon" },

	-- pyromancer skins --
	["Hazmat Pyromancer"] = { file = "DHHazmatPyroIcon.png", category = "common" },
	["Scarecrow Pyromancer"] = { file = "DHScarecrowPyroIcon.png", category = "exclusive" },
	["Acidic Pyromancer"] = { file = "DHAcidicPyroIcon.png", category = "uncommon" },
	["Blue Pyromancer"] = { file = "DHBluePyroIcon.png", category = "common" },
	["Valentines Pyromancer"] = { file = "DHValentinesPyroIcon.png", category = "exclusive" },
	["Bunny Pyromancer"] = { file = "DHBunnyPyroIcon.png", category = "exclusive" },
	["Ghost Pyromancer"] = { file = "DHGhostPyroIcon.png", category = "exclusive" },
	["Frost Pyromancer"] = { file = "DHFrostPyroIcon.png", category = "exclusive" },
	["Barbecue Pyromancer"] = { file = "BarbecuePyroIcon.png", category = "exclusive" },
	["Mage Pyromancer"] = { file = "MagePyroIcon.png", category = "legendary" },
	["Vigilante Pyromancer"] = { file = "VigilantePyromancerIcon.png", category = "uncommon" },
	["Dwarf Pyromancer"] = { file = "DwarfPyromancer.png", category = "exclusive" },
	["Plushie Pyromancer"] = { file = "PlushiePyromancerIconIG.png", category = "exclusive" },
	["Pool Party Pyromancer"] = { file = "PoolPartyPyromancerIconIG.png", category = "rare" },
	["Hallow Punk Pyromancer"] = { file = "HallowPunkPyromancerIconIG.png", category = "rare" },
	["Fire Breather Pyromancer"] = { file = "FireBreatherPyromancerIconIG.png", category = "rare" },
	["Reindeer Pyromancer"] = { file = "ReindeerPyromancerIconIG.png", category = "rare" },

	-- ace pilot skins --
	["Green Ace Pilot"] = { file = "GreenAcePilotIconIGJ24.png", category = "common" },
	["Red Ace Pilot"] = { file = "RedAcePilotIconIGJ24.png", category = "common" },
	["Yellow Ace Pilot"] = { file = "YellowAcePilotIconIGJ24.png", category = "common" },
	["Aerial Ace Ace Pilot"] = { file = "AerialAceAcePilotIconIGJ24.png", category = "common" },
	["Purple Ace Pilot"] = { file = "PurpleAcePilotIconIGJ24.png", category = "common" },
	["Navy Ace Pilot"] = { file = "BlueAcePilotIconIGJ24.png", category = "rare" },
	["Pumpkin Ace Pilot"] = { file = "PumpkinAcePilotIconIGJ24.png", category = "exclusive" },
	["Easter Ace Pilot"] = { file = "EasterAcePilotIconIG.png", category = "legendary" },
	["Toy Plane Ace Pilot"] = { file = "ToyPlaneAcePilotIconIG.png", category = "rare" },

	-- medic skins --
	["Witch Medic"] = { file = "WitchMedicIconAug25.png", category = "exclusive" },
	["Cyber Medic"] = { file = "CyberMedicIconAug25.png", category = "rare" },
	["Valentine Medic"] = { file = "ValentinesMedicIconAug25.png", category = "exclusive" },
	["Bunny Medic"] = { file = "BunnyMedicIconAug25.png", category = "exclusive" },
	["Stranded Medic"] = { file = "StrandedMedicIconAug25.png", category = "uncommon" },
	["Masquerade Medic"] = { file = "MasqueradeMedicIconAug25.png", category = "exclusive" },
	["Fallen Medic"] = { file = "FallenMedicIconAug25.png", category = "rare" },
	["Mermaid Medic"] = { file = "MermaidMedicIconAug25.png", category = "legendary" },
	["Plague Medic"] = { file = "AFPlagueMedicIcon.png", category = "uncommon" },
	["Bartender Medic"] = { file = "AFBartenderMedicIcon.png", category = "common" },
	["Toy Ballerina Medic"] = { file = "AFToyBallerinaMedicIcon.png", category = "rare" },
	["Second Chance Medic"] = { file = "AFSecondChanceMedicIcon.png", category = "legendary" },
	["Shamrock Medic"] = { file = "AFShamrockMedicIcon.png", category = "uncommon" },

	-- farm skins --
	["Arcade Farm"] = { file = "ArcadeFarmIcon.png", category = "rare" },
	["Xmas Farm"] = { file = "XmasFarmIcon.png", category = "exclusive" },
	["Tycoon Farm"] = { file = "TycoonFarmIcon.png", category = "rare" },
	["Graveyard Farm"] = { file = "GraveyardFarmIcon.png", category = "exclusive" },
	["Present Farm"] = { file = "PresentFarm.png", category = "exclusive" },
	["Ducky Farm"] = { file = "DuckyFarm0.png", category = "legendary" },
	["Crypto Farm"] = { file = "CryptoFarmIcon.png", category = "legendary" },
	["Pirate Farm"] = { file = "PirateFarmIcon.png", category = "legendary" },
	["Wasteland Farm"] = { file = "WastelandFarmIconIG.png", category = "rare" },
	["Booth Farm"] = { file = "BoothFarmIconIG.png", category = "exclusive" },
	["Cozy Camp Farm"] = { file = "CozyCampFarmIconIG.png", category = "uncommon" },
	["Vendor Farm"] = { file = "LemonadeStandFarmIconIG.png", category = "rare" },
	["PNG Farm"] = { file = "PNGFarmIconIG.png", category = "uncommon" },
	["Discovered Farm"] = { file = "DiscoverFarmIconIG.png", category = "uncommon" },
	["Crab Farm"] = { file = "CrabFarmIconIG.png", category = "rare" },
	["Null Soul Farm"] = { file = "NullSoulFarmIconIG.png", category = "rare" },
	["Cinema Farm"] = { file = "CinemaFarmIconIG.png", category = "rare" },
	["Pot Of Gold Farm"] = { file = "PotOfGoldFarmIconIG.png", category = "common" },
	["Bunny Farm"] = { file = "BunnyFarmIconIG.png", category = "uncommon" },

	-- electroshocker skins --
	["Valentines Electroshocker"] = { file = "ValentinesElectroshockerIcon2.png", category = "exclusive" },
	["Bunny Electroshocker"] = { file = "BunnyElectroshockerIcon2.png", category = "exclusive" },
	["Hazmat Electroshocker"] = { file = "HazmatElectroshockerIcon2.png", category = "common" },
	["Ghost Electroshocker"] = { file = "GhostElectroshockerIcon2.png", category = "exclusive" },
	["Ducky Electroshocker"] = { file = "DuckyElectroshockerIcon.png", category = "rare" },
	["Vigilante Electroshocker"] = { file = "VigilanteElectroshockerIcon.png", category = "uncommon" },
	["Frankenstein Electroshocker"] = { file = "FrankensteinElectroshocker.png", category = "exclusive" },
	["TeeVee Electroshocker"] = { file = "TeeVeeElectroshockerIcon.png", category = "legendary" },
	["Classic Electroshocker"] = { file = "ClassicElectroIcon.png", category = "rare" },
	["Dark Frost Electroshocker"] = { file = "DarkFrostElectroshockerIconIG.png", category = "rare" },
	["Korblox Electroshocker"] = { file = "KorbloxElectroshockerIconIG.png", category = "exclusive" },
	["Jellyfish Electroshocker"] = { file = "JellyfishElectroshockerIconIG.png", category = "legendary" },
	["Banned Electroshocker"] = { file = "BannedElectroshockerIconIG.png", category = "exclusive" },
	["Lovestriker Electroshocker"] = { file = "LovestrikerElectroshockerIconIG.png", category = "uncommon" },
	["Easter Electroshocker"] = { file = "EasterElectroshockerIconIG.png", category = "rare" },

	-- rocketeer skins --
	["Dark Matter Rocketeer"] = { file = "DarkmatterRocketeerIcon2025.png", category = "rare" },
	["Pumpkin Rocketeer"] = { file = "PumpkinRocketeerIconIGJan25.png", category = "exclusive" },
	["Bosanka Rocketeer"] = { file = "BosankaRockteerIcon2025.png", category = "common" },
	["Steampunk Rocketeer"] = { file = "SteampunkRocketeerIcon2025.png", category = "uncommon" },
	["Xmas Rocketeer"] = { file = "XmasRocketeerIconIGJan25.png", category = "exclusive" },
	["Toy Rocketeer"] = { file = "ToyRocketeerIcon2025.png", category = "common" },
	["Lunar Rocketeer"] = { file = "LunarRocketeerIcon.png", category = "rare" },
	["Fortress Rocketeer"] = { file = "FortressRocketeerIconIG.png", category = "rare" },
	["Lovestriker Rocketeer"] = { file = "LovestrikerRocketeerIconIG.png", category = "legendary" },
	["Duck Rocketeer"] = { file = "DuckyRocketeerIconIG.png", category = "legendary" },
	["Ghost Rocketeer"] = { file = "GhostRocketeerIconIG.png", category = "rare" },
	["Trombone Rocketeer"] = { file = "TromboneRocketeerIconIG.png", category = "uncommon" },
	["Leprechaun Rocketeer"] = { file = "LeprechaunRocketeerIconIG.png", category = "legendary" },

	-- trapper skins --
	["Plushie Trapper"] = { file = "PlushieTrapperIcon.png", category = "exclusive" },
	["Dark Frost Trapper"] = { file = "DarkFrostTrapperIconIG.png", category = "rare" },
	["Mallard Duck Trapper"] = { file = "MallardDuckTrapperIconIG.png", category = "rare" },
	["Hermit Trapper"] = { file = "HermitTrapperIconIG.png", category = "rare" },
	["Banned Trapper"] = { file = "BannedTrapperIconIG.png", category = "exclusive" },
	["Jolly Tree Trapper"] = { file = "JollyTreeTrapperIconIG.png", category = "common" },
	["Holiday Trapper"] = { file = "HolidayTrapperIconIG.png", category = "uncommon" },
	["Chocolatier Trapper"] = { file = "ChocolatierTrapperIconIG.png", category = "common" },

	-- military base skins --
	["Classic Military Base"] = { file = "ClassicMilitaryBaseIconM29.png", category = "rare" },
	["Wasteland Military Base"] = { file = "WastelandMilitaryBaseIconIG.png", category = "rare" },
	["Cyber Military Base"] = { file = "CyberMilitaryBaseIconIG.png", category = "rare" },
	["Base 1776 Military Base"] = { file = "CyberMilitaryBaseIconIG.png", category = "rare" },

	-- crook boss skins --
	["Demon Crook Boss"] = { file = "DemonCBIconFeb10.png", category = "exclusive" },
	["Checker Crook Boss"] = { file = "NewCheckerCrookBossIcon.png", category = "common" },
	["Xmas Crook Boss"] = { file = "XmasCBIconFeb10.png", category = "exclusive" },
	["Red Crook Boss"] = { file = "NewRedCrookBossIcon.png", category = "common" },
	["Blue Crook Boss"] = { file = "NewBlueCrookBossIcon.png", category = "common" },
	["Soviet Crook Boss"] = { file = "SovietCrookBossM24Icon.png", category = "legendary" },
	["Spooky Crook Boss"] = { file = "SpookyCBIconFeb10.png", category = "exclusive" },
	["Cupid Crook Boss"] = { file = "NewCupidCrookBossIcon.png", category = "legendary" },
	["Holiday Crook Boss"] = { file = "NewHolidayCrookBossIcon.png", category = "exclusive" },
	["Pirate Crook Boss"] = { file = "NewPirateCrookBossIcon.png", category = "rare" },
	["Necromancer Crook Boss"] = { file = "NewNecromancerCrookBoss.png", category = "exclusive" },
	["Corso Crook Boss"] = { file = "Feb25CorsoCrookBossIcon.png", category = "rare" },
	["DRKSHDW Crook Boss"] = { file = "DSCBoss.png", category = "uncommon" },
	["SteamPunk Crook Boss"] = { file = "SteamPunkCrookBoss.png", category = "rare" },
	["Cybernetic Crook Boss"] = { file = "CyberneticCrookBossIcon.png", category = "rare" },
	["Dark Frost Crook Boss"] = { file = "DarkFrostCrookBossIconIG.png", category = "common" },
	["Game Master Crook Boss"] = { file = "GameMasterCrookBossIconIG.png", category = "ultimate" },
	["Alien Focus Crook Boss"] = { file = "AlienFocusCrookBossIconIG.png", category = "rare" },
	["Easter Crook Boss"] = { file = "EasterCrookBossIconIG.png", category = "rare" },
	["Null Crook Boss"] = { file = "NullCrookBossIconIG.png", category = "rare" },
	["Victorian Crook Boss"] = { file = "VictorianCrookBossIconIG.png", category = "rare" },
	["Yourself Crook Boss"] = { file = "YourselfCrookBoss0.png", category = "exclusive" },
	["Rat King Crook Boss"] = { file = "RatKingCrookBossIconIG.png", category = "rare" },
	["Narrator Crook Boss"] = { file = "NarratorCrookBossIconIG.png", category = "ultimate" },

	-- commander skins --
	["Gargoyle Commander"] = { file = "May17GargoyleCommander.png", category = "exclusive" },
	["Red Commander"] = { file = "Newredcommander.png", category = "common" },
	["Green Commander"] = { file = "Newgreencommander.png", category = "common" },
	["Victorian Commander"] = { file = "May17VictorianCommander.png", category = "common" },
	["Galactic Commander"] = { file = "May17GalacticCommander.png", category = "uncommon" },
	["General Commander"] = { file = "May17GeneralCommander.png", category = "common" },
	["Bunny Commander"] = { file = "May17BunnyCommander.png", category = "exclusive" },
	["Spring Time Commander"] = { file = "16MaySpringTimeCommanderIcon.png", category = "exclusive" },
	["Maid Commander"] = { file = "Newmaidcommander.png", category = "legendary" },
	["Neko Commander"] = { file = "Newnekocommander.png", category = "rare" },
	["Ghost Commander"] = { file = "May17GhostCommander.png", category = "exclusive" },
	["Frost Commander"] = { file = "May17FrostCommander.png", category = "exclusive" },
	["Bloxy Commander"] = { file = "BloxyCommanderIcon.png", category = "exclusive" },
	["Eclipse Commander"] = { file = "Eclipsecomm.png", category = "exclusive" },
	["Ducky Commander"] = { file = "Newduckycommander.png", category = "rare" },
	["Plushie Commander"] = { file = "PlCommanderIcon.png", category = "exclusive" },
	["Lifeguard Commander"] = { file = "May17LifeguardCommander.png", category = "exclusive" },
	["Holiday Commander"] = { file = "May17ElfCommander.png", category = "exclusive" },
	["Brisk Commander"] = { file = "Newbriskcommander.png", category = "rare" },
	["Valentines Commander"] = { file = "May17ValentinesCommander.png", category = "rare" },
	["Pirate Commander"] = { file = "PirateCommanderIcon.png", category = "rare" },
	["Umbra Commander"] = { file = "UmbraCommanderIcon.png", category = "exclusive" },
	["Phantom Commander"] = { file = "PhantomCommanderSkin.png", category = "legendary" },
	["Eggrypted Commander"] = { file = "May17EggryptedCommander.png", category = "rare" },
	["Pattern Commander"] = { file = "PatternCommanderIcon.png", category = "uncommon" },
	["Vigilante Commander"] = { file = "VigilanteCommanderIcon.png", category = "rare" },
	["Patriotic Commander"] = { file = "PatriotCommanderIcon2.png", category = "legendary" },
	["Fallen Commander"] = { file = "FallenCommanderIconIG.png", category = "rare" },
	["Wasteland Commander"] = { file = "WastelandCommanderIconIG.png", category = "legendary" },
	["Santa Commander"] = { file = "SantaCommanderIconIG.png", category = "rare" },
	["Aqua Commander"] = { file = "AquaCommanderIconIG.png", category = "legendary" },
	["Werewolf Commander"] = { file = "WerewolfCommanderIconIG.png", category = "rare" },
	["Candy Cane Commander"] = { file = "CandyCaneCommanderIconIG.png", category = "uncommon" },
	["Director Commander"] = { file = "DirectorCommanderIconIG.png", category = "uncommon" },
	["Wonderland Commander"] = { file = "WonderlandCommanderIconIG.png", category = "legendary" },

	-- warden skins --
	["Slaughter Warden"] = { file = "SlaughterWardenIcon.png", category = "exclusive" },
	["Baseball Warden"] = { file = "BaseballWardenIcon.png", category = "rare" },
	["Ducky Warden"] = { file = "DuckyWardenIcon.png", category = "uncommon" },
	["Pirate Warden"] = { file = "PirateWardenIcon.png", category = "rare" },
	["Galactic Warden"] = { file = "GalacticWardenIcon.png", category = "rare" },
	["Masquerade Warden"] = { file = "MasqueradeWarden.png", category = "exclusive" },
	["Isaac Warden"] = { file = "IsaacWardenIcon.png", category = "legendary" },
	["Korblox Warden"] = { file = "KorbloxWardenIcon.png", category = "exclusive" },
	["Fallen Warden"] = { file = "FallenWardenIconIG.png", category = "rare" },
	["Freddy Warden"] = { file = "FreddyWardenIconIG.png", category = "uncommon" },
	["Dark Frost Warden"] = { file = "DarkFrostWardenIconIG.png", category = "uncommon" },
	["Shark Warden"] = { file = "SharkWardenIconIG.png", category = "rare" },
	["Shamrock Warden"] = { file = "ShamrockWardenIconIG.png", category = "uncommon" },
	["Bunny Warden"] = { file = "BunnyWardenIconIG.png", category = "common" },

	-- cowboy skins --
	["Pumpkin Cowboy"] = { file = "WDPumpkinCowboyIcon.png", category = "exclusive" },
	["Redemption Cowboy"] = { file = "WDRedemptionCowboyIcon.png", category = "rare" },
	["Bandit Cowboy"] = { file = "WDBanditCowboyIcon.png", category = "rare" },
	["Kasodus Cowboy"] = { file = "NewKasodusCowboyIcon.png", category = "uncommon" },
	["Valentines Cowboy"] = { file = "WDValentinesCowboyIcon.png", category = "rare" },
	["Cop Cowboy"] = { file = "CopCowboyIcon.png", category = "common" },
	["Noir Cowboy"] = { file = "NoirCowboyIcon.png", category = "uncommon" },
	["Cyberpunk Cowboy"] = { file = "CyberpunkCowboy.png", category = "legendary" },
	["Retired Cowboy"] = { file = "RetiredCowboyIcon.png", category = "legendary" },
	["Badlands Cowboy"] = { file = "BadlandsCowboyIcon.png", category = "exclusive" },
	["Agent Cowboy"] = { file = "AgentCowboyIcon.png", category = "rare" },
	["Holiday Cowboy"] = { file = "HolidayCowboyIcon.png", category = "exclusive" },
	["Ducky Cowboy"] = { file = "DuckyCowboyIcon.png", category = "rare" },
	["Bounty Hunter Cowboy"] = { file = "BountyHunterCowboyIcon.png", category = "legendary" },
	["Masquerade Cowboy"] = { file = "MasqCowboyIcon.png", category = "exclusive" },
	["Fallen Cowboy"] = { file = "FallenCowboyIconIG.png", category = "rare" },
	["Plushie Cowboy"] = { file = "PlushieCowboyIconIG.png", category = "exclusive" },
	["MegaBit Cowboy"] = { file = "MegalodonCowboy.png", category = "rare" },
	["Dark Frost Cowboy"] = { file = "DarkFrostCowboyIconIG.png", category = "rare" },
	["Spring Time Cowboy"] = { file = "SpringTimeCowboyIconIG.png", category = "legendary" },
	["Mecha Bunny Cowboy"] = { file = "MechaBunnyCowboyIconIG.png", category = "exclusive" },
	["Vampire Hunter Cowboy"] = { file = "VampireHunterCowboyIconIG.png", category = "rare" },
	["Shamrock Cowboy"] = { file = "ShamrockCowboyIconIG.png", category = "common" },

	-- dj booth skins --
	["Neon Rave DJ Booth"] = { file = "NeonRaveDJBoothIconAug2024.png", category = "rare" },
	["Neko DJ Booth"] = { file = "NekoDJBoothIconAug2024.png", category = "legendary" },
	["Ghost DJ Booth"] = { file = "GhostDJBoothIconIGAug2024.png", category = "exclusive" },
	["Plushie DJ Booth"] = { file = "PlushieDJ.png", category = "exclusive" },
	["Masquerade DJ Booth"] = { file = "MasqueradeDJBooth.png", category = "exclusive" },
	["Mako DJ Booth"] = { file = "MakoDJBoothIcon.png", category = "ultimate" },
	["Garage Band DJ Booth"] = { file = "GarageBandDJBoothIconIG.png", category = "legendary" },
	["Ducky DJ Booth"] = { file = "DuckyDJIconIG.png", category = "rare" },
	["Seal DJ Booth"] = { file = "SealDJIconIG.png", category = "legendary" },
	["Gingerbread DJ Booth"] = { file = "GingerbreadDJBoothIconIG.png", category = "rare" },

	-- tesla skins --
	["Garden Tesla"] = { file = "GardenTeslaIconIG.png", category = "Legendary" },

	-- minigunner skins --
	["Blue Minigunner"] = { file = "BlueMinigunner.png", category = "common" },
	["Green Minigunner"] = { file = "GreenMinigunner.png", category = "common" },
	["Black Ops Minigunner"] = { file = "BlackOpsMinigunner.png", category = "common" },
	["Pumpkin Minigunner"] = { file = "H23PumpkinMinigunnerIcon.png", category = "exclusive" },
	["Heavy Minigunner"] = { file = "HeavyMinigunner.png", category = "common" },
	["Wraith Minigunner"] = { file = "WraithMinigunner.png", category = "rare" },
	["Xmas Minigunner"] = { file = "Xmasminigunner2019rework.png", category = "exclusive" },
	["Party Minigunner"] = { file = "Partyminigunnerrework.png", category = "exclusive" },
	["Twitter Minigunner"] = { file = "MiniTwitter.png", category = "legendary" },
	["Toy Minigunner"] = { file = "Toyminigunnerrework.png", category = "uncommon" },
	["Bunny Minigunner"] = { file = "Bunnyminigunnernew.png", category = "exclusive" },
	["Hazmat Minigunner"] = { file = "HazmatMinigunner.png", category = "common" },
	["Ghost Minigunner"] = { file = "Ghostminigunnernew.png", category = "exclusive" },
	["Frost Minigunner"] = { file = "Frostminigunnerrework.png", category = "exclusive" },
	["Community Minigunner"] = { file = "Communityminigunnerrework.png", category = "exclusive" },
	["Crusader Minigunner"] = { file = "Crusaderminigunnerrework.png", category = "exclusive" },
	["Ducky Minigunner"] = { file = "Duckyminigunnerrework.png", category = "rare" },
	["Beach Minigunner"] = { file = "Beachminigunnernew.png", category = "exclusive" },
	["Plushie Minigunner"] = { file = "PlushieMinigunnerSkin.png", category = "exclusive" },
	["Holiday Minigunner"] = { file = "HolidayMinigunner.png", category = "exclusive" },
	["Space Elite Minigunner"] = { file = "SpaceEliteMinigunner.png", category = "uncommon" },
	["Phantom Minigunner"] = { file = "PhantomMinigunnerSkin.png", category = "rare" },
	["Warlord Minigunner"] = { file = "WarlordMinigunnerSkin.PNG", category = "exclusive" },
	["Sweaking Minigunner"] = { file = "SweakingMinigunnerIcon.png", category = "rare" },
	["Trucker Minigunner"] = { file = "VroomVroomMinigunner.png", category = "legendary" },
	["Chad Minigunner"] = { file = "ChadMinigunner.png", category = "legendary" },
	["Golden Plushie Minigunner"] = { file = "GoldenPlushieMinigunnerIconIG.png", category = "exclusive" },
	["Fallen Minigunner"] = { file = "FallenMinigunnerIcon.png", category = "rare" },
	["Road Rage Minigunner"] = { file = "RoadRageMinigunnerIconIG.png", category = "rare" },
	["Nutcracker Minigunner"] = { file = "NutcrackerMinigunnerIconIG.png", category = "uncommon" },
	["Gardener Minigunner"] = { file = "GardenerMinigunnerIconIG.png", category = "uncommon" },
	["Cursed Minigunner"] = { file = "CursedMinigunnerIconIG.png", category = "rare" },
	["Chocolatier Minigunner"] = { file = "ChocolatierMinigunnerIconIG.png", category = "uncommon" },
	["Ox Minigunner"] = { file = "OxMinigunnerIconIG.png", category = "uncommon" },
	["Easter Minigunner"] = { file = "EasterMinigunner0.png", category = "common" },

	-- ranger skins --
	["Railgunner Ranger"] = { file = "RailgunnerRangerMissionIcon.png", category = "legendary" },
	["Wraith Ranger"] = { file = "Wraithrangernew.png", category = "rare" },
	["Green Ranger"] = { file = "Greenrangernew.png", category = "common" },
	["Blue Ranger"] = { file = "Newblueranger.png", category = "common" },
	["Black Ops Ranger"] = { file = "Blackopsrangernew.png", category = "common" },
	["Partisan Ranger"] = { file = "Partisanrangernew.png", category = "uncommon" },
	["Valentines Ranger"] = { file = "LOValentinesRanger.png", category = "exclusive" },
	["Bunny Ranger"] = { file = "Bunnyrangernew.png", category = "exclusive" },
	["Gun Gale Ranger"] = { file = "KR_Gun_Gale_Ranger_Icon.png", category = "legendary" },
	["Dark Matter Ranger"] = { file = "Darkmatterrangernew.png", category = "rare" },
	["Frost Ranger"] = { file = "Frostrangernew.png", category = "exclusive" },
	["Eclipse Ranger"] = { file = "Eclipserangernew.png", category = "exclusive" },
	["Classic Ranger"] = { file = "Classicrangernew.png", category = "rare" },
	["Pumpkin Ranger"] = { file = "PumpkinRanger.png", category = "exclusive" },
	["Phantom Ranger"] = { file = "PhantomRangerSkin.png", category = "rare" },
	["Beast Slayer Ranger"] = { file = "BeastSlayerRangerSkin.PNG", category = "exclusive" },
	["Propellars Ranger"] = { file = "PropellarsRangerIcon.png", category = "legendary" },
	["Badlands Ranger"] = { file = "Badlands_Ranger.png", category = "rare" },
	["Steampunk Ranger"] = { file = "SteampunkRangerIcon.png", category = "uncommon" },
	["5ouls Ranger"] = { file = "5oulsRangerIconIG.png", category = "rare" },
	["Frankenstein Ranger"] = { file = "FrankensteinRangerIconIG.png", category = "uncommon" },
	["Mecha Ducky Ranger"] = { file = "MechaDuckyRangerIconIG.png", category = "rare" },
	["Shark Ranger"] = { file = "SharkRangerIconIG.png", category = "rare" },
	["Indigenous Ranger"] = { file = "EskimoRangerIconIG.png", category = "rare" },

	-- pursuit skins --
	["Easter Pursuit"] = { file = "EggyPursuitIconIG.png", category = "uncommon" },
	["Dragon Pursuit"] = { file = "DragonPursuitIconIG.png", category = "legendary" },

	-- gatling gun skins --
	["Easter Gatling Gun"] = { file = "EasterGatlingGunnerIconIG.png", category = "uncommon" },

	-- turret skins --
	["XR500 Turret"] = { file = "XR500TurretIcon.png", category = "legendary" },
	["XR300 Turret"] = { file = "XR300TurretIcon.png", category = "rare" },
	["Crossbow Turret"] = { file = "CrossbowTurret.png", category = "exclusive" },
	["Jetski Turret"] = { file = "JetskiTurretIconIG.png", category = "legendary" },
	["Grinch Turret"] = { file = "GrinchTurretIconIG.png", category = "rare" },
	["Bunny Turret"] = { file = "BunnyTurretIconIG.png", category = "common" },

	-- mortar skins --
	["Bunny Mortar"] = { file = "DHBunnyMortarIcon.png", category = "exclusive" },
	["Eclipse Mortar"] = { file = "EclipseMortar.png", category = "exclusive" },
	["Ducky Mortar"] = { file = "DuckyMortarIcon.png", category = "rare" },
	["Vigilante Mortar"] = { file = "VigilanteMortarIcon.png", category = "rare" },
	["Pirate Mortar"] = { file = "PirateMortarIcon.png", category = "rare" },
	["Defender Mortar"] = { file = "DefenderMortarSkin.png", category = "exclusive" },
	["Baseball Mortar"] = { file = "BaseballMortarIcon.png", category = "rare" },
	["Fallen Mortar"] = { file = "FallenMortarIconIG.png", category = "legendary" },
	["Dark Frost Mortar"] = { file = "DarkFrostMortarIconIG.png", category = "rare" },
	["Frost Mortar"] = { file = "FrostMortarIconIG.png", category = "legendary" },
	["Mecha Ducky Mortar"] = { file = "MechaDuckyMortarIconIG.png", category = "legendary" },
	["Festive Mortar"] = { file = "FestiveMortarIconIG.png", category = "rare" },
	["Krampus Mortar"] = { file = "KrampusMortarIconIG.png", category = "rare" },
	["Valentines Mortar"] = { file = "ValentinesMortarIconIG.png", category = "rare" },

	-- mercenary base skins --
	["Liberator Mercenary Base"] = { file = "LiberatorMercenaryBase.png", category = "legendary" },
	["Frost Legion Mercenary Base"] = { file = "FrostLegionMercenaryBaseIconIG.png", category = "legendary" },
	["Graveyard Mercenary Base"] = { file = "GraveyardMercenaryBaseIconIG.png", category = "rare" },

	-- brawler skins --
	["Blazing Brawler"] = { file = "BlazingBrawlerIcon.png", category = "legendary" },
	["Fallen Brawler"] = { file = "FallenBrawlerIconIG.png", category = "legendary" },
	["Loader Brawler"] = { file = "LoaderBrawlerIconIG.png", category = "legendary" },
	["Rudolph Brawler"] = { file = "RudolphBrawlerIconIG.png", category = "legendary" },
	["Jordan Brawler"] = { file = "JordanBrawlerIconIG.png", category = "rare" },
	["Lovestriker Brawler"] = { file = "LovestrikerBrawlerIconIG.png", category = "legendary" },
	["Lobster Brawler"] = { file = "LobsterBrawlerIcon.png", category = "rare" },
	["Banned Brawler"] = { file = "BannedBrawlerIconIG.png", category = "exclusive" },
	["Werewolf Brawler"] = { file = "WerewolfBrawlerIconIG.png", category = "legendary" },
	["Horse Brawler"] = { file = "HorseBrawlerIconIG.png", category = "legendary" },
	["Bunny Brawler"] = { file = "BunnyBrawlerIconIG.png", category = "uncommon" },

	-- necromancer skins --
	["Mage Necromancer"] = { file = "Magenecromancer.png", category = "legendary" },
	["Fallen Necromancer"] = { file = "FallenNecromancerIconIG.png", category = "legendary" },
	["Duck Necromancer"] = { file = "DuckNecromancerIconIG.png", category = "legendary" },
	["Creepy Santa Necromancer"] = { file = "CreepySantaNecromancerIconIG.png", category = "rare" },

	-- accelerator skins --
	["Mage Accelerator"] = { file = "MageAcceleratorIcon2.png", category = "rare" },
	["Eclipse Accelerator"] = { file = "EclipseAcceleratorIcon.png", category = "exclusive" },
	["Cupid Accelerator"] = { file = "CupidAcceleratorIcon.png", category = "legendary" },
	["Ice Witch Accelerator"] = { file = "IceWitchAcceleratorIcon2.png", category = "legendary" },
	["Navy Accelerator"] = { file = "NavyAcceleratorIcon.png", category = "rare" },
	["Red Accelerator"] = { file = "RedAcceleratorIcon.png", category = "rare" },
	["Ducky Accelerator"] = { file = "DuckyAcceleratorIcon.png", category = "legendary" },
	["Vigilante Accelerator"] = { file = "VigilanteAcceleratorIcon.png", category = "legendary" },
	["Plushie Accelerator"] = { file = "PlushieAccelIcon.png", category = "exclusive" },
	["Ghost Buster Accelerator"] = { file = "GhostBusterAcceleratorIcon.png", category = "exclusive" },
	["Legend Accelerator"] = { file = "LegendAcceleratorSkin.png", category = "exclusive" },
	["Elite Accelerator"] = { file = "YTAccelIcon.png", category = "legendary" },
	["Speaker Titan Accelerator"] = { file = "Speakeraccel.png", category = "legendary" },
	["Nuclear Accelerator"] = { file = "NuclearAccelIcon.png", category = "rare" },
	["Senator Accelerator"] = { file = "SenatorAccelIcon.png", category = "legendary" },
	["Dank Accelerator"] = { file = "DanksAcceleratorIconIG.png", category = "legendary" },
	["Fallen Accelerator"] = { file = "FallenAcceleratorIconIG.png", category = "legendary" },
	["Patient Zero Accelerator"] = { file = "PatientZeroAcceleratorIcon.png", category = "exclusive" },
	["Disco Accelerator"] = { file = "DiscoAcceleratorIconIG.png", category = "legendary" },
	["Octopus Accelerator"] = { file = "OctopusAcceleratorIconIG.png", category = "legendary" },
	["Champion Accelerator"] = { file = "ChampionAcceleratorIconIG.png", category = "ultimate" },
	["Magician Accelerator"] = { file = "MagicianAcceleratorIconIG.png", category = "rare" },
	["Bunny Accelerator"] = { file = "BunnyAcceleratorIconIG.png", category = "common" },

	-- engineer skins --
	["Ducky Engineer"] = { file = "DuckyEngineerIcon.png", category = "legendary" },
	["Mechanic Engineer"] = { file = "MechanicEngineerIcon.png", category = "legendary" },
	["Holiday Engineer"] = { file = "HolidayEngineerIcon.png", category = "exclusive" },
	["Heartbreak Engineer"] = { file = "HeartbreakEngineerIcon.png", category = "legendary" },
	["Grave Digger Engineer"] = { file = "GravediggerEngineer.png", category = "exclusive" },
	["Plushie Engineer"] = { file = "Plushie_Engineer_Icon.png", category = "exclusive" },
	["Phantom Engineer"] = { file = "PhantomEngineerSkin.png", category = "legendary" },
	["Wikia Engineer"] = { file = "YTEngiIcon.png", category = "rare" },
	["CrazRex Engineer"] = { file = "CrazRexEngineerIcon.png", category = "rare" },
	["Fallen Engineer"] = { file = "FallenEngineerIcon.png", category = "legendary" },
	["Dark Frost Engineer"] = { file = "DarkFrostEngineerIconIG.png", category = "legendary" },
	["Beach Engineer"] = { file = "BeachEngineerIcon.png", category = "rare" },
	["Ghost Engineer"] = { file = "GhostEngineerIconIG.png", category = "legendary" },
	["Springtime Engineer"] = { file = "SpringtimeEngineerIconIG.png", category = "rare" },
	["Bunny Engineer"] = { file = "BunnyEngineerIconIG.png", category = "legendary" },

	-- hacker skins --
	["Fallen Hacker"] = { file = "FallenHackerIcon.png", category = "rare" },
	["Triumphant Hacker"] = { file = "TriumphantHackerIconIG.png", category = "exclusive" },
	["Camera Operator Hacker"] = { file = "CameraOperatorHackerIconIG.png", category = "legendary" },
	["Reindeer Mech Hacker"] = { file = "ReindeerMechHackerIconIG.png", category = "legendary" },

	-- gladiator skins --
	["Slugger Gladiator"] = { file = "DHSluggerGladiatorIcon.png", category = "legendary" },
	["Pumpkin Gladiator"] = { file = "PumpkinGladiatorIcon.png", category = "exclusive" },
	["Demon Gladiator"] = { file = "DHDemonGladiatorIcon.png", category = "exclusive" },
	["Beach Gladiator"] = { file = "BeachGladiatorIcon.png", category = "exclusive" },
	["Vigilante Gladiator"] = { file = "VigilanteGladiatorIcon.png", category = "legendary" },
	["Pirate Gladiator"] = { file = "PirateGladiatorIcon.png", category = "legendary" },
	["Galactic Gladiator"] = { file = "GalacticGladiatorIcon.png", category = "rare" },
	["Phantom Gladiator"] = { file = "PhantomGladiatorSkin.png", category = "legendary" },
	["Cameraman Gladiator"] = { file = "CameramanGladiatorIcon.png", category = "legendary" },

	-- commando skins --
	["Pirate Commando"] = { file = "PirateCommandoIconIGNov24.png", category = "rare" },
	["Trooper Commando"] = { file = "TrooperCommandoIconIG.png", category = "rare" },

	-- slasher skins --
	["Spring Time Slasher"] = { file = "HW24SpringTimeSlasherIconIG.png", category = "exclusive" },
	["Spooky Slasher"] = { file = "HW24SpookySlasherIconIG.png", category = "exclusive" },
	["Jason Slasher"] = { file = "JasonSlasherIconIG.png", category = "exclusive" },

	-- archer skins --
	["Huntsman Archer"] = { file = "HuntsmanArcherIcon2025.png", category = "common" },
	["Valentines Archer"] = { file = "ValArcherIcon2025.png", category = "exclusive" },
	["Spooky Archer"] = { file = "SpookyArcherReworkIcon.png", category = "exclusive" },
	["Elf Archer"] = { file = "ElfArcherIconIG.png", category = "common" },
	["Ice Soul Archer"] = { file = "IceSoulArcherIconIG.png", category = "common" },

	-- toxic gunner skins --
	["Phantom Toxic Gunner"] = { file = "PhantomToxicGunnerSkin.PNG", category = "legendary" },

	-- sledger skins --
	["Brave Soul Sledger"] = { file = "OICEBraveSoulSledgerIcon.png", category = "legendary" },
	["Phantom Sledger"] = { file = "PhantomSledgIcon.png", category = "legendary" },
	["Fallen Sledger"] = { file = "OICEFallenSledgerIcon.png", category = "legendary" },
	["Chocalatier Sledger"] = { file = "ChocolatierSledgerIcon.png", category = "rare" },

	-- executioner skins --
	["Eclipse Executioner"] = { file = "EclipseExecutioner.png", category = "exclusive" },
	["Vanquisher Executioner"] = { file = "VanquisherExecutionerIcon.png", category = "rare" },
	["Heartbreak Executioner"] = { file = "HeartbreakExecutionerIconIG.png", category = "rare" },

	-- executioner skins --
	["Classic Executioner"] = { file = "ClassicElfCampIconIG.png", category = "exclusive" },
	["Chocolatier Executioner"] = { file = "ChocolatierElfCampIconIG.png", category = "uncommon" },

	-- jester skins --
	["Clown Jester"] = { file = "ClownJesterIcon.png", category = "legendary" },
	["Heartbreak Jester"] = { file = "HeartbreakJesterIconIG.png", category = "rare" },
	["The Beast Jester"] = { file = "TheBeastJesterIconIG.png", category = "legendary" },
	["The Flea Jester"] = { file = "TheFleaJesterIconIG.png", category = "legendary" },

	-- cryomancer skins --
	["Krampus Slayer Cryomancer"] = { file = "Krampus_Slayer_Cryomancer_Icon.png", category = "exclusive" },

	-- hallow punk skins --
	["Lunar Hallow Punk"] = { file = "LunarHallowPunkIconIG.png", category = "rare" },

	-- harvester skins --
	["Wasteland Harvester"] = { file = "WastelandHarvesterIconIG.png", category = "exclusive" },
	["Lunar Harvester"] = { file = "LunarHarvesterIconIG.png", category = "legendary" },

	-- firework technician skins --
	["Inventor"] = { file = "InventorFireworkTechnicianIconIG.png", category = "rare" },
	["2026"] = { file = "2026FireworkTechnicianIconIG.png", category = "rare" },

	-- biologist skins --
	["Grim Biologist"] = { file = "GrimmBiologist.png", category = "rare" },

	-- warlock skins --
	["Rockstar"] = { file = "RockstarWarlockIconIG.png", category = "legendary" },
	["Tiger"] = { file = "TigerWarlockIconIG.png", category = "uncommon" },
}

local keywordAlias = {
	-- abbreviated names (for ppl who r lazy)
	["Demo"] = "Demoman",
	["Sol"] = "Soldier",
	["Mil"] = "Militant",
	["Med"] = "Medic",
	["Shotty"] = "Shotgunner",
	["Rocket"] = "Rocketeer",
	["Trap"] = "Trapper",
	["Ace"] = "Ace Pilot",
	["Pyro"] = "Pyromancer",
	["Mili Base"] = "Military Base",
	["Mil Base"] = "Military Base",
	["Crook"] = "Crook Boss",
	["Electro"] = "Electroshocker",
	["Comm"] = "Commander",
	["Cow"] = "Cowboy",
	["DJ"] = "DJ Booth",
	["Mini"] = "Minigunner",
	["Gatling"] = "Gatling Gun",
	["Merc Base"] = "Mercenary Base",
	["Necro"] = "Necromancer",
	["Accel"] = "Accelerator",
	["Engi"] = "Engineer",
	["Jugg"] = "Juggernaut",
	["Gmini"] = "Golden Minigunner",
	["Gpyro"] = "Golden Pyromancer",
	["Gcb"] = "Golden Crook Boss",
	["Gs"] = "Golden Scout",
	["Gcow"] = "Golden Cowboy",
	["Gsol"] = "Golden Soldier",
	["Glad"] = "Gladiator",
	["Fb"] = "Frost Blaster",
	["Swarm"] = "Swarmer",
	["Tg"] = "Toxic Gunner",
	["Sled"] = "Sledger",
	["Exec"] = "Executioner",
	["Elf"] = "Elf Camp",
	["Cryo"] = "Cryomancer",
	["Hallow"] = "Hallow Punk",
	["Snow"] = "Snowballer",
	["Elem"] = "Elementalist",
	["Bio"] = "Biologist",
	["Ft"] = "Firework Technician",
	["Firework Tech"] = "Firework Technician",
	["Wm"] = "War Machine",
	["Mecha"] = "Mecha Base",
	["Spotlight"] = "Spotlight Tech",

	["Pl"] = "Place",
	["Plc"] = "PlaceC",

	-- renamed/internal name towers --
	["EvolvedJuggernaut"] = "Juggernaut",

	-- renamed skins --
	["Megalodon Cowboy"] = "MegaBit Cowboy",
	["Eskimo Ranger"] = "Indigenous Ranger",
	["Eggy Pursuit"] = "Easter Pursuit",
	["DraxRex Engineer"] = "CrazRex Engineer"
}

function p.generate(frame)
	local args = frame:getParent().args
	local tiers = { "S", "A", "B", "C", "D", "E", "F" }
	local html = mw.html.create("div"):addClass("tier-list")

	for _, tier in ipairs(tiers) do
		local images = args[tier] or ""
		local imageList = mw.text.split(images, ",")

		local row = mw.html.create("div")
			:addClass("tier-row " .. tier:lower() .. "-tier")

		row:tag("div")
			:addClass("tier-label")
			:wikitext(tier)

		local content = row:tag("div")
			:addClass("tier-content")

		for _, img in ipairs(imageList) do
			img = mw.text.trim(img)

			if img ~= "" then
				local mainKey = keywordAlias[img] or img
				local data = keywordMap[mainKey]
				local imageName = data and data.file or img
				local categoryClass = data and data.category or ""
				local tooltipName = mainKey ~= "" and mainKey or "Placement"
				local span = content:tag("span")
					:addClass("tier-item" .. (categoryClass ~= "" and (" category-" .. categoryClass) or ""))
					:attr("data-tooltip", tooltipName .. " - " .. tier .. " tier")
					:wikitext("[[File:" .. imageName .. "|55px]]")
			end
		end

		html:node(row)
	end

	return tostring(html)
end

return p
