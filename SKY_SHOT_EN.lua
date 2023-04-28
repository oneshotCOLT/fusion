gg.alert("Welcome to skyshot!!")
		 
scriptv = {process ='com.tgc.sky.android', version = 217644}
gameinfo = gg.getTargetInfo()

function vcheck()
	if gameinfo.packageName ~= scriptv.process then
		gg.alert('[Error]You have selected an incorrect process!\ngame : ' .. gameinfo.packageName)
		os.exit()
	end
	
	if tonumber(gameinfo.versionCode) < scriptv.version then
		gg.alert('[Error] Unsupported game version! \ngame : ' .. tonumber(gameinfo.versionCode) .. '\nscript : ' .. scriptv.version)
	end

	if tonumber(gameinfo.versionCode) > scriptv.version then
		gg.alert('[Error] The script needs updating! \ngame : ' .. tonumber(gameinfo.versionCode) .. '\nscript : ' .. scriptv.version)
	end
end

vcheck()

if gg.isVisible(true) then
	gg.setVisible(false)
end

offsets = {
	ptoplayer = 0x172F518,
	pos_off = 0x4773B0, --pos_x
	ptoentity = 0x17157E0,
	ptonentity = 0x57CFEC,
	curmap_off = -0x172542C,
	plants = 0xD4AFF8,
	gamespeed_off = -0x1650CF4,
	ssdz = 0x22E9DB0,
	chat = 0x5BC25C,
	magic = 0xffffffffed411384 ,
	ptoemotes = 0xA42AF4,
	ptocloset = 0x41EDA0,
	ptofnodes = 0x821844,
	ptopbase = 0x4348E8,
	gesture = 0x468F34,
	camera = -0xE42BB4,
	cam_dist = -0xC,
	cam_fov = -0x3C,
	cam_pos = -0x70,
	plbright = 0x45C2D4,
	hcandle = 0x57A410,
	wing_charge = 0x45C22C,
	sleeping = 0x460890,
	pose = 0x45A428,
	closet_menu = 0x41EDA0,
	constel_menu = 0x15B4A88,
	ptofastitem = -0x10FA8,
	fastitem = 0x26C,
	--vwing = 0x470D9C,
	damage = 0x45C22C + 0xBC,
	wl_pos = 0x4B4F34,
	statue_pos = -0x83053C,
	magic = 0x4681B0,
	props_off = 0x45E104,
	famount_off = 0x45E104 + 0x15D0,
	portal_off = 0x40EB08,
	portal2_off = -0x46D50,
	vcandles = 0x4E62B4,
	vcandles_dist = 0x70,
	pchat = 0xB6B3725,
	fastflap = 0x934E74,
	wind_off = -0x87A6CC
}

maps = {
	{"Home", "CandleSpace"},
	{"Isle", "Dawn"},
	{"Trials Cave", "DawnCave"},
	{"Water Trial", "Dawn_TrialsWater"},
	{"Earth Trial", "Dawn_TrialsEarth"},
	{"Air Trial", "Dawn_TrialsAir"},
	{"Fire Trial", "Dawn_TrialsFire"},
	{"Prairie Butterfly Field", "Prairie_ButterflyFields"},
	{"Bird Nest", "Prairie_NestAndKeeper"},
	{"Sancuary Islands", "Prairie_Island"},
	{"Prairie Cave", "Prairie_Cave"},
	{"Prairie Village", "Prairie_Village"},
	{"8 player puzzle", "DayHubCave"},
	{"Prairie Temple", "DayEnd"},
	{"Forest", "Rain"},
	{"Forest Clearing", "RainForest"},
	{"Forest Elevated Clearing", "RainShelter"},
	{"Forest Caves", "Rain_Cave"},
	{"Forest Boneyard", "RainMid"},
	{"Forest Temple", "RainEnd"},
	{"Treehouse", "Rain_BaseCamp"},
	{"Wind Paths", "Skyway"},
	{"Valley", "Sunset"},
	{"Valley Citadel", "Sunset_Citadel"},
	{"Valley Fly Race", "Sunset_FlyRace"},
	{"Valley Race", "SunsetRace"},
	{"Valley Race End", "SunsetEnd"},
	{"Hermit Valley", "Sunset_YetiPark"},
	{"Dream Village", "SunsetVillage"},
	{"Valley Dream Theater", "Sunset_Theater"},
	{"Valley Music Shop", "SunsetVillage_MusicShop"},
	{"Valley Colosseum", "SunsetColosseum"},
	{"Valley Temple", "SunsetEnd2"},
	{"Wasteland Lobby", "DuskStart"},
	{"Wasteland", "Dusk"},
	{"Abyss Area", "Dusk_Triangle"},
	{"Abyss End", "Dusk_TriangleEnd"},
	{"Wasteland Graveyard", "DuskGraveyard"},
	{"Forgotten Ark", "DuskOasis"},
	{"Crab Fields", "Dusk_CrabField"},
	{"Battlefield", "DuskMid"},
	{"Wasteland Temple", "DuskEnd"},
	{"Vault", "Night"},
	{"Vault 2", "Night2"},
	{"[🆕]Night Shelter", "Night_Shelter"},
	{"Vault End", "NightEnd"},
	{"Vault Archive", "NightArchive"},
	{"Starlight Desert", "NightDesert"},
	{"Starlight Desert Beach", "NightDesert_Beach"},
	{"Jar Cave", "Night_JarCave"},
	{"Infinite Desert", "Night_InfiniteDesert"},
	{"Planets", "NightDesert_Planets"},
	{"Office", "TGCOffice"},
	{"Void of Shattering", "StormEvent_VoidSpace"},
	{"Days of Mischief", "Event_DaysOfMischief"},
	{"Nintendo area", "Nintendo_CandleSpace"},
	{"Eden", "StormStart"},
	{"Eden mid", "Storm"},
	{"Eden end", "StormEnd"},
	{"!!! Orbit !!!", "OrbitMid"},
	{"!!! Orbit 2 !!!", "OrbitEnd"},
	{"!!! Heaven !!!", "CandleSpaceEnd"},
	{"Credits map", "Credits"}
}

-- AUTO CANDLE RUN POINTS --
crwings = {
    {map='Dawn',x=52.0,y=35.0,z=371.0}, 
    {map='Dawn',x=118.0,y=3.0,z=311.0}, 
    {map='Dawn',x=282.0,y=3.0,z=189.0}, 
    {map='Dawn',x=107.0,y=25.0,z=49.0}, 
    {map='Dawn',x=415.0,y=96.0,z=-7.0},
    {map='Dawn_TrialsFire',x=-11.0,y=50.0,z=-308.0},
    {map='Dawn_TrialsAir',x=-12.0,y=106.0,z=-130.0},
    {map='Dawn_TrialsEarth',x=-14.0,y=134.0,z=3.0},
    {map='Dawn_TrialsWater',x=0.0,y=79.0,z=-412.0},
    {map='Prairie_ButterflyFields',x=126.0,y=149.0,z=-28.0},
    {map='Prairie_ButterflyFields',x=105.0,y=175.0,z=27.0},
    {map='Prairie_ButterflyFields',x=81.0,y=161.0,z=63.0},
    {map='Prairie_NestAndKeeper',x=-138.0,y=160.0,z=144.0},
    {map='Prairie_NestAndKeeper',x=-214.0,y=182.0,z=153.0},
    {map='Prairie_Island',x=241.0,y=95.0,z=205.0},
    {map='Prairie_Island',x=64.0,y=95.0,z=308.0},
    {map='Prairie_Island',x=-21.0,y=15.0,z=383.0},
    {map='Prairie_Island',x=78.0,y=2.0,z=324.0},
    {map='Prairie_Island',x=108.0,y=3.0,z=334.0},
    {map='Prairie_Island',x=95.0,y=11.0,z=362.0},
    {map='Prairie_Island',x=62.0,y=19.0,z=273.0},
    {map='Prairie_Island',x=-147.0,y=81.0,z=119.0},
    {map='Prairie_Cave',x=348.0,y=198.0,z=111.0},
    {map='Prairie_Cave',x=290.0,y=200.0,z=178.0},
    {map='Prairie_Village',x=101.0,y=182.0,z=257.0},
    {map='Prairie_Village',x=67.0,y=187.0,z=377.0},
    {map='Prairie_Village',x=28.0,y=185.0,z=279.0},
    {map='Prairie_Village',x=138.0,y=267.0,z=479.0},
    {map='Prairie_Village',x=146.0,y=305.0,z=537.0},
    {map='DayHubCave',x=-19.0,y=60.0,z=28.0},
    {map='RainForest',x=24.0,y=128.0,z=-65.0},
    {map='RainForest',x=79.0,y=130.0,z=-12.0},
    {map='RainForest',x=104.0,y=112.0,z=-111.0},
    {map='RainForest',x=66.0,y=100.0,z=46.0},
    {map='Sunset',x=-151.0,y=264.0,z=-149.0},
    {map='Sunset',x=198.0,y=49.0,z=-517.0},
    {map='Sunset',x=166.0,y=42.0,z=-540.0},
    {map='Sunset_Citadel',x=84.0,y=559.0,z=-55.0},
    {map='Sunset_Citadel',x=115.0,y=503.0,z=-39.0},
    {map='Sunset_FlyRace',x=-396.0,y=1164.0,z=49.0},
    {map='Sunset_FlyRace',x=67.0,y=1057.0,z=-31.0},
    {map='SunsetEnd',x=196.0,y=631.0,z=-421.0},
    {map='Sunset_YetiPark',x=-8.0,y=194.0,z=475.0},
    {map='Sunset_YetiPark',x=-198.0,y=263.0,z=685.0},
    {map='SunsetVillage',x=224.0,y=55.0,z=96.0},
    {map='SunsetVillage',x=99.0,y=77.0,z=146.0},
    {map='SunsetVillage',x=-70.0,y=194.0,z=413.0},
    {map='SunsetColosseum',x=28.0,y=183.0,z=-278.0},
    {map='SunsetEnd2',x=-27.0,y=151.0,z=-164.0},
    {map='Dusk',x=98.0,y=46.0,z=368.0},
    {map='Dusk',x=29.0,y=1.0,z=343.0},
    {map='DuskGraveyard',x=113.0,y=142.0,z=386.0},
    {map='DuskGraveyard',x=305.0,y=122.0,z=560.0},
    {map='DuskOasis',x=84.0,y=93.0,z=186.0},
    {map='DuskOasis',x=67.0,y=100.0,z=121.0},
    {map='DuskOasis',x=92.0,y=79.0,z=-56.0},
    {map='DuskOasis',x=-12.0,y=66.0,z=-91.0},
    {map='DuskOasis',x=15.0,y=85.0,z=-139.0},
    {map='DuskOasis',x=28.0,y=72.0,z=-222.0},
    {map='Dusk_CrabField',x=-22.0,y=33.0,z=528.0},
    {map='Dusk_CrabField',x=-165.0,y=2.0,z=370.0},
    {map='Dusk_CrabField',x=-293.0,y=4.0,z=335.0},
    {map='DuskMid',x=-205.0,y=131.0,z=-160.0},
    {map='DuskMid',x=-238.0,y=87.0,z=-394.0},
    {map='DuskEnd',x=4.0,y=203.0,z=32.0},
    {map='Night',x=20.0,y=47.0,z=-68.0},
    {map='NightArchive',x=56.0,y=541.0,z=-34.0},
    {map='NightArchive',x=79.0,y=555.0,z=-41.0},
    {map='Night',x=34.0,y=161.0,z=-42.0},
    {map='Night2',x=-39.0,y=141.0,z=9.0},
    {map='Night2',x=13.0,y=184.0,z=42.0},
    {map='Night2',x=48.0,y=229.0,z=9.0},
    {map='Night2',x=0.0,y=304.0,z=58.0},
    {map='NightDesert',x=-96.0,y=65.0,z=388.0},
    {map='NightDesert',x=340.0,y=112.0,z=171.0},
    {map='NightDesert',x=401.0,y=76.0,z=776.0},
}

-- AUTO CANDLE RUN POINTS --
crpoints = {
    {family = "Home", name = "Home", map = "CandleSpace", x = -11.474952697753906, y = 1.0653516054153442, z = 21.754070281982422},
    {family = "Home", name = "Home", map = "CandleSpace", x = -17.92003059387207, y = 1.1323552131652832, z = 17.41378402709961},
    {family = "Home", name = "Home", map = "CandleSpace", x = -20.057443618774414, y = 0.9369192719459534, z = 11.609140396118164},
    {family = "Home", name = "Home", map = "CandleSpace", x = -9.972633361816406, y = 0.8219280242919922, z = 11.372694969177246},
    {family = "Home", name = "Home", map = "CandleSpace", x = -0.6386427283287048, y = 1.3603408336639404, z = 0.9419575929641724},

	{family = "Isle", name = "Isle", map = "Dawn", x= 198.28060913085938, y = 1.4136453866958618, z = 55.607765197753906},
	{family = "Isle", name = "Isle", map = "Dawn", x= 188.8730926513672, y = 2.126871109008789, z = 282.0239562988281},
	{family = "Isle", name = "Isle", map = "Dawn", x= -40.466548919677734, y = 4.4114813804626465, z = 214.2626190185547},
	{family = "Isle", name = "Isle", map = "Dawn", x= -41.20948791503906, y = 4.429086685180664, z = 220.53392028808594},
	{family = "Isle", name = "Isle", map = "Dawn", x= -11.36285400390625, y = 52.589656829833984, z = 372.29302978515625},
	{family = "Isle", name = "Isle", map = "Dawn", x= -9.22874927520752, y = 60.232627868652344, z = 410.251220703125},
	{family = "Isle", name = "Isle", map = "Dawn", x= -13.378597259521484, y = 51.707279205322266, z = 374.70001220703125},
	{family = "Isle", name = "Isle", map = "Dawn", x= -6.560460567474365, y = 94.7282485961914, z = 414.4278259277344},
	{family = "Isle", name = "Isle", map = "Dawn", x= -20.66286849975586, y = 116.20912170410156, z = 411.5141906738281},
	{family = "Isle", name = "Isle", map = "Dawn", x= -248.73162841796875, y = 87.2226791381836, z = 142.5924835205078},
	{family = "Isle", name = "Isle", map = "Dawn", x= -237.0540313720703, y = 85.77601623535156, z = 146.8789825439453},
	{family = "Isle", name = "Isle", map = "Dawn", x= -236.03346252441406, y = 86.96887969970703, z = 151.21640014648438},
	{family = "Isle", name = "Isle", map = "Dawn", x= -246.96295166015625, y = 84.93721771240234, z = 157.5946044921875},
	{family = "Isle", name = "Isle", map = "Dawn", x= -253.1098175048828, y = 86.39542388916016, z = 154.90708923339844},
	{family = "Isle", name = "Isle", map = "Dawn", x= -249.111328125, y = 85.5990982055664, z = 152.67315673828125},
	{family = "Isle", name = "Isle", map = "Dawn", x= -1017.4273071289062, y = 208.65391540527344, z = 472.55474853515625},

	{family = "Isle", name = "Trials Cave", map = "DawnCave", x = -300.252471, y = 235.625747, z = -2.923966},
	{family = "Isle", name = "Trials Cave", map = "DawnCave", x = -328.902587, y = 284.778350, z = -12.368432, e = true},

	{family = "Isle", name = "Water Trial", map = "Dawn_TrialsWater", x = -99.710937, y = 65.197624, z = 36.879520},
	{family = "Isle", name = "Water Trial", map = "Dawn_TrialsWater", x = -210.3384552001953, y = 65.64981079101562, z = -107.05089569091797},
	{family = "Isle", name = "Water Trial", map = "Dawn_TrialsWater", x = -429.215423, y = 69.571205, z = -1.099857, e = true},

	{family = "Isle", name = "Earth Trial", map = "Dawn_TrialsEarth", x = 6.291422367095947, y = 124.32449340820312, z = 31.029136657714844},
	{family = "Isle", name = "Earth Trial", map = "Dawn_TrialsEarth", x = -0.2812114357948303, y = 122.03596496582031, z = 18.65877914428711},
	{family = "Isle", name = "Earth Trial", map = "Dawn_TrialsEarth", x = -25.815471649169922, y = 124.36991882324219, z = -30.730470657348633},
	{family = "Isle", name = "Earth Trial", map = "Dawn_TrialsEarth", x = -3.719712495803833, y = 122.5062026977539, z = 6.43914794921875},
	{family = "Isle", name = "Earth Trial", map = "Dawn_TrialsEarth", x = 16.933677673339844, y = 128.23423767089844, z = 0.28745758533477783},
	{family = "Isle", name = "Earth Trial", map = "Dawn_TrialsEarth", x = 0.8367459774017334, y = 133.91415405273438, z = -12.411553382873535},
	{family = "Isle", name = "Earth Trial", map = "Dawn_TrialsEarth", x = 4.763298511505127, y = 133.9190673828125, z = -15.527111053466797},

	{family = "Isle", name = "Air Trial", map = "Dawn_TrialsAir", x = -137.189926, y = 104.670616, z = -8.522333, e = true},

	{family = "Isle", name = "Fire Trial", map = "Dawn_TrialsFire", x = -250.02294921875, y = 50.231990814208984, z = -14.466132164001465, e = true},

	{family = "Prairie", name = "Prairie Butterfly Fields", map = "Prairie_ButterflyFields", x = -434.9216613769531, y = 196.80934143066406, z = 115.62545776367188},
	{family = "Prairie", name = "Prairie Butterfly Fields", map = "Prairie_ButterflyFields", x = -431.51947021484375, y = 196.65725708007812, z = 119.02850341796875},
	{family = "Prairie", name = "Prairie Butterfly Fields", map = "Prairie_ButterflyFields", x = -426.94873046875, y = 196.61680603027344, z = 120.97035217285156},
	{family = "Prairie", name = "Prairie Butterfly Fields", map = "Prairie_ButterflyFields", x = -20.25689697265625, y = 158.474609375, z = 26.712081909179688},
	{family = "Prairie", name = "Prairie Butterfly Fields", map = "Prairie_ButterflyFields", x = 2.556781530380249, y = 150.36204528808594, z = 77.19155883789062},
	{family = "Prairie", name = "Prairie Butterfly Fields", map = "Prairie_ButterflyFields", x = 7.2708048820495605, y = 150.7943115234375, z = 58.697471618652344},
	{family = "Prairie", name = "Prairie Butterfly Fields", map = "Prairie_ButterflyFields", x = 50.220489501953125, y = 157.8102264404297, z = 81.89761352539062},
	{family = "Prairie", name = "Prairie Butterfly Fields", map = "Prairie_ButterflyFields", x = 16.6181697845459, y = 155.23190307617188, z = 103.20137786865234},
	{family = "Prairie", name = "Prairie Butterfly Fields", map = "Prairie_ButterflyFields", x = 6.3694963455200195, y = 161.8115997314453, z = 144.8772735595703},

	{family = "Prairie", name = "Prairie Cave", map = "Prairie_Cave", x = 78.6680908203125, y = 182.95924377441406, z = 259.3968200683594},
	{family = "Prairie", name = "Prairie Cave", map = "Prairie_Cave", x = 82.23560333251953, y = 186.65919494628906, z = 279.21832275390625},
	{family = "Prairie", name = "Prairie Cave", map = "Prairie_Cave", x = 66.05447387695312, y = 188.30642700195312, z = 301.85198974609375},
	{family = "Prairie", name = "Prairie Cave", map = "Prairie_Cave", x = 95.93033599853516, y = 197.22735595703125, z = 282.5020751953125},
	{family = "Prairie", name = "Prairie Cave", map = "Prairie_Cave", x = 149.18038940429688, y = 202.81568908691406, z = 224.9790496826172},
	{family = "Prairie", name = "Prairie Cave", map = "Prairie_Cave", x = 130.27377319335938, y = 202.94117736816406, z = 263.4913635253906},
	{family = "Prairie", name = "Prairie Cave", map = "Prairie_Cave", x = 111.38107299804688, y = 198.30845642089844, z = 347.19403076171875},
	{family = "Prairie", name = "Prairie Cave", map = "Prairie_Cave", x = 133.87875366210938, y = 182.9336395263672, z = 296.8768005371094},
	{family = "Prairie", name = "Prairie Cave", map = "Prairie_Cave", x = 139.72036743164062, y = 181.87342834472656, z = 310.5506286621094},
	{family = "Prairie", name = "Prairie Cave", map = "Prairie_Cave", x = 210.0194549560547, y = 186.0492706298828, z = 410.20947265625},
	{family = "Prairie", name = "Prairie Cave", map = "Prairie_Cave", x = 200.3462371826172, y = 181.6993865966797, z = 398.8465270996094},
	{family = "Prairie", name = "Prairie Cave", map = "Prairie_Cave", x = 225.4527587890625, y = 181.44659423828125, z = 374.6955261230469},
	{family = "Prairie", name = "Prairie Cave", map = "Prairie_Cave", x = 203.18264770507812, y = 188.33262634277344, z = 313.5394592285156},
	{family = "Prairie", name = "Prairie Cave", map = "Prairie_Cave", x = 178.76797485351562, y = 200.3625946044922, z = 289.7171630859375},
	{family = "Prairie", name = "Prairie Cave", map = "Prairie_Cave", x = 213.58380126953125, y = 193.7628631591797, z = 268.40087890625},
	{family = "Prairie", name = "Prairie Cave", map = "Prairie_Cave", x = 223.23121643066406, y = 196.7225799560547, z = 247.05894470214844},

    {family = "Prairie", name = "Prairie Village", map = "Prairie_Village", x = 272.721923828125, y = 183.7411651611328, z = 27.261472702026367},
    {family = "Prairie", name = "Prairie Village", map = "Prairie_Village", x = 232.08749389648438, y = 181.47222900390625, z = 88.8397216796875},
    {family = "Prairie", name = "Prairie Village", map = "Prairie_Village", x = 257.0782470703125, y = 181.6366424560547, z = 101.47383880615234},
    {family = "Prairie", name = "Prairie Village", map = "Prairie_Village", x = 253.4640655517578, y = 195.26266479492188, z = 99.56314086914062},
    {family = "Prairie", name = "Prairie Village", map = "Prairie_Village", x = 271.39959716796875, y = 201.2777557373047, z = 97.57267761230469},
    {family = "Prairie", name = "Prairie Village", map = "Prairie_Village", x = 275.16943359375, y = 201.4562225341797, z = 95.45922088623047},
    {family = "Prairie", name = "Prairie Village", map = "Prairie_Village", x = 271.02178955078125, y = 199.1541290283203, z = 93.59092712402344},
    {family = "Prairie", name = "Prairie Village", map = "Prairie_Village", x = 351.1038513183594, y = 187.82907104492188, z = 90.7116928100586},
    {family = "Prairie", name = "Prairie Village", map = "Prairie_Village", x = 360.84820556640625, y = 194.39024353027344, z = 67.32402801513672},
    {family = "Prairie", name = "Prairie Village", map = "Prairie_Village", x = 363.890380859375, y = 197.07713317871094, z = 64.4627456665039},
    {family = "Prairie", name = "Prairie Village", map = "Prairie_Village", x = 363.99810791015625, y = 198.621337890625, z = 68.09441375732422},
    {family = "Prairie", name = "Prairie Village", map = "Prairie_Village", x = 376.80572509765625, y = 186.4857635498047, z = 67.14299774169922},
    {family = "Prairie", name = "Prairie Village", map = "Prairie_Village", x = 363.4762268066406, y = 187.62985229492188, z = 65.8404769897461},
    {family = "Prairie", name = "Prairie Village", map = "Prairie_Village", x = 368.6451110839844, y = 186.25259399414062, z = 57.410640716552734},
    {family = "Prairie", name = "Prairie Village", map = "Prairie_Village", x = 356.7618408203125, y = 186.24424743652344, z = 48.77674102783203},
    {family = "Prairie", name = "Prairie Village", map = "Prairie_Village", x = 348.49102783203125, y = 184.40699768066406, z = 31.7186336517334},
    {family = "Prairie", name = "Prairie Village", map = "Prairie_Village", x = 325.18853759765625, y = 188.48440551757812, z = -11.628552436828613},
    {family = "Prairie", name = "Prairie Village", map = "Prairie_Village", x = 318.3239440917969, y = 192.7496337890625, z = -14.958328247070312},
    {family = "Prairie", name = "Prairie Village", map = "Prairie_Village", x = 316.6703796386719, y = 194.45909118652344, z = -18.499284744262695},
    {family = "Prairie", name = "Prairie Village", map = "Prairie_Village", x = 320.6529846191406, y = 195.24049377441406, z = -17.022144317626953},
    {family = "Prairie", name = "Prairie Village", map = "Prairie_Village", x = 317.01116943359375, y = 183.81602478027344, z = -41.24715805053711},
    {family = "Prairie", name = "Prairie Village", map = "Prairie_Village", x = 278.2190246582031, y = 185.12066650390625, z = 27.106273651123047},
    {family = "Prairie", name = "Prairie Village", map = "Prairie_Village", x = 456.6010437011719, y = 254.24014282226562, z = 113.01968383789062},
    {family = "Prairie", name = "Prairie Village", map = "Prairie_Village", x = 479.2211608886719, y = 267.06170654296875, z = 138.05459594726562},
    {family = "Prairie", name = "Prairie Village", map = "Prairie_Village", x = 537.0895385742188, y = 304.6280822753906, z = 145.99746704101562},
    {family = "Prairie", name = "Prairie Village", map = "Prairie_Village", x = 455.98944091796875, y = 251.04794311523438, z = 132.96841430664062},
    {family = "Prairie", name = "Prairie Village", map = "Prairie_Village", x = 476.2197265625, y = 254.07073974609375, z = 122.97653198242188},
    {family = "Prairie", name = "Prairie Village", map = "Prairie_Village", x = 466.8929138183594, y = 255.12937927246094, z = 122.27827453613281},
	
	{family = "Prairie", name = "8 player puzzle", map = "DayHubCave", x = -2.825667142868042, y = 39.470245361328125, z = 6.52934455871582},
	{family = "Prairie", name = "8 player puzzle", map = "DayHubCave", x = 2.698847770690918, y = 39.49882888793945, z = 6.942953109741211},
	{family = "Prairie", name = "8 player puzzle", map = "DayHubCave", x = 6.080935478210449, y = 39.227970123291016, z = 2.244690179824829},
	{family = "Prairie", name = "8 player puzzle", map = "DayHubCave", x = 5.837886810302734, y = 39.229705810546875, z = -2.3993277549743652},
	{family = "Prairie", name = "8 player puzzle", map = "DayHubCave", x = 2.594923496246338, y = 39.22773742675781, z = -5.9242987632751465},
	{family = "Prairie", name = "8 player puzzle", map = "DayHubCave", x = -2.3487942218780518, y = 39.22792053222656, z = -6.088262557983398},
	{family = "Prairie", name = "8 player puzzle", map = "DayHubCave", x = -6.0785369873046875, y = 39.227813720703125, z = -2.5309667587280273},
	{family = "Prairie", name = "8 player puzzle", map = "DayHubCave", x = -6.009952068328857, y = 39.227230072021484, z = 2.5176568031311035},
	{family = "Prairie", name = "8 player puzzle", map = "DayHubCave", x = -45.04271697998047, y = 57.995277404785156, z = -26.84793472290039, e = true},

	{family = "Prairie", name = "Prairie Temple", map = "DayEnd", x = 43.756683349609375, y = 83.43392944335938, z = -100.00375366210938},
    {family = "Prairie", name = "Prairie Temple", map = "DayEnd", x = 40.04158020019531, y = 84.47063446044922, z = -106.45093536376953},
    {family = "Prairie", name = "Prairie Temple", map = "DayEnd", x = 45.88062286376953, y = 87.30172729492188, z = -109.91032409667969},
    {family = "Prairie", name = "Prairie Temple", map = "DayEnd", x = 42.534854888916016, y = 75.16962432861328, z = -127.96691131591797},
    {family = "Prairie", name = "Prairie Temple", map = "DayEnd", x = 42.5, y = 85.2, z = -66.1},

    {family = "Prairie", name = "Bird Nest", map = "Prairie_NestAndKeeper", x = 145.1, y = 159.9, z = -139.1},
	{family = "Prairie", name = "Bird Nest", map = "Prairie_NestAndKeeper", x = 120.34546661376953, y = 180.1386260986328, z = -144.81192016601562},
	{family = "Prairie", name = "Bird Nest", map = "Prairie_NestAndKeeper", x = 118.63809204101562, y = 196.70538330078125, z = -157.4332275390625},
	{family = "Prairie", name = "Bird Nest", map = "Prairie_NestAndKeeper", x = 124.73165130615234, y = 189.20907592773438, z = -181.74571228027344},
	{family = "Prairie", name = "Bird Nest", map = "Prairie_NestAndKeeper", x = 86.0428466796875, y = 170.88027954101562, z = -145.3521728515625},
	{family = "Prairie", name = "Bird Nest", map = "Prairie_NestAndKeeper", x = 53.61101531982422, y = 158.05967712402344, z = -104.67848205566406},
	{family = "Prairie", name = "Bird Nest", map = "Prairie_NestAndKeeper", x = 57.971797943115234, y = 171.68272399902344, z = -102.97749328613281},
	{family = "Prairie", name = "Bird Nest", map = "Prairie_NestAndKeeper", x = 116.60604095458984, y = 158.4626007080078, z = -159.919921875},
	{family = "Prairie", name = "Bird Nest", map = "Prairie_NestAndKeeper", x = 83.18549346923828, y = 177.95904541015625, z = -194.9310302734375},
	{family = "Prairie", name = "Bird Nest", map = "Prairie_NestAndKeeper", x = 86.93468475341797, y = 195.34017944335938, z = -192.39390563964844},
	{family = "Prairie", name = "Bird Nest", map = "Prairie_NestAndKeeper", x = 86.43867492675781, y = 206.1831512451172, z = -197.75018310546875},
    {family = "Prairie", name = "Bird Nest", map = "Prairie_NestAndKeeper", x = 152.9, y = 181.5, z = -214.8},

	{family = "Prairie", name = "Sanctuary Islands", map = 'Prairie_Island', x = 221.30966186523438, y = 95.4205093383789,  z = 246.12799072265625},
	{family = "Prairie", name = "Sanctuary Islands", map = 'Prairie_Island', x = 302.3828430175781, y = 102.43594360351562,z = 55.154842376708984},
	{family = "Prairie", name = "Sanctuary Islands", map = 'Prairie_Island', x = 328.4344482421875, y = 55.10648727416992, z = 24.160531997680664},
	{family = "Prairie", name = "Sanctuary Islands", map = 'Prairie_Island', x = 330.4920959472656, y = 0.7480080723762512,z = 49.76979446411133},
	{family = "Prairie", name = "Sanctuary Islands", map = 'Prairie_Island', x = 331.5647277832031, y = 28.37299346923828, z = 77.81648254394531},
	{family = "Prairie", name = "Sanctuary Islands", map = 'Prairie_Island', x = 332.7480773925781, y = 19.45809555053711, z = 109.82171630859375},
	{family = "Prairie", name = "Sanctuary Islands", map = 'Prairie_Island', x = 323.9369812011719, y = 19.74265480041504, z = 119.34933471679688},
	{family = "Prairie", name = "Sanctuary Islands", map = 'Prairie_Island', x = 360.99853515625, y = 0.8867171406745911,z = 102.09505462646484},
	{family = "Prairie", name = "Sanctuary Islands", map = 'Prairie_Island', x = 292.2529602050781, y = 1.7972142696380615,z = 97.39100646972656},
	{family = "Prairie", name = "Sanctuary Islands", map = 'Prairie_Island', x = 293.5015869140625, y = 5.671757221221924, z = 93.57311248779297},
	{family = "Prairie", name = "Sanctuary Islands", map = 'Prairie_Island', x = 291.7178039550781, y = 4.960348129272461, z = 91.42939758300781},
	{family = "Prairie", name = "Sanctuary Islands", map = 'Prairie_Island', x = 297.21112060546875, y = 8.015872955322266,z = 79.08104705810547},
	{family = "Prairie", name = "Sanctuary Islands", map = 'Prairie_Island', x = 281.9485778808594, y = 18.21292495727539, z = 75.27326965332031},
	{family = "Prairie", name = "Sanctuary Islands", map = 'Prairie_Island', x = 283.03326416015625, y = 13.549970626831055,z = 142.6686248779297},
	{family = "Prairie", name = "Sanctuary Islands", map = 'Prairie_Island', x = 395.7971496582031, y = 0.5805166363716125,z = 140.3428497314453},
	{family = "Prairie", name = "Sanctuary Islands", map = 'Prairie_Island', x = 402.98358154296875, y = 0.5845025777816772,z = 139.914794921875},
	{family = "Prairie", name = "Sanctuary Islands", map = 'Prairie_Island', x = 407.047119140625, y = 1.8199610710144043,z = 133.8062744140625},
	{family = "Prairie", name = "Sanctuary Islands", map = 'Prairie_Island', x = 402.7697448730469, y = 1.491576910018921, z = 128.71054077148438},
	{family = "Prairie", name = "Sanctuary Islands", map = 'Prairie_Island', x = 408.22515869140625, y = 1.0959080457687378,z = 124.1927719116211},
	{family = "Prairie", name = "Sanctuary Islands", map = 'Prairie_Island', x = 418.94366455078125, y = 1.346806287765503, z = 114.8463134765625},

	{family = "Forest", name = "Forest", map = "Rain", x = -627.5069580078125, y = 217.14407348632812, z = 132.29254150390625},
	{family = "Forest", name = "Forest", map = "Rain", x = -616.1636962890625, y = 217.96763610839844, z = 131.7092742919922},
	{family = "Forest", name = "Forest", map = "Rain", x = -606.6339721679688, y = 219.0542449951172, z = 143.15093994140625},
	{family = "Forest", name = "Forest", map = "Rain", x = -227.1379852294922, y = 94.59088897705078, z = -0.7697563171386719},
	{family = "Forest", name = "Forest", map = "Rain", x = -218.19772338867188, y = 95.24683380126953, z = 18.248083114624023},
	{family = "Forest", name = "Forest", map = "Rain", x = -197.91104125976562, y = 96.91829681396484, z = 20.681482315063477},
	{family = "Forest", name = "Forest", map = "Rain", x = -190.1367645263672, y = 99.71876525878906, z = 1.693684697151184},
	{family = "Forest", name = "Forest", map = "Rain", x = -189.6844940185547, y = 99.72039794921875, z = 6.418601036071777},
	{family = "Forest", name = "Forest", map = "Rain", x = -176.1744384765625, y = 97.58684539794922, z = 27.11359214782715},
	{family = "Forest", name = "Forest", map = "Rain", x = -152.40316772460938, y = 97.47451782226562, z = 10.711235046386719},
	{family = "Forest", name = "Forest", map = "Rain", x = -138.90557861328125, y = 99.83920288085938, z = 8.311784744262695},
	{family = "Forest", name = "Forest", map = "Rain", x = -131.69488525390625, y = 99.02848815917969, z = 15.53860855102539},
	{family = "Forest", name = "Forest", map = "Rain", x = -145.4907989501953, y = 97.76659393310547, z = 32.29670715332031},
	{family = "Forest", name = "Forest", map = "Rain", x = -132.453857421875, y = 99.41631317138672, z = 30.74054527282715},
	{family = "Forest", name = "Forest", map = "Rain", x = -117.27128601074219, y = 98.44124603271484, z = 28.47067642211914},

	{family = "Forest", name = "Treehouse", map = "Rain_BaseCamp", x= 105.58521270751953, y = 142.84555053710938, z = 20.468217849731445},
	{family = "Forest", name = "Treehouse", map = "Rain_BaseCamp", x= 82.03945922851562, y = 141.40216064453125, z = 6.580731391906738},
	{family = "Forest", name = "Treehouse", map = "Rain_BaseCamp", x= 61.386627197265625, y = 140.25596618652344, z = 7.753787517547607},
	{family = "Forest", name = "Treehouse", map = "Rain_BaseCamp", x= 69.09538269042969, y = 160.6775665283203, z = 25.572864532470703},
	{family = "Forest", name = "Treehouse", map = "Rain_BaseCamp", x= 60.673736572265625, y = 141.7501983642578, z = -12.187196731567383},
	{family = "Forest", name = "Treehouse", map = "Rain_BaseCamp", x= 35.43569564819336, y = 140.85446166992188, z = 6.7392964363098145},
	{family = "Forest", name = "Treehouse", map = "Rain_BaseCamp", x= 20.77667236328125, y = 137.6776885986328, z = 11.38563060760498},
	{family = "Forest", name = "Treehouse", map = "Rain_BaseCamp", x= 35.238704681396484, y = 140.8695831298828, z = 6.736605644226074},
	{family = "Forest", name = "Treehouse", map = "Rain_BaseCamp", x= 11.70361328125, y = 147.4263458251953, z = -3.7856478691101074},
	{family = "Forest", name = "Treehouse", map = "Rain_BaseCamp", x= 6.546524524688721, y = 147.38693237304688, z = 0.3261505961418152},
	{family = "Forest", name = "Treehouse", map = "Rain_BaseCamp", x= 17.792882919311523, y = 152.59564208984375, z = 0.4494355320930481},
	{family = "Forest", name = "Treehouse", map = "Rain_BaseCamp", x= 19.657100677490234, y = 146.18472290039062, z = 21.438615798950195},
	{family = "Forest", name = "Treehouse", map = "Rain_BaseCamp", x= 19.67191505432129, y = 162.43040466308594, z = 4.054534435272217},
	{family = "Forest", name = "Treehouse", map = "Rain_BaseCamp", x= 34.97221755981445, y = 138.07571411132812, z = 29.67296028137207},
	{family = "Forest", name = "Treehouse", map = "Rain_BaseCamp", x= 60.708221435546875, y = 140.79347229003906, z = -16.212696075439453},

	{family = "Forest", name = "Wind Paths", map = "Skyway", x = 267.375, y = 332.397, z = -120.680},
	{family = "Forest", name = "Wind Paths", map = "Skyway", x = 245.839, y = 367.077, z = -146.051},
	{family = "Forest", name = "Wind Paths", map = "Skyway", x = 273.569, y = 327.611, z = -147.687},
	{family = "Forest", name = "Wind Paths", map = "Skyway", x = 214.075, y = 315.975, z = -138.198},
	{family = "Forest", name = "Wind Paths", map = "Skyway", x = 128.261, y = 350.825, z = -92.770},
	{family = "Forest", name = "Wind Paths", map = "Skyway", x = 123.525, y = 359.633, z = -107.510},
	{family = "Forest", name = "Wind Paths", map = "Skyway", x = 131.597, y = 338.295, z = -134.803},
	{family = "Forest", name = "Wind Paths", map = "Skyway", x = 155.135, y = 323.591, z = -135.115},
	{family = "Forest", name = "Wind Paths", map = "Skyway", x = 325.290, y = 367.150, z = -220.587},
	{family = "Forest", name = "Wind Paths", map = "Skyway", x = 335.149, y = 378.517, z = -214.938},
	{family = "Forest", name = "Wind Paths", map = "Skyway", x = 334.877, y = 364.053, z = -201.844},
	{family = "Forest", name = "Wind Paths", map = "Skyway", x = 361.274, y = 345.678, z = -165.847},
	{family = "Forest", name = "Wind Paths", map = "Skyway", x = 364.935, y = 341.374, z = -151.819},
	{family = "Forest", name = "Wind Paths", map = "Skyway", x = 348.168, y = 332.000, z = -155.022},
	{family = "Forest", name = "Wind Paths", map = "Skyway", x = 381.581, y = 331.177, z = 337.934},
	{family = "Forest", name = "Wind Paths", map = "Skyway", x = 429.284, y = 320.199, z = 522.703},
	{family = "Forest", name = "Wind Paths", map = "Skyway", x = 441.475, y = 319.398, z = 525.655},
	{family = "Forest", name = "Wind Paths", map = "Skyway", x = 276.076, y = 335.565, z = 581.796},
	{family = "Forest", name = "Wind Paths", map = "Skyway", x = 340.497, y = 343.845, z = 690.805},
	{family = "Forest", name = "Wind Paths", map = "Skyway", x = 235.033, y = 352.802, z = 389.350},
	{family = "Forest", name = "Wind Paths", map = "Skyway", x = 202.937, y = 306.784, z = 374.721},
	{family = "Forest", name = "Wind Paths", map = "Skyway", x = 97.293, y = 312.991, z = 219.590},
	{family = "Forest", name = "Wind Paths", map = "Skyway", x = 164.531, y = 319.641, z = 631.402},
	{family = "Forest", name = "Wind Paths", map = "Skyway", x = 75.486, y = 346.333, z = 419.043},
	{family = "Forest", name = "Wind Paths", map = "Skyway", x = 280.755, y = 380.818, z = 11.880},

	{family = "Forest", name = "Forest's Brook", map = "RainForest", x = -106.79784393310547, y = 100.14737701416016, z = 27.011117935180664},
	{family = "Forest", name = "Forest's Brook", map = "RainForest", x = -66.97208404541016, y = 106.39827728271484, z = 15.939188957214355},
	{family = "Forest", name = "Forest's Brook", map = "RainForest", x = -71.39379119873047, y = 106.23229217529297, z = 29.58515167236328},
	{family = "Forest", name = "Forest's Brook", map = "RainForest", x = -64.58373260498047, y = 127.58283996582031, z = 23.77618408203125},
	{family = "Forest", name = "Forest's Brook", map = "RainForest", x = -90.58216094970703, y = 107.4986343383789, z = 68.78263854980469},
	{family = "Forest", name = "Forest's Brook", map = "RainForest", x = -111.20956420898438, y = 111.97493743896484, z = 104.5016860961914},
	{family = "Forest", name = "Forest's Brook", map = "RainForest", x = -101.85662841796875, y = 112.6841812133789, z = 97.13552856445312},
	{family = "Forest", name = "Forest's Brook", map = "RainForest", x = -61.13520431518555, y = 107.57537078857422, z = 71.12226867675781},
	{family = "Forest", name = "Forest's Brook", map = "RainForest", x = -49.22496032714844, y = 112.50108337402344, z = 106.86517333984375},
	{family = "Forest", name = "Forest's Brook", map = "RainForest", x = -52.07992172241211, y = 106.99028778076172, z = 68.19967651367188},
	{family = "Forest", name = "Forest's Brook", map = "RainForest", x = -43.84225845336914, y = 98.30781555175781, z = 40.694129943847656},
	{family = "Forest", name = "Forest's Brook", map = "RainForest", x = -30.387901306152344, y = 99.8733139038086, z = 89.06594848632812},
	{family = "Forest", name = "Forest's Brook", map = "RainForest", x = -19.77448272705078, y = 100.52644348144531, z = 88.17034912109375},
	{family = "Forest", name = "Forest's Brook", map = "RainForest", x = -25.136350631713867, y = 99.09033966064453, z = 106.16337585449219},
	{family = "Forest", name = "Forest's Brook", map = "RainForest", x = -2.6953141689300537, y = 97.7259292602539, z = 54.686195373535156},
	{family = "Forest", name = "Forest's Brook", map = "RainForest", x = -3.3522751331329346, y = 96.66667938232422, z = 45.73674774169922},
	{family = "Forest", name = "Forest's Brook", map = "RainForest", x = -10.804974555969238, y = 96.60961151123047, z = 38.42040252685547},
	{family = "Forest", name = "Forest's Brook", map = "RainForest", x = 10.913758277893066, y = 96.78509521484375, z = 63.987361907958984},
	{family = "Forest", name = "Forest's Brook", map = "RainForest", x = 18.164230346679688, y = 103.49531555175781, z = 81.83629608154297},
	{family = "Forest", name = "Forest's Brook", map = "RainForest", x = 14.006277084350586, y = 103.90534973144531, z = 86.85252380371094},
	{family = "Forest", name = "Forest's Brook", map = "RainForest", x = 33.427513122558594, y = 99.58728790283203, z = 92.53579711914062},
	{family = "Forest", name = "Forest's Brook", map = "RainForest", x = 28.928268432617188, y = 97.57671356201172, z = 77.79023742675781},
	{family = "Forest", name = "Forest's Brook", map = "RainForest", x = 47.122413635253906, y = 100.1793212890625, z = 64.99016571044922},
	{family = "Forest", name = "Forest's Brook", map = "RainForest", x = 30.70799446105957, y = 102.6952896118164, z = 51.110721588134766},
	{family = "Forest", name = "Forest's Brook", map = "RainForest", x = -2.7336158752441406, y = 105.27145385742188, z = 38.526004791259766},
	{family = "Forest", name = "Forest's Brook", map = "RainForest", x = -25.89279556274414, y = 117.9773941040039, z = 24.73155975341797},
	{family = "Forest", name = "Forest's Brook", map = "RainForest", x = -41.90158462524414, y = 118.53023529052734, z = 19.51756477355957},
	{family = "Forest", name = "Forest's Brook", map = "RainForest", x = -10.476714134216309, y = 129.70359802246094, z = 78.96803283691406},
	{family = "Forest", name = "Forest's Brook", map = "RainForest", x = -14.047037124633789, y = 129.71502685546875, z = 78.63593292236328},

	{family = "Forest", name = "Elevated Clearing", map = "RainShelter", x = -56.2984504699707, y = 84.28899383544922, z = 13.194242477416992},
	{family = "Forest", name = "Elevated Clearing", map = "RainShelter", x = -53.13119888305664, y = 85.8959732055664, z = -1.104617953300476},
	{family = "Forest", name = "Elevated Clearing", map = "RainShelter", x = -32.04152297973633, y = 85.4687728881836, z = -16.6461238861084},
	{family = "Forest", name = "Elevated Clearing", map = "RainShelter", x = -18.939252853393555, y = 103.51744079589844, z = -44.5482063293457},
	{family = "Forest", name = "Elevated Clearing", map = "RainShelter", x = -10.06113338470459, y = 85.34862518310547, z = -0.6101300120353699},
	{family = "Forest", name = "Elevated Clearing", map = "RainShelter", x = -7.720042705535889, y = 84.25837707519531, z = -7.878720760345459},
	{family = "Forest", name = "Elevated Clearing", map = "RainShelter", x = 7.315776824951172, y = 93.04299926757812, z = 8.814708709716797},
	{family = "Forest", name = "Elevated Clearing", map = "RainShelter", x = 21.49363136291504, y = 96.31813049316406, z = -17.86054229736328},
	{family = "Forest", name = "Elevated Clearing", map = "RainShelter", x = 15.222472190856934, y = 94.04011535644531, z = -30.590702056884766},
	{family = "Forest", name = "Elevated Clearing", map = "RainShelter", x = 23.575653076171875, y = 96.75299835205078, z = -20.856063842773438},
	{family = "Forest", name = "Elevated Clearing", map = "RainShelter", x = 68.48648071289062, y = 90.34416198730469, z = 4.472537517547607},
	{family = "Forest", name = "Elevated Clearing", map = "RainShelter", x = 69.47054290771484, y = 89.2098159790039, z = -2.8092153072357178},
	{family = "Forest", name = "Elevated Clearing", map = "RainShelter", x = 98.27557373046875, y = 88.34962463378906, z = 16.273279190063477},
	{family = "Forest", name = "Elevated Clearing", map = "RainShelter", x = 115.8653793334961, y = 89.45538330078125, z = 14.579297065734863},

	{family = "Forest", name = "Boneyard", map = "RainMid", x = 154.72926330566406, y = 153.88075256347656, z = -80.01103973388672},
	{family = "Forest", name = "Boneyard", map = "RainMid", x = 176.21690368652344, y = 136.11322021484375, z = -74.40979766845703},
	{family = "Forest", name = "Boneyard", map = "RainMid", x = 220.8597412109375, y = 144.34341430664062, z = -63.919700622558594},
	{family = "Forest", name = "Boneyard", map = "RainMid", x = 228.4488983154297, y = 144.74513244628906, z = -69.6482925415039},
	{family = "Forest", name = "Boneyard", map = "RainMid", x = 226.59027099609375, y = 137.0164794921875, z = -94.08983612060547},
	{family = "Forest", name = "Boneyard", map = "RainMid", x = 213.70126342773438, y = 134.67535400390625, z = -82.23283386230469},
	{family = "Forest", name = "Boneyard", map = "RainMid", x = 231.302978515625, y = 134.76483154296875, z = -75.29278564453125},
	{family = "Forest", name = "Boneyard", map = "RainMid", x = 225.11880493164062, y = 135.1485595703125, z = -48.195579528808594},
	{family = "Forest", name = "Boneyard", map = "RainMid", x = 246.91844177246094, y = 140.66452026367188, z = -24.212379455566406},
	{family = "Forest", name = "Boneyard", map = "RainMid", x = 222.1226043701172, y = 135.95423889160156, z = -23.232078552246094},
	{family = "Forest", name = "Boneyard", map = "RainMid", x = 198.26341247558594, y = 134.90887451171875, z = -20.693994522094727},
	{family = "Forest", name = "Boneyard", map = "RainMid", x = 194.89169311523438, y = 139.90567016601562, z = -21.957490921020508},
	{family = "Forest", name = "Boneyard", map = "RainMid", x = 158.82020568847656, y = 137.73153686523438, z = -35.448585510253906},
	{family = "Forest", name = "Boneyard", map = "RainMid", x = 165.13662719726562, y = 134.8585662841797, z = -16.541215896606445},
	{family = "Forest", name = "Boneyard", map = "RainMid", x = 157.76380920410156, y = 164.9462127685547, z = 120.3241958618164},
	{family = "Forest", name = "Boneyard", map = "RainMid", x = 137.87315368652344, y = 135.01556396484375, z = -10.567667007446289},
	{family = "Forest", name = "Boneyard", map = "RainMid", x = 113.74283599853516, y = 140.29092407226562, z = -8.871809959411621},
	{family = "Forest", name = "Boneyard", map = "RainMid", x = 109.18257904052734, y = 138.18038940429688, z = -5.300501823425293},
	{family = "Forest", name = "Boneyard", map = "RainMid", x = 85.58588409423828, y = 138.51504516601562, z = -11.016542434692383},
	{family = "Forest", name = "Boneyard", map = "RainMid", x = 11.743234634399414, y = 140.3578643798828, z = 21.9844970703125},
	{family = "Forest", name = "Boneyard", map = "RainMid", x = 53.756980895996094, y = 145.73068237304688, z = 45.95403289794922},
	{family = "Forest", name = "Boneyard", map = "RainMid", x = 72.4646987915039, y = 144.57154846191406, z = 52.49279022216797},
	{family = "Forest", name = "Boneyard", map = "RainMid", x = 107.68956756591797, y = 138.72364807128906, z = 90.01604461669922},
	{family = "Forest", name = "Boneyard", map = "RainMid", x = 135.0379180908203, y = 146.3599853515625, z = 73.45281982421875},
	{family = "Forest", name = "Boneyard", map = "RainMid", x = 218.6438751220703, y = 135.57656860351562, z = 48.81428146362305},
	{family = "Forest", name = "Boneyard", map = "RainMid", x = 220.6811981201172, y = 135.22120666503906, z = 25.96380615234375},
	{family = "Forest", name = "Boneyard", map = "RainMid", x = 194.08200073242188, y = 137.43736267089844, z = 3.8758304119110107},

	{family = "Forest", name = "Forest Temple", map = "RainEnd", x = -11.367512702941895, y = 104.92166900634766, z = 7.069022178649902},
	{family = "Forest", name = "Forest Temple", map = "RainEnd", x = -16.14753532409668, y = 110.67167663574219, z = 15.755743026733398},
	{family = "Forest", name = "Forest Temple", map = "RainEnd", x = -4.72360897064209, y = 104.92156219482422, z = -16.801280975341797},
	{family = "Forest", name = "Forest Temple", map = "RainEnd", x = 7.661406517028809, y = 106.77925109863281, z = -13.379182815551758},
	{family = "Forest", name = "Forest Temple", map = "RainEnd", x = 70.02780151367188, y = 110.11184692382812, z = 8.755701065063477},
	{family = "Forest", name = "Forest Temple", map = "RainEnd", x = 67.9460678100586, y = 108.55078887939453, z = -9.949658393859863},
	{family = "Forest", name = "Forest Temple", map = "RainEnd", x = 85.07408142089844, y = 107.62669372558594, z = 18.29657745361328},
	{family = "Forest", name = "Forest Temple", map = "RainEnd", x = 97.59142303466797, y = 108.91648864746094, z = -10.558381080627441},
	{family = "Forest", name = "Forest Temple", map = "RainEnd", x = 96.8857192993164, y = 106.91252136230469, z = 0.5247047543525696},

	{family = "Forest", name = "Forest Cave", map = "Rain_Cave", x = -281.2309875488281, y = 78.38956451416016, z = 62.751949310302734},
	{family = "Forest", name = "Forest Cave", map = "Rain_Cave", x = -284.666015625, y = 80.55488586425781, z = 60.66569137573242},
	{family = "Forest", name = "Forest Cave", map = "Rain_Cave", x = -288.00885009765625, y = 80.52780151367188, z = 64.1376724243164},
	{family = "Forest", name = "Forest Cave", map = "Rain_Cave", x = -416.69915771484375, y = 78.63843536376953, z = 26.388769149780273},
	{family = "Forest", name = "Forest Cave", map = "Rain_Cave", x = -365.7904357910156, y = 121.37095642089844, z = 1.7882102727890015},
	{family = "Forest", name = "Forest Cave", map = "Rain_Cave", x = -198.6945343017578, y = 132.4363250732422, z = -53.944515228271484},
	{family = "Forest", name = "Forest Cave", map = "Rain_Cave", x = -196.7183380126953, y = 132.3707275390625, z = -37.305179595947266},
	{family = "Forest", name = "Forest Cave", map = "Rain_Cave", x = -193.0370330810547, y = 133.53643798828125, z = -33.206729888916016},
	{family = "Forest", name = "Forest Cave", map = "Rain_Cave", x = -213.4595489501953, y = 137.6908416748047, z = 9.732129096984863},
	{family = "Forest", name = "Forest Cave", map = "Rain_Cave", x = -201.9893798828125, y = 209.00193786621094, z = -65.59923553466797},
	{family = "Forest", name = "Forest Cave", map = "Rain_Cave", x = -295.6673583984375, y = 210.6011199951172, z = -68.79963684082031},
	{family = "Forest", name = "Forest Cave", map = "Rain_Cave", x = -284.5804748535156, y = 210.75970458984375, z = -62.6735725402832},

	{family = "Valley", name = "Valley Ice Rink", map = "Sunset", x = 22.520116806030273, y = 306.17010498046875, z = -44.37919235229492},
	{family = "Valley", name = "Valley Ice Rink", map = "Sunset", x = 9.00317096710205, y = 307.0001220703125, z = -41.85432815551758},
	{family = "Valley", name = "Valley Ice Rink", map = "Sunset", x = 1.2158303260803223, y = 306.439453125, z = -31.947078704833984},
	{family = "Valley", name = "Valley Ice Rink", map = "Sunset", x = -110.69499206542969, y = 267.9884033203125, z = -126.58326721191406},
	{family = "Valley", name = "Valley Ice Rink", map = "Sunset", x = -118.49629974365234, y = 260.2767333984375, z = -102.57919311523438},
	{family = "Valley", name = "Valley Ice Rink", map = "Sunset", x = -148.97537231445312, y = 255.97947692871094, z = -92.97239685058594},
	{family = "Valley", name = "Valley Ice Rink", map = "Sunset", x = -165.67343139648438, y = 251.6456756591797, z = -98.99285125732422},
	{family = "Valley", name = "Valley Ice Rink", map = "Sunset", x = -172.37823486328125, y = 250.05055236816406, z = -101.8346939086914},
	{family = "Valley", name = "Valley Ice Rink", map = "Sunset", x = -180.0336151123047, y = 248.42347717285156, z = -105.18260192871094},
	{family = "Valley", name = "Valley Ice Rink", map = "Sunset", x = -186.94642639160156, y = 246.9510498046875, z = -108.10989379882812},
	{family = "Valley", name = "Valley Ice Rink", map = "Sunset", x = -194.3109893798828, y = 245.42291259765625, z = -111.25920867919922},
	{family = "Valley", name = "Valley Ice Rink", map = "Sunset", x = -222.70657348632812, y = 240.23768615722656, z = -121.31552124023438},
	{family = "Valley", name = "Valley Ice Rink", map = "Sunset", x = -226.26303100585938, y = 227.6426544189453, z = -150.46685791015625},
	{family = "Valley", name = "Valley Ice Rink", map = "Sunset", x = -332.05633544921875, y = 199.0033416748047, z = -135.24978637695312},
	{family = "Valley", name = "Valley Ice Rink", map = "Sunset", x = -449.3511047363281, y = 124.81099700927734, z = -64.15131378173828},
	{family = "Valley", name = "Valley Ice Rink", map = "Sunset", x = -454.82806396484375, y = 87.8582763671875, z = 9.725422859191895},
	{family = "Valley", name = "Valley Ice Rink", map = "Sunset", x = -477.9969787597656, y = 75.4820556640625, z = 67.58084106445312},
	{family = "Valley", name = "Valley Ice Rink", map = "Sunset", x = -489.90740966796875, y = 72.9424819946289, z = 93.45818328857422},
	{family = "Valley", name = "Valley Ice Rink", map = "Sunset", x = -448.09075927734375, y = 75.4749984741211, z = 156.75448608398438},
	{family = "Valley", name = "Valley Ice Rink", map = "Sunset", x = -445.22955322265625, y = 75.88153839111328, z = 158.9290313720703},
	{family = "Valley", name = "Valley Ice Rink", map = "Sunset", x = -485.6787414550781, y = 44.69013214111328, z = 174.08290100097656},
	{family = "Valley", name = "Valley Ice Rink", map = "Sunset", x = -487.7472229003906, y = 44.75007247924805, z = 169.48712158203125},
	{family = "Valley", name = "Valley Ice Rink", map = "Sunset", x = -518.9486694335938, y = 39.621063232421875, z = 180.49461364746094},
	{family = "Valley", name = "Valley Ice Rink", map = "Sunset", x = -531.7857055664062, y = 45.14760971069336, z = 160.78244018554688},
	{family = "Valley", name = "Valley Ice Rink", map = "Sunset", x = -547.5202026367188, y = 44.97871398925781, z = 185.6315155029297},
	{family = "Valley", name = "Valley Ice Rink", map = "Sunset", x = -546.0647583007812, y = 44.91852569580078, z = 190.59889221191406},
	{family = "Valley", name = "Valley Ice Rink", map = "Sunset", x = -522.8544311523438, y = 44.806640625, z = 219.5564422607422},
	{family = "Valley", name = "Valley Ice Rink", map = "Sunset", x = -516.159423828125, y = 44.81883239746094, z = 220.83042907714844},
	{family = "Valley", name = "Valley Ice Rink", map = "Sunset", x = -461.4557800292969, y = 45.80271911621094, z = 298.7102966308594},
	{family = "Valley", name = "Valley Ice Rink", map = "Sunset", x = -517.1106567382812, y = 48.74776840209961, z = 198.2572479248047},

	{family = "Valley", name = "Valley Citadel", map = "Sunset_Citadel", x = 24.42972755432129, y = 480.7976379394531, z = 79.5075912475586},
	{family = "Valley", name = "Valley Citadel", map = "Sunset_Citadel", x = 0.8978942632675171, y = 472.4676208496094, z = 98.85741424560547},
	{family = "Valley", name = "Valley Citadel", map = "Sunset_Citadel", x = 15.915234565734863, y = 477.3797912597656, z = 115.19832611083984},
	{family = "Valley", name = "Valley Citadel", map = "Sunset_Citadel", x = -3.158421516418457, y = 481.3546447753906, z = 119.78873443603516},
	{family = "Valley", name = "Valley Citadel", map = "Sunset_Citadel", x = -4.406952857971191, y = 507.2851867675781, z = 17.685771942138672},
	{family = "Valley", name = "Valley Citadel", map = "Sunset_Citadel", x = -38.685909271240234, y = 530.7809448242188, z = 27.003870010375977},
	{family = "Valley", name = "Valley Citadel", map = "Sunset_Citadel", x = -50.58378982543945, y = 531.0604858398438, z = 92.47300720214844},
	{family = "Valley", name = "Valley Citadel", map = "Sunset_Citadel", x = -47.71146774291992, y = 560.7132568359375, z = 95.58745574951172},
	{family = "Valley", name = "Valley Citadel", map = "Sunset_Citadel", x = -55.42280960083008, y = 558.6510009765625, z = 84.35331726074219},
	{family = "Valley", name = "Valley Citadel", map = "Sunset_Citadel", x = -37.45925521850586, y = 558.6508178710938, z = 105.94418334960938},
	{family = "Valley", name = "Valley Citadel", map = "Sunset_Citadel", x = -27.823604583740234, y = 534.6639404296875, z = 113.11365509033203},
	{family = "Valley", name = "Valley Citadel", map = "Sunset_Citadel", x = -38.958984375, y = 502.60943603515625, z = 115.96815490722656},
	{family = "Valley", name = "Valley Citadel", map = "Sunset_Citadel", x = -67.96995544433594, y = 474.0838623046875, z = 112.22481536865234},
	{family = "Valley", name = "Valley Citadel", map = "Sunset_Citadel", x = -71.55809020996094, y = 478.86083984375, z = 129.54644775390625},
	{family = "Valley", name = "Valley Citadel", map = "Sunset_Citadel", x = -91.00936126708984, y = 478.86053466796875, z = 105.59078216552734},
	{family = "Valley", name = "Valley Citadel", map = "Sunset_Citadel", x = -114.14602661132812, y = 480.7374572753906, z = 122.82920837402344},
	{family = "Valley", name = "Valley Citadel", map = "Sunset_Citadel", x = -98.15608215332031, y = 480.687744140625, z = 141.8119659423828},
	{family = "Valley", name = "Valley Citadel", map = "Sunset_Citadel", x = -120.63456726074219, y = 485.7333984375, z = 156.34933471679688},
	{family = "Valley", name = "Valley Citadel", map = "Sunset_Citadel", x = -131.70526123046875, y = 485.6743469238281, z = 140.75173950195312},
	{family = "Valley", name = "Valley Citadel", map = "Sunset_Citadel", x = -158.2747344970703, y = 495.3871765136719, z = 155.22164916992188},
	{family = "Valley", name = "Valley Citadel", map = "Sunset_Citadel", x = -143.93162536621094, y = 495.333984375, z = 174.9748077392578},
	{family = "Valley", name = "Valley Citadel", map = "Sunset_Citadel", x = -203.8780059814453, y = 491.9259338378906, z = 206.35220336914062},

	{family = "Valley", name = "Valley Colosseum", map = "SunsetColosseum", x = -259.9415283203125, y = 167.48284912109375, z = -20.542476654052734},
	{family = "Valley", name = "Valley Colosseum", map = "SunsetColosseum", x = -148.1111602783203, y = 167.48284912109375, z = 3.6986045837402344},
	{family = "Valley", name = "Valley Colosseum", map = "SunsetColosseum", x = -145.08981323242188, y = 167.4828643798828, z = 104.90950775146484},
	{family = "Valley", name = "Valley Colosseum", map = "SunsetColosseum", x = -191.9809112548828, y = 151.53164672851562, z = 101.27725982666016},
	{family = "Valley", name = "Valley Colosseum", map = "SunsetColosseum", x = -258.3929138183594, y = 167.48277282714844, z = 135.76043701171875},
	{family = "Valley", name = "Valley Colosseum", map = "SunsetColosseum", x = -263.9840393066406, y = 136.53802490234375, z = 56.38932418823242},
	{family = "Valley", name = "Valley Colosseum", map = "SunsetColosseum", x = -267.12579345703125, y = 137.62075805664062, z = 63.94490051269531},
	{family = "Valley", name = "Valley Colosseum", map = "SunsetColosseum", x = -219.79994201660156, y = 137.78880310058594, z = 24.72966957092285},
	{family = "Valley", name = "Valley Colosseum", map = "SunsetColosseum", x = -213.39285278320312, y = 137.78880310058594, z = 89.4344253540039},
  
	{family = "Valley", name = "Valley Fly Race", map = "Sunset_FlyRace", x = 381.46783447265625, y = 1187.694580078125, z = 76.41629028320312},
	{family = "Valley", name = "Valley Fly Race", map = "Sunset_FlyRace", x = 348.8865966796875, y = 1179.8048095703125, z = -171.40061950683594},
	{family = "Valley", name = "Valley Fly Race", map = "Sunset_FlyRace", x = 289.05804443359375, y = 1175.52978515625, z = -266.0985412597656},
	{family = "Valley", name = "Valley Fly Race", map = "Sunset_FlyRace", x = 69.34074401855469, y = 1164.7379150390625, z = -397.760498046875},
	{family = "Valley", name = "Valley Fly Race", map = "Sunset_FlyRace", x = 50.46381378173828, y = 1163.900390625, z = -397.8044738769531},
	{family = "Valley", name = "Valley Fly Race", map = "Sunset_FlyRace", x = -29.535158157348633, y = 1157.2373046875, z = -349.8327941894531},
	{family = "Valley", name = "Valley Fly Race", map = "Sunset_FlyRace", x = -32.651405334472656, y = 1051.8070068359375, z = 69.76197814941406},
	{family = "Valley", name = "Valley Fly Race", map = "Sunset_FlyRace", x = -69.29006958007812, y = 1050.3668212890625, z = 111.15153503417969},
	{family = "Valley", name = "Valley Fly Race", map = "Sunset_FlyRace", x = -100.14618682861328, y = 1038.383544921875, z = 155.33790588378906},
	{family = "Valley", name = "Valley Fly Race", map = "Sunset_FlyRace", x = 450.38140869140625, y = 474.96917724609375, z = -423.32904052734375},
	{family = "Valley", name = "Valley Fly Race", map = "Sunset_FlyRace", x = 418.3880615234375, y = 446.617919921875, z = -401.19354248046875},
	{family = "Valley", name = "Valley Fly Race", map = "Sunset_FlyRace", x = 385.9672546386719, y = 406.02825927734375, z = -324.0826721191406},
	{family = "Valley", name = "Valley Fly Race", map = "Sunset_FlyRace", x = 216.13739013671875, y = 273.684814453125, z = -141.75169372558594},
	{family = "Valley", name = "Valley Fly Race", map = "Sunset_FlyRace", x = 181.4438934326172, y = 232.8076171875, z = -2.92484188079834},
	{family = "Valley", name = "Valley Fly Race", map = "Sunset_FlyRace", x = 73.24301147460938, y = 185.21400451660156, z = 40.287479400634766},
	{family = "Valley", name = "Valley Fly Race", map = "Sunset_FlyRace", x = 12.287199974060059, y = 169.22158813476562, z = 52.304508209228516},

	{family = "Valley", name = "Valley Race", map = "SunsetRace", x = 571.388427734375, y = 889.5077514648438, z = 132.6311492919922},
	{family = "Valley", name = "Valley Race", map = "SunsetRace", x = 475.813720703125, y = 852.7994995117188, z = 159.01361083984375},
	{family = "Valley", name = "Valley Race", map = "SunsetRace", x = 416.1005554199219, y = 832.7763061523438, z = 158.046630859375},
	{family = "Valley", name = "Valley Race", map = "SunsetRace", x = -26.074161529541016, y = 747.139404296875, z = 110.09693145751953},
	{family = "Valley", name = "Valley Race", map = "SunsetRace", x = -324.5790100097656, y = 662.9506225585938, z = 209.0755157470703},
	{family = "Valley", name = "Valley Race", map = "SunsetRace", x = -421.6092834472656, y = 630.8012084960938, z = 195.69529724121094},
	{family = "Valley", name = "Valley Race", map = "SunsetRace", x = -570.6597900390625, y = 584.18701171875, z = 260.3428955078125},
	{family = "Valley", name = "Valley Race", map = "SunsetRace", x = 424.5173645019531, y = 320.4500427246094, z = 2.0229508876800537},
	{family = "Valley", name = "Valley Race", map = "SunsetRace", x = 388.1941223144531, y = 313.3712463378906, z = 11.490737915039062},
	{family = "Valley", name = "Valley Race", map = "SunsetRace", x = 265.34466552734375, y = 268.7123107910156, z = 10.775996208190918},
	{family = "Valley", name = "Valley Race", map = "SunsetRace", x = 74.07786560058594, y = 185.6116180419922, z = 40.443275451660156},
	{family = "Valley", name = "Valley Race", map = "SunsetRace", x = 36.78528594970703, y = 175.18060302734375, z = 52.33039855957031},
	{family = "Valley", name = "Valley Race", map = "SunsetRace", x = 11.6656494140625, y = 169.3128204345703, z = 44.62201690673828},

	{family = "Valley", name = "Valley Temple", map = "SunsetEnd2", x = -189.81155395507812, y = 141.4324493408203, z = 9.400322914123535},
	{family = "Valley", name = "Valley Temple", map = "SunsetEnd2", x = -150.7283172607422, y = 147.15293884277344, z = -29.96817398071289},
	{family = "Valley", name = "Valley Temple", map = "SunsetEnd2", x = -149.0789337158203, y = 140.55630493164062, z = -30.956897735595703},
	{family = "Valley", name = "Valley Temple", map = "SunsetEnd2", x = -127.04251861572266, y = 153.80331420898438, z = -18.655099868774414},
	{family = "Valley", name = "Valley Temple", map = "SunsetEnd2", x = -118.18791198730469, y = 153.8365020751953, z = -11.451508522033691},

	{family = "Valley", name = "Dream Village", map = "SunsetVillage", x = 70.97738647460938, y = 50.091190338134766, z = 77.55197143554688},
	{family = "Valley", name = "Dream Village", map = "SunsetVillage", x = 73.16737365722656, y = 76.686279296875, z = 258.62237548828125},

	{family = "Valley", name = "Hermit Valley", map = "Sunset_YetiPark", x = 683.3143920898438, y = 260.7340087890625, z = -191.4088134765625},
	
    {family = "Wasteland", name = "Abyss Area", map = "Dusk_Triangle", x = -4.397, y = 3.456, z = 192.275},
	{family = "Wasteland", name = "Abyss Area", map = "Dusk_Triangle", x = -5.067, y = 4.391, z = 183.301},
	{family = "Wasteland", name = "Abyss Area", map = "Dusk_Triangle", x = -8.384, y = 5.970, z = 179.405},
	{family = "Wasteland", name = "Abyss Area", map = "Dusk_Triangle", x = -18.226, y = 52.203, z = -59.554},
	{family = "Wasteland", name = "Abyss Area", map = "Dusk_Triangle", x = -97.881, y = 11.048, z = 100.999},
	{family = "Wasteland", name = "Abyss Area", map = "Dusk_Triangle", x = -166.344, y = -47.115, z = 11.728},
	{family = "Wasteland", name = "Abyss Area", map = "Dusk_Triangle", x = -4.397, y = 3.456, z = 192.275},
	
	{family = "Wasteland", name = "Golden Wasteland", map = "Dusk", x = 325.54266357421875, y = 0.7171803712844849, z = 85.6548843383789},
	{family = "Wasteland", name = "Golden Wasteland", map = "Dusk", x = 305.46075439453125, y = 1.1371877193450928, z = 83.43257904052734},
	{family = "Wasteland", name = "Golden Wasteland", map = "Dusk", x = 301.6896667480469, y = 0.4210582971572876, z = 7.377177715301514},
	{family = "Wasteland", name = "Golden Wasteland", map = "Dusk", x = 296.58001708984375, y = 0.4209943115711212, z = -3.981872320175171},
	{family = "Wasteland", name = "Golden Wasteland", map = "Dusk", x = 326.160400390625, y = 2.323960304260254, z = -93.23677825927734},
	{family = "Wasteland", name = "Golden Wasteland", map = "Dusk", x = 227.25306701660156, y = 0.42345771193504333, z = -57.93296813964844},
	{family = "Wasteland", name = "Golden Wasteland", map = "Dusk", x = 236.72752380371094, y = 1.6746928691864014, z = -27.1873779296875},
	{family = "Wasteland", name = "Golden Wasteland", map = "Dusk", x = 235.992919921875, y = 0.8092510104179382, z = -31.845582962036133},
	{family = "Wasteland", name = "Golden Wasteland", map = "Dusk", x = 241.15618896484375, y = 0.8182752132415771, z = -30.821805953979492},
	{family = "Wasteland", name = "Golden Wasteland", map = "Dusk", x = 233.54840087890625, y = 1.0340262651443481, z = 38.81285858154297},
	{family = "Wasteland", name = "Golden Wasteland", map = "Dusk", x = 229.27874755859375, y = 0.5555566549301147, z = 45.96807098388672},
	{family = "Wasteland", name = "Golden Wasteland", map = "Dusk", x = 215.48013305664062, y = 1.0234488248825073, z = -26.13222885131836},
	{family = "Wasteland", name = "Golden Wasteland", map = "Dusk", x = 166.29627990722656, y = 8.562358856201172, z = -78.78106689453125},
	{family = "Wasteland", name = "Golden Wasteland", map = "Dusk", x = 160.53623962402344, y = 10.130057334899902, z = -80.67024993896484},
	{family = "Wasteland", name = "Golden Wasteland", map = "Dusk", x = 243.70608520507812, y = 2.157900094985962, z = -32.00672149658203},
	{family = "Wasteland", name = "Golden Wasteland", map = "Dusk", x = 164.46588134765625, y = 9.805089950561523, z = -82.57740020751953},

	{family = "Wasteland", name = "Forgotten Ark", map = "DuskOasis", x = 306.1929016113281, y = 134.1763458251953, z = 148.0145721435547},
	{family = "Wasteland", name = "Forgotten Ark", map = "DuskOasis", x = 323.9439697265625, y = 124.77117156982422, z = 160.407470703125},
	{family = "Wasteland", name = "Forgotten Ark", map = "DuskOasis", x = 343.85357666015625, y = 119.17353057861328, z = 138.00852966308594},
	{family = "Wasteland", name = "Forgotten Ark", map = "DuskOasis", x = 371.95269775390625, y = 124.10951232910156, z = 122.36084747314453},
	{family = "Wasteland", name = "Forgotten Ark", map = "DuskOasis", x = 386.20697021484375, y = 141.7088165283203, z = 112.7038803100586},
	{family = "Wasteland", name = "Forgotten Ark", map = "DuskOasis", x = 460.92181396484375, y = 116.39605712890625, z = 106.32915496826172},
	{family = "Wasteland", name = "Forgotten Ark", map = "DuskOasis", x = 486.12408447265625, y = 109.75221252441406, z = 77.25910186767578},
	{family = "Wasteland", name = "Forgotten Ark", map = "DuskOasis", x = 501.28094482421875, y = 108.83856964111328, z = 42.512359619140625},
	{family = "Wasteland", name = "Forgotten Ark", map = "DuskOasis", x = 501.4571228027344, y = 109.3819580078125, z = 60.27128601074219},
	{family = "Wasteland", name = "Forgotten Ark", map = "DuskOasis", x = 524.3303833007812, y = 108.91081237792969, z = 79.91252136230469},
	{family = "Wasteland", name = "Forgotten Ark", map = "DuskOasis", x = 510.9862060546875, y = 108.88075256347656, z = 95.27606201171875},
	{family = "Wasteland", name = "Forgotten Ark", map = "DuskOasis", x = 345.56427001953125, y = 102.90645599365234, z = 285.5562438964844},
	{family = "Wasteland", name = "Forgotten Ark", map = "DuskOasis", x = 363.22430419921875, y = 103.99573516845703, z = 281.4264831542969},
	{family = "Wasteland", name = "Forgotten Ark", map = "DuskOasis", x = 348.7824401855469, y = 113.22404479980469, z = 302.89239501953125},
	{family = "Wasteland", name = "Forgotten Ark", map = "DuskOasis", x = 351.1968994140625, y = 120.8555679321289, z = 287.78558349609375},
	{family = "Wasteland", name = "Forgotten Ark", map = "DuskOasis", x = 514.4852905273438, y = 115.10224151611328, z = 281.5513916015625},
	{family = "Wasteland", name = "Forgotten Ark", map = "DuskOasis", x = 531.6036376953125, y = 115.95156860351562, z = 282.4554748535156},
	{family = "Wasteland", name = "Forgotten Ark", map = "DuskOasis", x = 522.7727661132812, y = 122.58702087402344, z = 301.07073974609375},
	{family = "Wasteland", name = "Forgotten Ark", map = "DuskOasis", x = 544.7249755859375, y = 120.76127624511719, z = 302.51605224609375},
	{family = "Wasteland", name = "Forgotten Ark", map = "DuskOasis", x = 555.4881591796875, y = 120.62117004394531, z = 331.4057312011719},

	{family = "Wasteland", name = "Graveyard", map = "DuskGraveyard", x = 258.1833801269531, y = 90.86054229736328, z = 68.94708251953125},
	{family = "Wasteland", name = "Graveyard", map = "DuskGraveyard", x = 228.49850463867188, y = 90.00775909423828, z = 45.123809814453125},
	{family = "Wasteland", name = "Graveyard", map = "DuskGraveyard", x = 185.94082641601562, y = 92.9181137084961, z = 83.94757843017578},
	{family = "Wasteland", name = "Graveyard", map = "DuskGraveyard", x = 153.4207305908203, y = 99.3650894165039, z = 52.03959274291992},
	{family = "Wasteland", name = "Graveyard", map = "DuskGraveyard", x = 142.14093017578125, y = 93.77613830566406, z = 47.20830154418945},
	{family = "Wasteland", name = "Graveyard", map = "DuskGraveyard", x = 138.78822326660156, y = 93.76949310302734, z = 35.29425811767578},
	{family = "Wasteland", name = "Graveyard", map = "DuskGraveyard", x = 120.38420104980469, y = 95.22319030761719, z = 40.72797393798828},
	{family = "Wasteland", name = "Graveyard", map = "DuskGraveyard", x = 120.97528076171875, y = 99.36209869384766, z = 67.51303100585938},
	{family = "Wasteland", name = "Graveyard", map = "DuskGraveyard", x = -15.26549243927002, y = 66.78950500488281, z = 64.53081512451172},
	{family = "Wasteland", name = "Graveyard", map = "DuskGraveyard", x = -56.31977844238281, y = 78.47816467285156, z = 92.33842468261719},
	{family = "Wasteland", name = "Graveyard", map = "DuskGraveyard", x = -60.74366760253906, y = 69.96267700195312, z = 48.98817825317383},
	{family = "Wasteland", name = "Graveyard", map = "DuskGraveyard", x = -100.45512390136719, y = 64.45414733886719, z = 85.2697982788086},
	{family = "Wasteland", name = "Graveyard", map = "DuskGraveyard", x = -156.39353942871094, y = 69.28889465332031, z = 71.35746765136719},
	{family = "Wasteland", name = "Graveyard", map = "DuskGraveyard", x = -132.70587158203125, y = 82.4433364868164, z = 44.643314361572266},
	{family = "Wasteland", name = "Graveyard", map = "DuskGraveyard", x = -142.96002197265625, y = 77.76142120361328, z = 7.160616874694824},
	{family = "Wasteland", name = "Graveyard", map = "DuskGraveyard", x = -91.44319915771484, y = 65.42304992675781, z = -12.006403923034668},
	{family = "Wasteland", name = "Graveyard", map = "DuskGraveyard", x = -139.29135131835938, y = 84.40266418457031, z = 15.664560317993164},
	{family = "Wasteland", name = "Graveyard", map = "DuskGraveyard", x = -126.8549575805664, y = 78.89791107177734, z = -8.106765747070312},
	{family = "Wasteland", name = "Graveyard", map = "DuskGraveyard", x = -132.85031127929688, y = 89.11494445800781, z = -8.177999496459961},
	{family = "Wasteland", name = "Graveyard", map = "DuskGraveyard", x = -134.30953979492188, y = 89.48905944824219, z = -0.02497871033847332},
	{family = "Wasteland", name = "Graveyard", map = "DuskGraveyard", x = -211.50611877441406, y = 69.59262084960938, z = 38.853668212890625},
	{family = "Wasteland", name = "Graveyard", map = "DuskGraveyard", x = -222.18638610839844, y = 71.58655548095703, z = 28.150489807128906},
	{family = "Wasteland", name = "Graveyard", map = "DuskGraveyard", x = -222.43450927734375, y = 71.45787811279297, z = 39.390933990478516},
	{family = "Wasteland", name = "Graveyard", map = "DuskGraveyard", x = -44.20441436767578, y = 65.88500213623047, z = 116.20182037353516},
	{family = "Wasteland", name = "Graveyard", map = "DuskGraveyard", x = -75.39410400390625, y = 69.71725463867188, z = 187.81884765625},

	{family = "Wasteland", name = "Crab Fields", map = "Dusk_CrabField", x = 524.532470703125, y = 39.76478958129883, z = -27.544836044311523},
	{family = "Wasteland", name = "Crab Fields", map = "Dusk_CrabField", x = 491.13525390625, y = 4.478700160980225, z = -179.73924255371094},
	{family = "Wasteland", name = "Crab Fields", map = "Dusk_CrabField", x = 476.22161865234375, y = 2.1031339168548584, z = -189.203857421875},
	{family = "Wasteland", name = "Crab Fields", map = "Dusk_CrabField", x = 431.5865478515625, y = 0.45414429903030396, z = -200.56784057617188},
	{family = "Wasteland", name = "Crab Fields", map = "Dusk_CrabField", x = 403.7999572753906, y = 1.1163321733474731, z = -192.0970458984375},
	{family = "Wasteland", name = "Crab Fields", map = "Dusk_CrabField", x = 421.1619567871094, y = 0.4539334177970886, z = -172.36024475097656},
	{family = "Wasteland", name = "Crab Fields", map = "Dusk_CrabField", x = 415.9125061035156, y = 4.039968013763428, z = -132.53079223632812},
	{family = "Wasteland", name = "Crab Fields", map = "Dusk_CrabField", x = 378.1017761230469, y = 0.4540365934371948, z = -159.7882843017578},
	{family = "Wasteland", name = "Crab Fields", map = "Dusk_CrabField", x = 369.67919921875, y = 2.2166800498962402, z = -165.20654296875},
	{family = "Wasteland", name = "Crab Fields", map = "Dusk_CrabField", x = 366.0921630859375, y = 11.080501556396484, z = -167.6825408935547},
	{family = "Wasteland", name = "Crab Fields", map = "Dusk_CrabField", x = 357.4107971191406, y = 7.433723449707031, z = -162.7078857421875},
	{family = "Wasteland", name = "Crab Fields", map = "Dusk_CrabField", x = 431.5472106933594, y = 15.691400527954102, z = -211.6100616455078},
	{family = "Wasteland", name = "Crab Fields", map = "Dusk_CrabField", x = 335.1782531738281, y = 3.657703399658203, z = -292.884765625},
	{family = "Wasteland", name = "Crab Fields", map = "Dusk_CrabField", x = 428.5508117675781, y = 5.803680419921875, z = -269.5837707519531},
	{family = "Wasteland", name = "Crab Fields", map = "Dusk_CrabField", x = 422.8252868652344, y = 7.944647312164307, z = -269.14312744140625},
	{family = "Wasteland", name = "Crab Fields", map = "Dusk_CrabField", x = 425.7615051269531, y = 11.66157054901123, z = -273.9796142578125},
	{family = "Wasteland", name = "Crab Fields", map = "Dusk_CrabField", x = 419.8097229003906, y = 18.238203048706055, z = -290.7201232910156},
	{family = "Wasteland", name = "Crab Fields", map = "Dusk_CrabField", x = 407.1831970214844, y = 29.22856330871582, z = -288.24285888671875},
	{family = "Wasteland", name = "Crab Fields", map = "Dusk_CrabField", x = 404.62835693359375, y = 31.31813621520996, z = -291.6519775390625},
	{family = "Wasteland", name = "Crab Fields", map = "Dusk_CrabField", x = 389.9561767578125, y = 37.47071838378906, z = -331.5985412597656},

	{family = "Wasteland", name = "Battlefield", map = "DuskMid", x = -78.31275939941406, y = 104.72919464111328, z = -49.379302978515625},
	{family = "Wasteland", name = "Battlefield", map = "DuskMid", x = -169.86570739746094, y = 121.74465942382812, z = -186.28558349609375},
	{family = "Wasteland", name = "Battlefield", map = "DuskMid", x = -160.72918701171875, y = 130.67271423339844, z = -205.17340087890625},
	{family = "Wasteland", name = "Battlefield", map = "DuskMid", x = -167.3223876953125, y = 131.07440185546875, z = -213.46340942382812},
	{family = "Wasteland", name = "Battlefield", map = "DuskMid", x = -162.92994689941406, y = 140.8592071533203, z = -212.8483123779297},
	{family = "Wasteland", name = "Battlefield", map = "DuskMid", x = -153.63330078125, y = 119.03047943115234, z = -244.98951721191406},
	{family = "Wasteland", name = "Battlefield", map = "DuskMid", x = -184.23780822753906, y = 102.69404602050781, z = -229.36158752441406},
	{family = "Wasteland", name = "Battlefield", map = "DuskMid", x = -196.8604278564453, y = 100.45066833496094, z = -251.24659729003906},
	{family = "Wasteland", name = "Battlefield", map = "DuskMid", x = -228.756103515625, y = 101.2101821899414, z = -231.05587768554688},
	{family = "Wasteland", name = "Battlefield", map = "DuskMid", x = -234.74697875976562, y = 105.66409301757812, z = -270.385009765625},
	{family = "Wasteland", name = "Battlefield", map = "DuskMid", x = -242.50132751464844, y = 104.33642578125, z = -217.5958251953125},
	{family = "Wasteland", name = "Battlefield", map = "DuskMid", x = -303.0529479980469, y = 97.62831115722656, z = -207.63665771484375},
	{family = "Wasteland", name = "Battlefield", map = "DuskMid", x = -285.0635986328125, y = 96.35269927978516, z = -237.6016082763672},
	{family = "Wasteland", name = "Battlefield", map = "DuskMid", x = -339.3220520019531, y = 85.11296081542969, z = -275.4637145996094},
	{family = "Wasteland", name = "Battlefield", map = "DuskMid", x = -394.9160461425781, y = 86.35295867919922, z = -238.68910217285156},
	{family = "Wasteland", name = "Battlefield", map = "DuskMid", x = -363.287841796875, y = 83.58938598632812, z = -225.5239715576172},
	{family = "Wasteland", name = "Battlefield", map = "DuskMid", x = -368.8595886230469, y = 88.71360778808594, z = -269.4107971191406},
	{family = "Wasteland", name = "Battlefield", map = "DuskMid", x = -400.5589904785156, y = 96.54808044433594, z = -286.314697265625},

	{family = "Wasteland", name = "Temple", map = "DuskEnd", x = -2.220445394515991, y = 208.1399383544922, z = 3.485891580581665},
	{family = "Wasteland", name = "Temple", map = "DuskEnd", x = -4.854544162750244, y = 208.32373046875, z = -0.1272975504398346},
	{family = "Wasteland", name = "Temple", map = "DuskEnd", x = -1.9476174116134644, y = 208.1549072265625, z = -3.3306093215942383},
	{family = "Wasteland", name = "Temple", map = "DuskEnd", x = 1.9105192422866821, y = 207.26780700683594, z = 0.03473372757434845},
	
	{family = "Vault", name = "Vault Ground", map = "Night", x = -134.075439453125, y = 37.46929931640625, z = 28.402774810791016},
	{family = "Vault", name = "Vault Ground", map = "Night", x = -118.6305160522461, y = 42.42642593383789, z = 34.448692321777344},
	{family = "Vault", name = "Vault Ground", map = "Night", x = -137.3733673095703, y = 47.234378814697266, z = 31.76923179626465},
	{family = "Vault", name = "Vault Ground", map = "Night", x = -126.22998046875, y = 47.246559143066406, z = 39.05012512207031},
	{family = "Vault", name = "Vault Ground", map = "Night", x = -70.82231140136719, y = 37.844383239746094, z = 7.070809841156006},
	{family = "Vault", name = "Vault Ground", map = "Night", x = -31.71173095703125, y = 40.47944641113281, z = -5.682848930358887},
	{family = "Vault", name = "Vault Ground", map = "Night", x = -13.598572731018066, y = 41.34499740600586, z = -60.00640869140625},
	{family = "Vault", name = "Vault Ground", map = "Night", x = 22.93090057373047, y = 41.206024169921875, z = -60.742610931396484},
	{family = "Vault", name = "Vault Ground", map = "Night", x = -3.47489595413208, y = 41.940731048583984, z = -21.440410614013672},
	{family = "Vault", name = "Vault Ground", map = "Night", x = 4.695695400238037, y = 41.04863357543945, z = 0.19423307478427887},
	{family = "Vault", name = "Vault Ground", map = "Night", x = 24.967985153198242, y = 41.03139877319336, z = -1.3082224130630493},
	{family = "Vault", name = "Vault Ground", map = "Night", x = 15.579259872436523, y = 80.82284545898438, z = 17.457504272460938},
	{family = "Vault", name = "Vault Ground", map = "Night", x = 6.433625221252441, y = 79.37369537353516, z = 20.778390884399414},
	{family = "Vault", name = "Vault Ground", map = "Night", x = -15.679271697998047, y = 81.13579559326172, z = 13.050874710083008},
	{family = "Vault", name = "Vault Ground", map = "Night", x = -6.987619400024414, y = 79.14839172363281, z = -21.992259979248047},
	{family = "Vault", name = "Vault Ground", map = "Night", x = 23.654544830322266, y = 82.80712890625, z = 12.961945533752441},
	{family = "Vault", name = "Vault Ground", map = "Night", x = 41.82626724243164, y = 83.03620147705078, z = 29.75025749206543},
	{family = "Vault", name = "Vault Ground", map = "Night", x = -30.098909378051758, y = 147.3979034423828, z = -3.1456298828125},
	{family = "Vault", name = "Vault Ground", map = "Night", x = -38.67737579345703, y = 152.4818878173828, z = 6.9284348487854},
	{family = "Vault", name = "Vault Ground", map = "Night", x = -40.78123092651367, y = 160.52078247070312, z = 35.72954559326172},

	{family = "Vault", name = "Vault Up", map = "Night2", x = 9.58574104309082, y = 129.72470092773438, z = -38.672088623046875},
	{family = "Vault", name = "Vault Up", map = "Night2", x = 11.307178497314453, y = 140.42730712890625, z = -43.99329376220703},
	{family = "Vault", name = "Vault Up", map = "Night2", x = 9.111871719360352, y = 141.00906372070312, z = -38.939552307128906},
	{family = "Vault", name = "Vault Up", map = "Night2", x = -38.14081573486328, y = 133.2059326171875, z = -7.77768087387085},
	{family = "Vault", name = "Vault Up", map = "Night2", x = 34.47630310058594, y = 148.62522888183594, z = 24.622987747192383},
	{family = "Vault", name = "Vault Up", map = "Night2", x = 38.73667526245117, y = 160.6851043701172, z = 62.37394332885742},
	{family = "Vault", name = "Vault Up", map = "Night2", x = 41.89906692504883, y = 183.46739196777344, z = 12.368882179260254},
	{family = "Vault", name = "Vault Up", map = "Night2", x = 41.22148513793945, y = 182.97047424316406, z = 8.59897518157959},
	{family = "Vault", name = "Vault Up", map = "Night2", x = -49.02892303466797, y = 164.36578369140625, z = -16.799209594726562},
	{family = "Vault", name = "Vault Up", map = "Night2", x = -46.85221862792969, y = 138.5467071533203, z = -21.154922485351562},
	{family = "Vault", name = "Vault Up", map = "Night2", x = -39.184967041015625, y = 165.98153686523438, z = -68.50675201416016},
	{family = "Vault", name = "Vault Up", map = "Night2", x = 9.006032943725586, y = 228.8902587890625, z = 47.58198928833008},
	{family = "Vault", name = "Vault Up", map = "Night2", x = 6.6142802238464355, y = 295.6392517089844, z = -2.9403226375579834},
	{family = "Vault", name = "Vault Up", map = "Night2", x = -0.7547726035118103, y = 294.5213623046875, z = -5.132498264312744},
	{family = "Vault", name = "Vault Up", map = "Night2", x = 2.281322479248047, y = 294.98858642578125, z = 3.7177040576934814},
	{family = "Vault", name = "Vault Up", map = "Night2", x = 48.79713821411133, y = 302.80706787109375, z = 6.795226097106934},
	{family = "Vault", name = "Vault Up", map = "Night2", x = 51.404720306396484, y = 303.9056396484375, z = 9.27448558807373},
	{family = "Vault", name = "Vault Up", map = "Night2", x = 56.64899826049805, y = 306.56988525390625, z = 9.869074821472168},
	{family = "Vault", name = "Vault Up", map = "Night2", x = 58.88494110107422, y = 304.5482177734375, z = -1.9136220216751099},
	{family = "Vault", name = "Vault Up", map = "Night2", x = 58.594398498535156, y = 307.5799560546875, z = -10.880306243896484},
	{family = "Vault", name = "Vault Up", map = "Night2", x = 72.57139587402344, y = 309.8422546386719, z = -0.0163829755038023},
	{family = "Vault", name = "Vault Up", map = "Night2", x = 62.3614616394043, y = 309.8174743652344, z = -1.4035937786102295},

	{family = "Vault", name = "Vault Archive", map = "NightArchive", x = 25.960012, y = 541.458923, z = 49.532020},
	{family = "Vault", name = "Vault Archive", map = "NightArchive", x = -17.483531, y = 565.071044, z = 72.817947},
	{family = "Vault", name = "Vault Archive", map = "NightArchive", x = -31.642618, y = 565.072998, z = 72.946655},
	{family = "Vault", name = "Vault Archive", map = "NightArchive", x = -37.640979, y = 551.313110, z = 61.820144},
	{family = "Vault", name = "Vault Archive", map = "NightArchive", x = -13.328448, y = 551.813232, z = 75.945159},
	{family = "Vault", name = "Vault Archive", map = "NightArchive", x = -18.539285, y = 551.813232, z = 56.910717},
	{family = "Vault", name = "Vault Archive", map = "NightArchive", x = -41.341411, y = 543.448059, z = 61.431583},
	{family = "Vault", name = "Vault Archive", map = "NightArchive", x = -41.333190, y = 543.448486, z = 54.674259},
	{family = "Vault", name = "Vault Archive", map = "NightArchive", x = -31.593242, y = 554.311462, z = 85.431785},
	{family = "Vault", name = "Vault Archive", map = "NightArchive", x = -31.494831, y = 554.308959, z = 78.748741},
	{family = "Vault", name = "Vault Archive", map = "NightArchive", x = -13.159896, y = 541.464477, z = 40.102184},

	{family = "Vault", name = "Vault Little Prince", map = "NightDesert", x = 75.715270, y = 82.9776, z = 100.838020, e = true}, --Empty
	{family = "Vault", name = "Vault Little Prince", map = "NightDesert", x = 75.715270, y = 76.9776, z = 100.838020},
	{family = "Vault", name = "Vault Little Prince", map = "NightDesert", x = 87.011039, y = 76.013977, z = 89.952133},
	{family = "Vault", name = "Vault Little Prince", map = "NightDesert", x = 66.691436, y = 72.158546, z = 63.658821},
	{family = "Vault", name = "Vault Little Prince", map = "NightDesert", x = 158.014846, y = 77.405067, z = 335.245422},
	{family = "Vault", name = "Vault Little Prince", map = "NightDesert", x = 164.866561, y = 77.405334, z = 352.186462},
	{family = "Vault", name = "Vault Little Prince", map = "NightDesert", x = 183.502655, y = 77.405265, z = 343.524108},
	{family = "Vault", name = "Vault Little Prince", map = "NightDesert", x = 573.401184, y = 17.064425, z = 165.830093, e = true}, --Empty
	{family = "Vault", name = "Vault Little Prince", map = "NightDesert", x = 573.401184, y = 11.064425, z = 165.830093},
	{family = "Vault", name = "Vault Little Prince", map = "NightDesert", x = 766.331481, y = 90.628509, z = 402.817291},
	{family = "Vault", name = "Vault Little Prince", map = "NightDesert", x = 778.703063, y = 91.167816, z = 415.422760},
	{family = "Vault", name = "Vault Little Prince", map = "NightDesert", x = 792.881042, y = 90.695831, z = 399.077636},
	{family = "Vault", name = "Vault Little Prince", map = "NightDesert", x = 1041.245239, y = 134.933639, z = 392.586730},
	{family = "Vault", name = "Vault Little Prince", map = "NightDesert", x = 1026.362060, y = 150.298233, z = 395.193969},
	{family = "Vault", name = "Vault Little Prince", map = "NightDesert", x = 1025.338745, y = 150.523941, z = 412.695526},
	{family = "Vault", name = "Vault Little Prince", map = "NightDesert", x = 535.000000, y = 8.000000, z = 450.000000}, --Shipwreck area
	{family = "Vault", name = "Vault Little Prince", map = "NightDesert", x = 618.537414, y = 1.227436, z = 600.079589},
	{family = "Vault", name = "Vault Little Prince", map = "NightDesert", x = 605.406005, y = 0.353380, z = 609.522338},
	{family = "Vault", name = "Vault Little Prince", map = "NightDesert", x = 580.832763, y = 4.860373, z = 621.304016},
	{family = "Vault", name = "Vault Little Prince", map = "NightDesert", x = 565.524414, y = 13.000000, z = 440.000000}, --Main Area
	{family = "Vault", name = "Vault Little Prince", map = "NightDesert", x = 377.820281, y = 30.000000, z = -82.598495}, -- Bottle Area
	{family = "Vault", name = "Vault Little Prince", map = "NightDesert", x = 384.046325, y = 20.765531, z = -111.498588},
	{family = "Vault", name = "Vault Little Prince", map = "NightDesert", x = 374.793304, y = 20.723329, z = -128.186889},
	{family = "Vault", name = "Vault Little Prince", map = "NightDesert", x = 370.226623, y = 24.600784, z = -143.685974},
	
	{family = "Eden", name = "Eden end", map = "StormEnd", x = 53.204410552978516, y = 84.78599548339844, z = 17.23462677001953},
	{family = "Eden", name = "Eden end", map = "StormEnd", x = 50.02665710449219, y = 84.78593444824219, z = 11.145492553710938},
	{family = "Eden", name = "Eden end", map = "StormEnd", x = 44.71040725708008, y = 84.7859878540039, z = 14.593348503112793},
	{family = "Eden", name = "Eden end", map = "StormEnd", x = 37.7985725402832, y = 85.3626937866211, z = -4.6528191566467285},
	{family = "Eden", name = "Eden end", map = "StormEnd", x = 31.782636642456055, y = 84.79595184326172, z = 0.5173283219337463},
	{family = "Eden", name = "Eden end", map = "StormEnd", x = 23.912830352783203, y = 85.01395416259766, z = 0.8463520407676697},
	{family = "Eden", name = "Eden end", map = "StormEnd", x = 28.185596466064453, y = 84.78589630126953, z = -0.9399160146713257},
	{family = "Eden", name = "Eden end", map = "StormEnd", x = 39.509857177734375, y = 84.78904724121094, z = 9.551600456237793},
	{family = "Eden", name = "Eden end", map = "StormEnd", x = 34.96644592285156, y = 85.07381439208984, z = 9.858254432678223},
	{family = "Eden", name = "Eden end", map = "StormEnd", x = 21.372793197631836, y = 85.2208480834961, z = 12.78787612915039},
	{family = "Eden", name = "Eden end", map = "StormEnd", x = 19.997421264648438, y = 88.0382308959961, z = 17.60322380065918},
	{family = "Eden", name = "Eden end", map = "StormEnd", x = 20.127546310424805, y = 84.78563690185547, z = 3.75508975982666},
	{family = "Eden", name = "Eden end", map = "StormEnd", x = 4.73272705078125, y = 86.13802337646484, z = 6.572436332702637},
	{family = "Eden", name = "Eden end", map = "StormEnd", x = 16.157649993896484, y = 84.78594207763672, z = 3.485069513320923},
	{family = "Eden", name = "Eden end", map = "StormEnd", x = 23.90901756286621, y = 84.80104064941406, z = -9.145329475402832},
	{family = "Eden", name = "Eden end", map = "StormEnd", x = 10.7672758102417, y = 84.78585052490234, z = -18.12892723083496},
	{family = "Eden", name = "Eden end", map = "StormEnd", x = 7.658942222595215, y = 84.9233169555664, z = -6.4940080642700195},
	{family = "Eden", name = "Eden end", map = "StormEnd", x = 1.3337842226028442, y = 84.79669952392578, z = -17.997352600097656},
	{family = "Eden", name = "Eden end", map = "StormEnd", x = -0.44181227684020996, y = 84.88677215576172, z = -8.160124778747559},
	{family = "Eden", name = "Eden end", map = "StormEnd", x = -14.467450141906738, y = 84.78587341308594, z = -19.959054946899414},
	{family = "Eden", name = "Eden end", map = "StormEnd", x = -16.315353393554688, y = 84.78588104248047, z = 10.816583633422852},
	{family = "Eden", name = "Eden end", map = "StormEnd", x = -37.350868225097656, y = 84.79844665527344, z = -23.60012435913086},
	{family = "Eden", name = "Eden end", map = "StormEnd", x = -123.92622375488281, y = 84.78559875488281, z = -5.083223819732666},
	{family = "Eden", name = "Eden end", map = "StormEnd", x = -24.512475967407227, y = 84.90830993652344, z = -1.4799580574035645},
	{family = "Eden", name = "Eden end", map = "StormEnd", x = -24.733224868774414, y = 84.78577423095703, z = 4.695215702056885},
	{family = "Eden", name = "Eden end", map = "StormEnd", x = -13.599913597106934, y = 84.81719207763672, z = -7.780288219451904},
	{family = "Eden", name = "Eden end", map = "StormEnd", x = -32.738372802734375, y = 84.87251281738281, z = -1.8664618730545044},
	{family = "Eden", name = "Eden end", map = "StormEnd", x = -39.80677032470703, y = 84.91381072998047, z = -4.91522216796875},
	{family = "Eden", name = "Eden end", map = "StormEnd", x = -57.71354675292969, y = 84.78463745117188, z = -11.773419380187988},
	{family = "Eden", name = "Eden end", map = "StormEnd", x = -48.6328010559082, y = 84.96031951904297, z = 5.408512115478516},
	{family = "Eden", name = "Eden end", map = "StormEnd", x = -53.627655029296875, y = 84.78470611572266, z = 14.684122085571289},
	{family = "Eden", name = "Eden end", map = "StormEnd", x = -51.201744079589844, y = 85.0064468383789, z = 5.10370397567749},
	{family = "Eden", name = "Eden end", map = "StormEnd", x = -51.958473205566406, y = 84.78582000732422, z = 14.422720909118652},
	{family = "Eden", name = "Eden end", map = "StormEnd", x = -75.20938110351562, y = 84.78557586669922, z = -13.343505859375},
	{family = "Eden", name = "Eden end", map = "StormEnd", x = -91.41427612304688, y = 84.7857666015625, z = 8.289732933044434},
	{family = "Eden", name = "Eden end", map = "StormEnd", x = -73.9185791015625, y = 84.78604125976562, z = -11.995323181152344},
	{family = "Eden", name = "Eden end", map = "StormEnd", x = -89.68831634521484, y = 85.03477478027344, z = 18.943445205688477},
	{family = "Eden", name = "Eden end", map = "StormEnd", x = -103.52940368652344, y = 84.91454315185547, z = 0.9145287871360779},
	{family = "Eden", name = "Eden end", map = "StormEnd", x = -93.05667877197266, y = 85.4105453491211, z = 18.612539291381836},
	{family = "Eden", name = "Eden end", map = "StormEnd", x = -108.16927337646484, y = 84.88326263427734, z = 12.479379653930664},
	{family = "Eden", name = "Eden end", map = "StormEnd", x = -118.77452087402344, y = 84.83175659179688, z = 2.724475383758545},
	{family = "Eden", name = "Eden end", map = "StormEnd", x = -133.18084716796875, y = 84.86527252197266, z = 2.522139549255371},
	{family = "Eden", name = "Eden end", map = "StormEnd", x = -119.86038970947266, y = 84.84640502929688, z = 4.242026329040527},
	{family = "Eden", name = "Eden end", map = "StormEnd", x = -124.64884948730469, y = 84.7857894897461, z = -5.185454368591309},
	{family = "Eden", name = "Eden end", map = "StormEnd", x = -139.52325439453125, y = 84.90996551513672, z = -1.6170068979263306},
	{family = "Eden", name = "Eden end", map = "StormEnd", x = -143.27102661132812, y = 84.91304016113281, z = 1.2533143758773804},
	{family = "Eden", name = "Eden end", map = "StormEnd", x = -153.06153869628906, y = 84.78630065917969, z = 16.040542602539062},
	{family = "Eden", name = "Eden end", map = "StormEnd", x = -155.08258056640625, y = 84.97103881835938, z = 11.157023429870605},
	{family = "Eden", name = "Eden end", map = "StormEnd", x = -161.3558349609375, y = 84.92860412597656, z = 8.64370346069336},
	{family = "Eden", name = "Eden end", map = "StormEnd", x = -166.3325653076172, y = 84.84674072265625, z = 6.103775501251221},
	{family = "Eden", name = "Eden end", map = "StormEnd", x = -174.11376953125, y = 84.92845153808594, z = -0.27479439973831177},
	{family = "Eden", name = "Eden end", map = "StormEnd", x = -176.21092224121094, y = 84.87238311767578, z = 8.17367172241211},
	{family = "Eden", name = "Eden end", map = "StormEnd", x = -181.91143798828125, y = 84.9165267944336, z = 6.002501010894775},
	{family = "Eden", name = "Eden end", map = "StormEnd", x = -186.85833740234375, y = 84.78038787841797, z = 10.840603828430176},
	{family = "Eden", name = "Eden end", map = "StormEnd", x = -188.32261657714844, y = 84.8633804321289, z = 5.5081706047058105},
	{family = "Eden", name = "Eden end", map = "StormEnd", x = -190.3481903076172, y = 84.85118103027344, z = -0.0867968276143074},
	{family = "Eden", name = "Eden end", map = "StormEnd", x = -204.08639526367188, y = 84.80803680419922, z = -0.9210448861122131},
	{family = "Eden", name = "Eden end", map = "StormEnd", x = -207.1717987060547, y = 84.78434753417969, z = 3.1143295764923096},
	{family = "Eden", name = "Eden end", map = "StormEnd", x = -210.59738159179688, y = 85.00997161865234, z = -3.093863010406494},
	{family = "Eden", name = "Eden end", map = "StormEnd", x = -222.5833282470703, y = 87.05531311035156, z = 5.414306640625},
	{family = "Eden", name = "Eden end", map = "StormEnd", x = -245.13278198242188, y = 84.19072723388672, z = 8.608859062194824},
	{family = "Eden", name = "Eden end", map = "StormEnd", x = -251.00637817382812, y = 84.19070434570312, z = -0.20921848714351654},
	{family = "Eden", name = "Eden end", map = "StormEnd", x = -271.03424072265625, y = 84.19066619873047, z = 8.923401832580566},
}

posits = {
	{map='CandleSpace',name='BLACKOUT',x=800,y=0.6,z=0},
	{map='Night_Shelter',name='EXIT',x=51.9,y=28.5,z=-1.2},
	{map='CandleSpace',name='Spawn',x=1.3682793378829956,y=1.1504778861999512,z=-0.7198812365531921},
	{map='Dawn',name='Daylight Prairie',x=478.00915523455,y=209.99610900806,z=-1029.204115625},
	{map='Dawn',name='Rainbow',x=301.889892578125,y=413.0315246582031,z=-301.21563720703125},
	{map='Dawn',name='Cloudy',x=402.95318603515625,y=115.7956314086914,z=-10.648039817810059},
	{map='Dawn',name='Isle Elder room',x=117.75272369384766,y=1.006047010421753,z=-1733.9976806640625},
	{map='Dawn',name='Prophecy Cave',x=211.96453857421875,y=4.274348258972168,z=-63.84076690673828},
	{map='Dawn',name='Temple',x=150.16748046875,y=102.43803405761719,z=-244.5251007080078},
	{map='Dawn',name='Misterius point',x=-0.2243,y=1.0178,z=0.0087},
	{map='DawnCave',name='Wind Pathes',x=-172.1148529044,y=352.74264526719,z=-375.6912841875},
	{map='DawnCave',name='Water Trial',x=-90.0,y=245.0,z=-305.0},
	{map='DawnCave',name='Earth Trial',x=-28.13365936279297,y=253.9242401123047,z=-372.3354797363281},
	{map='DawnCave',name='Air Trial',x=21.34743881225586,y=259.1813049316406,z=-346.86083984375},
	{map='DawnCave',name='Fire Trial',x=57.113975524902344,y=251.7130889892578,z=-326.27691650390625},
	{map='DawnCave',name='Dark room',x=-10.73032855488,y=213.64297485362,z=-192.0013731562},
	{map='Prairie_ButterflyFields',name='Skip first',x=93.07067108154297,y=150.75,z=-5.158041477203369},
	{map='Prairie_Village',name='Cave',x=157.04954528808594,y=199.9058837890625,z=225.65309143066406},
	{map='Prairie_Village',name='invisible thing',x=96.71356964111328,y=175.35667419433594,z=265.9364929199219},
	{map='Prairie_Village',name='8 Player Door',x=-48.69554138183594,y=182.15054321289062,z=324.2794189453125},
	{map='Prairie_Village',name='Temple',x=126.16890716552734,y=254.21255493164062,z=478.1236572265625},
	{map='Prairie_Cave',name='Prairie Butterfly Field',x=192.0,y=171.0,z=12.0},
	{map='Prairie_Cave',name='Prairie Village',x=243.0,y=198.0,z=226.0},
	{map='Prairie_Cave',name='paintingoob',x=280.9242858886719,y=166.0093231201172,z=191.56130981445312},
	{map='Prairie_Cave',name='castle_oob',x=133.543701171875,y=308.047607421875,z=494.5435791015625},
	{map='Prairie_Cave',name='Prairie soar high OOB',x=314.2340393066406,y=235.1671600341797,z=162.43087768554688},
	{map='Prairie_Cave',name='Floating Columns',x=280.13323974375,y=191.76315307688,z=-90.30506134203}, 
	{map='DayEnd',name='Forest',x=-128.55003356933594,y=106.04075622558594,z=41.26801681518555},
	{map='DayEnd',name='Elder Room',x=-529.508544921875,y=8.83392333984375,z=-213.78453063964844},
	{map='DayHubCave',name='Chess mate',x=-40.2,y=34.3,z=17.0},
	{map='DayHubCave',name='Exit',x=30.72627067565918,y=42.47455596923828,z=0.237472802400589},
    {map='Prairie_Island',name='Wind Paths',x=433.14529418531,y=270.46878051781,z=549.35540771438},
	{map='Prairie_Island',name='Bird Nest',x=272.2238464355469,y=175.1832275390625,z=-26.06362915390625},
	{map='Prairie_Island',name='First air flower',x=244.09881591796875,y=95.16970825195312,z=221.4185791015625},
	{map='Prairie_Island',name='Waterfall',x=494.17425537109375,y=321.3855285644531,z=393.63873291015625},
	{map='Prairie_Island',name='Top of center',x=57.3979606628418,y=102.27421569824219,z=300.8200378417969},
	{map='Prairie_Island',name='Big flower',x=90.91666412353516,y=2.906703472137451,z=293.2203063964844},
	{map='Prairie_Island',name='Roshi island',x=-128.4817657003,y=0.8849521875347,z=220.95448303256},
	{map='Rain',name='Wind Pathes',x=-54.33468246461,y=275.85449218775,z=-658.8024902375},
	{map='Rain',name='Social Area',x=139.7912139892578,y=216.697265625,z=-621.1143188476562},
	{map='Rain',name='To Rainforest',x=28.0,y=101.0,z=-115.0},
	{map='Rain',name='Mini Treehouse',x=57.644893646240234,y=107.6270751953125,z=-140.5428009033203},
	{map='Rain',name='Forest basecamp start',x=-12.0,y=152.0,z=-478.0},
	{map='RainForest',name='Back to rain',x=21.0,y=101.0,z=-135.0},
	{map='RainForest',name='Sunny Forest',x=6.1400275230407715,y=111.99101257324219,z=-61.309600830078125},
	{map='RainForest',name='Mini Treehouse',x=58.60780334472656,y=115.9687271118164,z=-101.88823699951172},
	{map='RainForest',name='Forest basecamp',x=54.0,y=114.0,z=-114.0},
	{map='RainForest',name='To Rain mid',x=64.0,y=106.0,z=57.0},
	{map='RainForest',name='esratescan',x=136.1,y=96.2,z=0.11},
	{map='RainShelter',name='To Cave',x=54.64596939086914,y=68.41414642333984,z=43.7832145690918},
	{map='RainShelter',name='To Temple',x=15.340384483337402,y=88.6324691772461,z=119.18212890625},
	{map='RainShelter',name='Forest pit OOB',x=-32.04302215576172,y=206.95440673828125,z=0.1170167475938797},
	{map='Rain_Cave',name='Little Prince',x=-344.8593678775,y=-0.097037477112,z=-197.4244384725}, 
	{map='Rain_Cave',name='Exit',x=-65.55963134765625,y=210.6380157470703,z=-285.0746154785156},
	{map='RainMid',name='Exit',x=-17.595956802368164,y=182.86737060546875,z=400.8680114746094},
	{map='RainEnd',name='Elders Room',x=2.448410749435425,y=8.948872566223145,z=503.58135986328125},
	{map='RainEnd',name='Esra place to love',x=10.8,y=206.0,z=58.2},
	{map='Sunset',name='Skip',x=181.40216064453125,y=49.21394348144531,z=-512.7560424804688},
	{map='Sunset',name='To First Race',x=202.9875030517578,y=56.84459686279297,z=-593.9754638671875},
	{map='Sunset',name='To Second Race',x=282.1065673828125,y=39.942588806152344,z=-527.995065460546875},
	{map='Sunset_Citadel',name='Candle run first',x=115.18697357177734,y=477.2147521972656,z=15.642013549804688},
	{map='Sunset_Citadel',name='Exit',x=199.33934020996094,y=491.9642028808594,z=-195.2884063720703},
	{map='Sunset_FlyRace',name='Skip',x=124.05903625488281,y=1045.8760986328125,z=-78.43795013427734},
	{map='Sunset_FlyRace',name='Cloud OOB',x=-812.950927734375,y=1545.5372314453125,z=-505.4371643066406},
	{map='Sunset_FlyRace',name='Valley castle OOB',x=-478.83294677734375,y=1573.1116943359375,z=76.33606719970703},
	{map='SunsetRace',name='Skip',x=236.2896728515625,y=599.3069458007812,z=-526.8030395507812},
	{map='SunsetEnd',name='Skip',x=42.99704360961914,y=166.48251342773438,z=0.7978107333183289},
	{map='SunsetColosseum',name='Dream',x=136.38674927812,y=154.63574218875,z=-168.8068237305},
	{map='SunsetColosseum',name='End',x=62.833187103271484,y=145.87591552734375,z=-293.7547607421875},
	{map='SunsetEnd2',name='OOB Castle',x=308.30621337890625,y=148.89456176757812,z=-775.3768920898438},
	{map='SunsetVillage',name='Skip',x=-110.77000427246094,y=205.6576385498047,z=487.48956298828125},
	{map='Sunset_Theater',name='The penguin',x=-18.39187434492,y=105.23886108438,z=-121.9267851562},
	{map='SunsetVillage',name='OOB Trumpets',x=-65.07833099365234,y=128.78334045410156,z=-33.79042434692383},
	{map='Dusk',name='To Boat',x=150.89471435546875,y=1.2322540283203125,z=46.65181350708008},
	{map='Dusk',name='To Graveyard',x=-90.4443359375,y=12.013911247253418,z=158.87918090820312},
	{map='DuskGraveyard',name='To Battlefield',x=33.067073822021484,y=82.51902770996094,z=-240.50013732910156},
	{map='DuskGraveyard',name='To Crabfield',x=135.5191192626953,y=97.7408447265625,z=16.016836166381836},
	{map='DuskMid',name='To End',x=-284.5697326660156,y=92.47919464111328,z=-400.2809753417969},
	{map='DuskMid',name='To Shipwreck',x=54.159915924072266,y=111.84867095947266,z=-264.114990234375},
	{map='DuskEnd',name='Elders Room',x=-417.28424072265625,y=12.288487434387207,z=410.8535461425781},
	{map='Dusk_CrabField',name='To Battlefield',x=-338.3324279785156,y=36.55388641357422,z=387.93304443359375},
	{map='Dusk_CrabField',name='Wasteland Moon OOB',x=-338.6526184082031,y=185.0042266845703,z=400.361328125},
	{map='DuskOasis',name='Wind Pathes',x=-89.03162384203,y=142.94610595125,z=429.15158081469},
	{map='DuskOasis',name='Skip',x=141.16297912597656,y=120.97766876220703,z=351.2036437988281},
	{map='DuskOasis',name='Exit Ship',x=-47.61760330200195,y=141.75379943847656,z=170.869873046875},
	{map='TGCOffice',name='Vault Office Space',x=7009.4736328125,y=6921.181640625,z=9078.2421875},
	{map='Night',name='To Archive',x=-35.5402946472168,y=34.19679641723633,z=-97.76521301269531},
	{map='Night',name='To Desert',x=42.82196807861328,y=36.75535583496094,z=-81.42263793945312},
	{map='Night',name='2nd Floor',x=11.553918838500977,y=80.62894439697266,z=14.284697532653809},
	{map='Night',name='3rd Floor',x=27.935970306396484,y=153.792236328125,z=-39.151798248291016},
	{map='NightEnd',name='Thunder',x=31.983366012573242,y=347.39166259765625,z=41.15662384033203},
	{map='NightEnd',name='Elders Vault',x=-0.8692829012870789,y=195.21739196777344,z=6.841609001159668},
	{map='NightEnd',name='Full Moon Vault',x=67.19486236572266,y=240.53509521484375,z=-187.52154541015625},
	{map='NightArchive',name='Back to First Library',x=40.553749084472656,y=544.6246337890625,z=-25.288280487060547},
	{map='NightDesert',name='To Jellyfield',x=399.72943115234375,y=4.236130237579346,z=540.1605834960938},
	{map='NightDesert',name='To Vault of Knowledge',x=29.91564706713867,y=17.69660758972168,z=176.67739868164062},
	{map='NightDesert',name='To Jar',x=-76.51543426513672,y=28.447778701782227,z=372.2406921386719},
	{map='NightDesert',name='OOB Golden Skykids',x=-797.5425415039062,y=156.2596435546875,z=916.4702758789062},
	{map='NightDesert',name='Misterius star',x=551.66864013688,y=407.59988403331,z=336.75701906875},
	{map='NightDesert_Beach',name='Back to desert',x=464.6367492675781,y=8.204781532287598,z=552.7400512695312},
	{map='Night_JarCave',name='Back',x=-81.74847412109375,y=28.22599983215332,z=373.6864013671875},
	{map='Night2',name='Top',x=-0.18086150288581848,y=294.4930419921875,z=0.7263343930244446},
	{map='Storm',name='Skip',x=7,y=266,z=-250},
	{map='Storm',name='End of Cave',x=61.72602462768555,y=272.8486022949219,z=-332.78521728515625},
	{map='Storm',name='OOB Transparent',x=192,y=8,z=-489},
	{map='StormStart',name='Skip',x=-2,y=196,z=-19},
	{map='StormEnd',name='White Child',x=803.8466796875,y=0.6778343915939331,z=-11.73253059387207},
	{map='OrbitMid',name='Skip',x=923.1694946289062,y=2764.83251953125,z=146.8410186767578},
	{map='OrbitMid',name='Stones OOB',x=184.6337890625,y=1345.392333984375,z=-831.4788818359375},
	{map='OrbitEnd',name='Skip',x=-42.1104621887207,y=2465.890380859375,z=2261.208251953125},
	{map='CandleSpaceEnd',name='end',x=0.6592245101928711,y=0.5781212449073792,z=232.74395751953125},
	{map='DawnCave',name='exit_cave',x=-25.61272430419922,y=192.8677520751953,z=-38.68637466430664},
	{map='Dawn_TrialsWater',name='Start',x=-0.11249076575040817,y=66.35979461669922,z=13.503379821777344},
	{map='Dawn_TrialsWater',name='Trial Meditation',x=43.719730377197266,y=67.64400482177734,z=-272.9099426269531},
	{map='Dawn_TrialsWater',name='End',x=0.060450248420238495,y=78.57532501220703,z=-411.5926513671875},
	{map='Dawn_TrialsEarth',name='Start',x=96.24566650390625,y=127.13948822021484,z=10.877419471740723},
	{map='Dawn_TrialsEarth',name='Trial Meditation',x=1.2450224161148071,y=127.96000671386719,z=15.725500106811523},
	{map='Dawn_TrialsEarth',name='End',x=-13.79636001586914,y=133.65394592285156,z=3.316030740737915},
	{map='Dawn_TrialsAir',name='Start',x=-1.648727297782898,y=30.203773498535156,z=-38.58304214477539},
	{map='Dawn_TrialsAir',name='Trial Meditation',x=-27.569198608398438,y=90.28909301757812,z=-130.7397003173828},
	{map='Dawn_TrialsAir',name='End',x=-11.577858924865723,y=105.93589782714844,z=-130.6845703125},
	{map='Dawn_TrialsFire',name='Start',x=-41.554508209228516,y=46.78275680541992,z=-22.998823165893555},
	{map='Dawn_TrialsFire',name='Trial Meditation',x=-12.22600269317627,y=50.001827239990234,z=-257.0751953125},
	{map='Dawn_TrialsFire',name='End',x=-11.194707870483398,y=50.01749038696289,z=-307.281982421875},
	{map='Prairie_ButterflyFields',name='Isle of Dawn',x=119.0,y=201.0,z=-458.0},
	{map='Prairie_ButterflyFields',name='Social Area',x=116.6399917602539,y=196.85479736328125,z=-434.001220703125},
	{map='Prairie_ButterflyFields',name='Prairie Cave',x=206.80516052246094,y=171.53472900390625,z=18.65180778503418},
	{map='Prairie_ButterflyFields',name='Prairie Birds Nest',x=-16.0,y=169.0,z=-6.0},
	{map='Prairie_ButterflyFields',name='Prairie Village',x=77.0,y=161.0,z=66.0},
	{map='Prairie_Village',name='Prairie Butterfly field',x=30.0,y=192.0,z=183.0},
	{map='Prairie_Village',name='Prairie Cave',x=162.0,y=200.0,z=222.0},
	{map='Prairie_Village',name='Prairie Birds Nest',x=-67.0,y=202.0,z=206.0},
	{map='DayEnd',name='Prairie Village',x=-62.0,y=85.0,z=41.0},
	{map='Prairie_NestAndKeeper',name='Prairie Village',x=-109.54730224609375,y=184.3603515625,z=168.52159118652344},
	{map='DayEnd',name='Hidden Forest',x=-126.30734252929688,y=105.23834991455078,z=41.5018310546875},
	{map='Prairie_NestAndKeeper',name='Prairie Butterfly field',x=-49.0,y=163.0,z=37.0},
	{map='Prairie_NestAndKeeper',name='Sanctuary Islands',x=-358.0,y=127.0,z=109.0},
	{map='Prairie_Island',name='Dirty Water',x=142.66439819335938,y=2.3796894550323486,z=417.6568603515625},
	{map='Prairie_Island',name='Bell Shrine',x=24.223779678344727,y=55.22944259643555,z=335.5910339355469},
	{map='Prairie_Island',name='Mother Whale',x=407.8931579589844,y=-0.0814097449183464,z=514.7636108398438},
	{map='Rain',name='Skip to mid area',x=17.024648666381836,y=92.79985046386719,z=-225.68663024902344},
	{map='Rain_BaseCamp',name='Shared space',x=19.623136520385742,y=145.4346466064453,z=15.800447463989258},
	{map='Rain_BaseCamp',name='To first rain',x=21.0,y=150.0,z=152.0},
	{map='Rain_BaseCamp',name='To middle of first rain',x=-16.0,y=143.0,z=82.0},
	{map='Rain_BaseCamp',name='To Rainforest basecamp',x=-20.0,y=136.0,z=64.0},
	{map='Rain_BaseCamp',name='To mid forest',x=-40.0,y=148.0,z=58.0},
	{map='RainShelter',name='To Rainforest',x=32.0,y=84.0,z=-67.0},
	{map='RainShelter',name='To Cave',x=51.0,y=80.0,z=43.0},
	{map='RainShelter',name='Golden Bell OOB',x=-31.19548988342285,y=74.96634674072266,z=-14.715871810913086},
	{map='Rain_Cave',name='To Sunny forest',x=-65.55963134765625,y=210.6380157470703,z=-285.0746154785156},
	{map='Rain_Cave',name='Big Fish OOB',x=-44.68874740600586,y=11.55691909790039,z=-334.6219482421875},
	{map='Rain_Cave',name='Birds OOB',x=161.14125061035156,y=-0.08140973746776581,z=149.28102111816406},
	{map='RainMid',name='Back to Rainforest',x=32.0,y=142.0,z=-27.0},
	{map='RainMid',name='To Sunny forest',x=-88,y=156.0,z=110.0},
	{map='RainMid',name='To Temple',x=-17.595956802368164,y=182.86737060546875,z=400.8680114746094},
	{map='RainMid',name='Mini Treehouse',x=-23.81351661682129,y=166.0816192626953,z=-0.289888858795166},
	{map='RainMid',name='Forest basecamp',x=-16.0,y=157.0,z=-36.0},
	{map='RainEnd',name='Butterflies',x=-0.6,y=107.0,z=83.0},
	{map='RainEnd',name='To Valley of Triumph',x=-1.0,y=211.0,z=219.0},
	{map='Sunset',name='Social Area',x=-30.16819953918457,y=305.6812438964844,z=27.05612564086914},
	{map='Sunset',name='To Second Race',x=286.0,y=41.0,z=-529.0},
	{map='Sunset',name='To Village',x=25.0,y=300.0,z=7.0},
	{map='Sunset',name='Soar High OOB',x=31.0,y=187.0,z=-467.0},
	{map='Sunset_Citadel',name='To fly race',x=206.0,y=495.0,z=-203.0},
	{map='SunsetRace',name='To main start',x=159.0,y=935.0,z=688.0},
	{map='SunsetEnd2',name='To Collosseum',x=8.0,y=147.0,z=-111.0},
	{map='SunsetEnd2',name='To Wasteland',x=12.0,y=141.0,z=-199.0},
	{map='SunsetVillage',name='Collosseum',x=-37,y=76.0,z=12.0},
	{map='SunsetVillage',name='Back to main',x=87.0,y=76.0,z=367.0},
	{map='SunsetVillage',name='To Yeti-park',x=-107.0,y=205.0,z=496.0},
	{map='SunsetVillage',name='Dream Guide',x=163.98046875,y=37.079376220703125,z=89.6847915649414},
	{map='Sunset_YetiPark',name='To Village',x=126.6,y=35.0,z=29.0},
	{map='Sunset_YetiPark',name='Wind Pathes',x=-447.4780273435,y=342.84793090831,z=660.11218171875},
	{map='DuskStart',name='Whirl pool',x=-171.370361328125,y=47.68985366821289,z=-873.1289672851562},
	{map='DuskStart',name='Temple',x=-51.30135349844,y=181.36267089875,z=-789.2449951875},
	{map='DuskStart',name='Ice Castle OOB',x=-50.03977966308594,y=4735.7001953125,z=-807.4383544921875},
	{map='DuskStart',name='Social Space',x=-77.0,y=64.0,z=-772.0},
	{map='DuskStart',name='To Valley',x=10.0,y=140.0,z=-195.0},
	{map='DuskGraveyard',name='To Dusk',x=54.0,y=97.0,z=362.0},
	{map='DuskMid',name='To End',x=-284.5697326660156,y=92.47919464111328,z=-400.2809753417969},
	{map='DuskMid',name='To Shipwreck',x=54.159915924072266,y=111.84867095947266,z=-264.114990234375},
	{map='DuskMid',name='To Graveyard',x=41.0,y=100.0,z=-41.0},
	{map='DuskEnd',name='To Vault of knowledge',x=0.0,y=208.0,z=-67.0},
	{map='Dusk_CrabField',name='To Graveyard',x=-49.0,y=26.0,z=525.0},
	{map='Night',name='4th floor',x=31.0,y=212.0,z=-40.0},
	{map='NightDesert',name='The Rose',x=133.8204345703125,y=12.115839004516602,z=347.6593322753906},
	{map='NightDesert',name='Amphi theater',x=83.05719757080078,y=73.64505767822266,z=62.82310485839844},
	{map='NightDesert',name='Light Tower',x=336.9781494140625,y=77.53258514404297,z=168.25814819335938},
	{map='NightDesert',name='Garden',x=227.37709045410156,y=16.496721267700195,z=606.0718383789062},
	{map='NightDesert',name='Throne',x=399.643310546875,y=92.43084716796875,z=778.90869140625},
	{map='NightDesert',name='BigBooks',x=408.36773681640625,y=154.7767791748047,z=1037.8370361328125},
	{map='NightDesert',name='Floating Eggrock',x=144.13259887695312,y=45.12910461425781,z=770.6494750976562},
	{map='NightDesertBeach',name='jelly',x=-5397,73779296875,y=2580,5859375,z=6082,1962890625},
	{map='NightDesert',name='To Infinite Desert',x=-21.14558982849121,y=9.46289348602295,z=547.5945434570312},
	{map='Night_InfiniteDesert',name='Back to desert',x=635.3980712890625,y=54.36724853515625,z=-85.38371276855469},
	{map='SunsetVillage',name='ALL_SPIRIT_LOL',x=-419.5585021972656,y=19.289306640625,z=-203.55723571777344},
	{map='SunsetVillage',name='OOB_STONEPIGpig2_by_MadBoii',x=2.1557862758636475,y=1.2917245626449585,z=0.5072160363197327},
	{map='Skyway',name='Back to Rain',x=133.41851806640625,y=384.35552978515625,z=281.2737731933594},
	{map='Skyway',name='Tunnel 1',x=-128.47596740722656,y=299.3070068359375,z=246.2905731201172},
    {map='Skyway',name='Tunnel 2',x=-149.53952026367188,y=298.14678955078125,z=238.4850616455078},
    {map='Skyway',name='Tunnel 3',x=-133.56265258789062,y=293.8212585449219,z=258.87957763671875},
    {map='Skyway',name='Tunnel 4',x=-128.7419891357422,y=287.17138671875,z=267.2208557128906},
    {map='Skyway',name='Tunnel 5',x=-101.95697021484375,y=306.36834716796875,z=274.76190185546875},
	{map='Skyway',name='Prophecy Cave',x=320.436,y=310.011,z=496.618},
    {map='Skyway',name='Sanctuary Island',x=539.998,y=289.546,z=502.741},
    {map='Skyway',name='Forests Cave',x=200.157,y=279.916,z=24.577},
    {map='Skyway',name='Yeti Park',x=431.916,y=321.597,z=24.172},
    {map='Skyway',name='Forgotten Ark',x=720.369,y=301.286,z=89.960},
    {map='Skyway',name='Starlight Desert',x=779.688,y=304.072,z=346.424},
    {map='Skyway',name='Skyway OBB',x=379.203,y=265.203,z=496.203},
	{map='OrbitEnd',name='GALAXY',x=38.50898361206055,y=4085.533447265625,z=1718.953125},
    {map='Dusk_TriangleEnd',name='Manta (step 1)',x=801.4453735351562,y=0.7042173147201538,z=5.263149261474609},
    {map='Dusk_TriangleEnd',name='Skystars(step2)',x=13.815317153930664,y=-44.58546829223633,z=-2.993274450302124},
    {map='Dusk_Triangle',name='Leviatan',x=-406.2,y=7.3,z=-224.5},
	{map='Sunset_FlyRace',name='OOB nubes',x=-812.950927734375,y=1545.5372314453125,z=-505.4371643066406},
    {map='Sunset_FlyRace',name='OOB Dorado y sombra',x=109.92562103271484,y=906.3428955078125,z=2269.62060546875,},
    {map='Sunset_FlyRace',name='OOB Templo uno',x=-472.6501770019531,y=1249.221435546875,z=-52.310367584228516},
    {map='Sunset_FlyRace',name='OOB Templo dos',x=-478.7032775878906,y=1564.540283203125,z=87.92137145996094},
    {map='Sunset_FlyRace',name='OOB Templo tres',x=-317.6,y=1250.4,z=-27.3},
    {map='Sunset_FlyRace',name='OOB horizonte Dorado',x=4143.90673828125,y=5386.37890625,z=-1443.9156494140625},
	{map='DuskMid',name='Prison Demons',x=-416.3,y=12.3,z=411.0},
	{map='TGCOffice',name='exit',x=6.7,y=61.6,z=-21.8}
}

FramentsRun = {
	{family = "Valley", name = "Valley Colosseum", map = "SunsetColosseum", x = -211.52593994140625, y = 133.91896057128906, z = 44.07035446166992},
    {family = "Valley", name = "Valley Colosseum", map = "SunsetColosseum", x = -223.0878143310547, y = 131.81741333007812, z = 38.07758712768555},
    {family = "Valley", name = "Valley Colosseum", map = "SunsetColosseum", x = -226.65586853027344, y = 133.5016326904297, z = 32.67816162109375},
    {family = "Valley", name = "Valley Colosseum", map = "SunsetColosseum", x = -232.8355255126953, y = 134.086181640625, z = 44.89790344238281},
    {family = "Valley", name = "Valley Colosseum", map = "SunsetColosseum", x = -244.24478149414062, y = 136.78515625, z = 58.75127410888672},
    {family = "Valley", name = "Valley Colosseum", map = "SunsetColosseum", x = -220.1278533935547, y = 132.5611572265625, z = 69.16756439208984},
    {family = "Valley", name = "Valley Colosseum", map = "SunsetColosseum", x = -211.57115173339844, y = 134.9465789794922, z = 76.77666473388672},
    {family = "Valley", name = "Valley Colosseum", map = "SunsetColosseum", x = -219.6148223876953, y = 136.5106964111328, z = 84.48727416992188},
    {family = "Valley", name = "Valley Colosseum", map = "SunsetColosseum", x = -209.4252471923828, y = 134.20248413085938, z = 57.89286422729492},
    {family = "Valley", name = "Valley Colosseum", map = "SunsetColosseum", x = -220.3546600341797, y = 133.20848083496094, z = 68.6723403930664},
    {family = "Valley", name = "Valley Colosseum", map = "SunsetColosseum", x = -230.28994750976562, y = 133.32737731933594, z = 69.48483276367188},
    {family = "Valley", name = "Valley Colosseum", map = "SunsetColosseum", x = -212.97549438476562, y = 133.54901123046875, z = 45.42156982421875},
    {family = "Valley", name = "Valley Colosseum", map = "SunsetColosseum", x = -196.70492553710938, y = 135.36605834960938, z = 56.45188522338867},
    {family = "Valley", name = "Valley Colosseum", map = "SunsetColosseum", x = -218.1603240966797, y = 132.80885314941406, z = 57.66897964477539},
}

orangepoints = {
	{family = "Prairie", name = "Prairie Butterfly Fields", map = "Prairie_ButterflyFields", x = 126.29805755615234, y = 196.913330078125, z = -442.8593444824219},
	{family = "Prairie", name = "Prairie Butterfly Fields", map = "Prairie_ButterflyFields", x = 112.78034210205078, y = 197.1422576904297, z = -435.4446716308594},
	{family = "Prairie", name = "Prairie Butterfly Fields", map = "Prairie_ButterflyFields", x = 106.09992980957031, y = 196.78939819335938, z = -428.67547607421875},
	{family = "Prairie", name = "Prairie Butterfly Fields", map = "Prairie_ButterflyFields", x = 114.19367218017578, y = 198.38819885253906, z = -414.2073669433594},
	{family = "Prairie", name = "Prairie Butterfly Fields", map = "Prairie_ButterflyFields", x = 124.01647186279297, y = 157.48753356933594, z = -31.212688446044922},
	{family = "Prairie", name = "Prairie Butterfly Fields", map = "Prairie_ButterflyFields", x = 113.55585479736328, y = 149.231201171875, z = -25.19886589050293},
	{family = "Prairie", name = "Prairie Butterfly Fields", map = "Prairie_ButterflyFields", x = 39.81660079956055, y = 156.7734832763672, z = -17.85986328125},
	{family = "Prairie", name = "Prairie Butterfly Fields", map = "Prairie_ButterflyFields", x = 77.76324462890625, y = 150.28097534179688, z = 1.2160066366195679},
	{family = "Prairie", name = "Prairie Butterfly Fields", map = "Prairie_ButterflyFields", x = 80.72425842285156, y = 156.3762969970703, z = 44.45405960083008},
	{family = "Prairie", name = "Prairie Butterfly Fields", map = "Prairie_ButterflyFields", x = 81.14562225341797, y = 160.86563110351562, z = 61.94401168823242},
	{family = "Prairie", name = "Prairie Butterfly Fields", map = "Prairie_ButterflyFields", x = 104.96333312988281, y = 172.4871063232422, z = 20.38619613647461},
	{family = "Prairie", name = "Prairie Butterfly Fields", map = "Prairie_ButterflyFields", x = 109.82264709472656, y = 156.36888122558594, z = 24.049354553222656},
	{family = "Prairie", name = "Prairie Butterfly Fields", map = "Prairie_ButterflyFields", x = 147.67913818359375, y = 162.32566833496094, z = 1.4648430347442627},

	{family = "Forest", name = "Forest", map = "Rain", x = 143.654541015625, y = 217.29080200195312, z = -619.9160766601562},
	{family = "Forest", name = "Forest", map = "Rain", x = 128.3445587158203, y = 218.75230407714844, z = -622.548583984375},
	{family = "Forest", name = "Forest", map = "Rain", x = 138.50393676757812, y = 218.37503051757812, z = -603.8203735351562},
	{family = "Forest", name = "Forest", map = "Rain", x = 24.27113914489746, y = 98.42232513427734, z = -278.1578674316406},
	{family = "Forest", name = "Forest", map = "Rain", x = 20.559228897094727, y = 93.58775329589844, z = -255.6875762939453},
	{family = "Forest", name = "Forest", map = "Rain", x = 20.442970275878906, y = 93.06085968017578, z = -226.4179229736328},
	{family = "Forest", name = "Forest", map = "Rain", x = 14.260766983032227, y = 94.85612487792969, z = -220.59446716308594},
	{family = "Forest", name = "Forest", map = "Rain", x = 3.066572904586792, y = 98.71613311767578, z = -177.68374633789062},
	{family = "Forest", name = "Forest", map = "Rain", x = 30.12805938720703, y = 98.2874526977539, z = -176.2969207763672},
	{family = "Forest", name = "Forest", map = "Rain", x = 15.494575500488281, y = 96.87621307373047, z = -168.480224609375},
	{family = "Forest", name = "Forest", map = "Rain", x = 9.414965629577637, y = 98.30592346191406, z = -156.264892578125},
	{family = "Forest", name = "Forest", map = "Rain", x = 16.681167602539062, y = 99.4709243774414, z = -135.50596618652344},
	{family = "Forest", name = "Forest", map = "Rain", x = 26.542457580566406, y = 98.16309356689453, z = -119.90614318847656},
	{family = "Forest", name = "Forest", map = "Rain", x = 29.00717544555664, y = 98.90046691894531, z = -112.08134460449219},

	{family = "Valley", name = "Valley Ice Rink", map = "Sunset", x = -50.35805892944336, y = 308.4833068847656, z = 34.32848358154297},
	{family = "Valley", name = "Valley Ice Rink", map = "Sunset", x = -49.4981689453125, y = 308.0231628417969, z = 15.258711814880371},
	{family = "Valley", name = "Valley Ice Rink", map = "Sunset", x = -20.165477752685547, y = 307.48455810546875, z = 13.469489097595215},
	{family = "Valley", name = "Valley Ice Rink", map = "Sunset", x = -21.562238693237305, y = 307.6826477050781, z = 24.200382232666016},
	{family = "Valley", name = "Valley Ice Rink", map = "Sunset", x = -15.243356704711914, y = 308.9317626953125, z = 3.5216615200042725},
	{family = "Valley", name = "Valley Ice Rink", map = "Sunset", x = 173.6284942626953, y = 39.612815856933594, z = -517.6148681640625},
	{family = "Valley", name = "Valley Ice Rink", map = "Sunset", x = 163.8513641357422, y = 46.98538589477539, z = -570.0316772460938},
	{family = "Valley", name = "Valley Ice Rink", map = "Sunset", x = 197.0811004638672, y = 48.47185516357422, z = -560.583740234375},
	{family = "Valley", name = "Valley Ice Rink", map = "Sunset", x = 215.08486938476562, y = 51.39255905151367, z = -563.8349609375},
	{family = "Valley", name = "Valley Ice Rink", map = "Sunset", x = 237.5530548095703, y = 47.307559967041016, z = -530.6239624023438},
	{family = "Valley", name = "Valley Ice Rink", map = "Sunset", x = 189.60836791992188, y = 49.1378173828125, z = -519.484375},
	{family = "Valley", name = "Valley Ice Rink", map = "Sunset", x = 191.62330627441406, y = 49.183799743652344, z = -510.8179931640625},
	{family = "Valley", name = "Valley Ice Rink", map = "Sunset", x = 177.05775451660156, y = 49.39608383178711, z = -506.7843933105469},
	{family = "Valley", name = "Valley Ice Rink", map = "Sunset", x = 183.86141967773438, y = 50.537349700927734, z = -543.81201171875},
	{family = "Valley", name = "Valley Ice Rink", map = "Sunset", x = 185.2762908935547, y = 49.24509048461914, z = -520.08154296875},

	{family = "Wasteland", name = "Golden Wasteland", map = "Dusk", x = 77.16574096679688, y = 0.7214173674583435, z = 317.8836669921875},
	{family = "Wasteland", name = "Golden Wasteland", map = "Dusk", x = 83.22749328613281, y = 1.1408729553222656, z = 305.5412292480469},
	{family = "Wasteland", name = "Golden Wasteland", map = "Dusk", x = 14.459518432617188, y = 1.4201360940933228, z = 308.1772155761719},
	{family = "Wasteland", name = "Golden Wasteland", map = "Dusk", x = -11.435017585754395, y = 0.8449526429176331, z = 293.87762451171875},
	{family = "Wasteland", name = "Golden Wasteland", map = "Dusk", x = -17.05141258239746, y = 7.153903961181641, z = 268.57965087890625},
	{family = "Wasteland", name = "Golden Wasteland", map = "Dusk", x = -21.338214874267578, y = 3.934479236602783, z = 277.26702880859375},
	{family = "Wasteland", name = "Golden Wasteland", map = "Dusk", x = -21.561687469482422, y = 7.3842010498046875, z = 270.060791015625},
	{family = "Wasteland", name = "Golden Wasteland", map = "Dusk", x = -23.1, y = 2.2, z = 221.7},
	{family = "Wasteland", name = "Golden Wasteland", map = "Dusk", x = -57.29594802856445, y = 5.205075740814209, z = 223.32252502441406},
	{family = "Wasteland", name = "Golden Wasteland", map = "Dusk", x = -45.654945373535156, y = 3.454293727874756, z = 194.54806518554688},
	{family = "Wasteland", name = "Golden Wasteland", map = "Dusk", x = -14.85866641998291, y = 18.794450759887695, z = 221.30018615722656},
	{family = "Wasteland", name = "Golden Wasteland", map = "Dusk", x = 44.08876037597656, y = 0.6703140139579773, z = 238.35678100585938},
	{family = "Wasteland", name = "Golden Wasteland", map = "Dusk", x = 29.74688148498535, y = 1.1249361038208008, z = 231.73391723632812},
	{family = "Wasteland", name = "Golden Wasteland", map = "Dusk", x = -22.451961517333984, y = 0.9873872995376587, z = 224.93923950195312},
	{family = "Wasteland", name = "Golden Wasteland", map = "Dusk", x = -30.32406997680664, y = 1.558298945426941, z = 248.53433227539062},
	{family = "Wasteland", name = "Golden Wasteland", map = "Dusk", x = -76.6430435180664, y = 8.156465530395508, z = 164.18629455566406},

	{family = "Vault", name = "Vault Ground", map = "Night", x = -14.836230278015137, y = 37.467620849609375, z = -103.27783966064453},
	{family = "Vault", name = "Vault Ground", map = "Night", x = 18.670202255249023, y = 36.67387008666992, z = -70.81840515136719},
	{family = "Vault", name = "Vault Ground", map = "Night", x = 8.573368072509766, y = 36.67366027832031, z = -63.83387756347656},
	{family = "Vault", name = "Vault Ground", map = "Night", x = -9.376907348632812, y = 38.13413619995117, z = -57.37282180786133},
	{family = "Vault", name = "Vault Ground", map = "Night", x = 8.294356346130371, y = 38.883243560791016, z = -56.20852279663086},
	{family = "Vault", name = "Vault Ground", map = "Night", x = 6.184481143951416, y = 40.427947998046875, z = -33.624385833740234},
	{family = "Vault", name = "Vault Ground", map = "Night", x = -0.34257611632347107, y = 40.457305908203125, z = -9.079641342163086},
	{family = "Vault", name = "Vault Ground", map = "Night", x = -15.086583137512207, y = 41.51041793823242, z = -19.57368278503418},
	{family = "Vault", name = "Vault Ground", map = "Night", x = -7.213522911071777, y = 40.50748062133789, z = -5.966336250305176},
	{family = "Vault", name = "Vault Ground", map = "Night", x = -19.547733306884766, y = 42.31123733520508, z = -0.5449306964874268},
	{family = "Vault", name = "Vault Ground", map = "Night", x = 25.68840980529785, y = 41.42829513549805, z = 15.762969017028809},
	{family = "Vault", name = "Vault Ground", map = "Night", x = 16.63633155822754, y = 40.467037200927734, z = -13.65200424194336},
	{family = "Vault", name = "Vault Ground", map = "Night", x = 6.460164546966553, y = 80.81021118164062, z = 17.904685974121094},
	{family = "Vault", name = "Vault Ground", map = "Night", x = 17.821470260620117, y = 80.78521728515625, z = 14.868672370910645},
	{family = "Vault", name = "Vault Ground", map = "Night", x = 19.488632202148438, y = 80.00880432128906, z = -2.6718318462371826},
	{family = "Vault", name = "Vault Ground", map = "Night", x = 13.880064964294434, y = 81.11375427246094, z = -14.143535614013672},
	{family = "Vault", name = "Vault Ground", map = "Night", x = 34.09600830078125, y = 161.0818634033203, z = -41.8427619934082},
}


fastpoints = {
    Isle = {
        {map = "Dawn", type = "mv", x = 123.234, y = 2.668, z = 101.148},
        {map = "Dawn", type = "mv", x = -206.663, y = 94.281, z = 144.878},
        {map = "Dawn", type = "mv", x = -4.762, y = 94.491, z = 380.259},

		{map = "Dawn", type = "tp-mv", to_map = "DawnCave", x = -296.637, y = 251.346, z = 2.397},
		{map = "DawnCave", type = "tp", to_map = "Dawn_TrialsWater"},
		{map = "Dawn_TrialsWater", type = "mv", x = -441.158, y = 78.902, z = -0.052},
		{map = "Dawn_TrialsWater", type = "mv", x = -99.495, y = 65.721, z = 36.747},

		{map = "Dawn_TrialsWater", type = "tp-mv", to_map = "Dawn_TrialsEarth", x = 11.846, y = 127.375, z = 94.914},
		{map = "Dawn_TrialsEarth", type = "mv", x = 14.064, y = 128.312, z = 2.913},

		{map = "Dawn_TrialsEarth", type = "tp-mv", to_map = "Dawn_TrialsAir", x = -130.526, y = 90.641, z = -27.569},
		{map = "Dawn_TrialsAir", type = "mv", x = -130.758, y = 106.305, z = -11.734},

		{map = "Dawn_TrialsAir", type = "tp-mv", to_map = "Dawn_TrialsFire", x = -29.711, y = 47.318, z = -37.880},
		{map = "Dawn_TrialsFire", type = "mv", x = -257.227, y = 50.346, z = -12.273},

		{map = "Dawn_TrialsFire", type = "tp", to_map = "CandleSpace"},
    },

    Prairie = {
        {map = "Prairie_ButterflyFields", type = "mv", x = -431.51947021484375, y = 196.65725708007812, z = 119.02850341796875},
        {map = "Prairie_ButterflyFields", type = "mv", x = -20.25689697265625, y = 158.474609375, z = 26.712081909179688},

        {map = "Prairie_ButterflyFields", type = "tp-mv", to_map = "Prairie_Cave", x = 65.85206604003906, y = 187.83665466308594, z = 302.1767578125},
        {map = "Prairie_Cave", type = "mv", x = 200.1848602294922, y = 181.25865173339844, z = 399.07965087890625},

		{map = "Prairie_Cave", type = "tp-mv", to_map = "Prairie_Village", x = 253.37257385253906, y = 194.7720184326172, z = 99.65469360351562},
		{map = "Prairie_Village", type = "mv", x = 361.661376953125, y = 193.9128875732422, z = 66.8396987915039},
		{map = "Prairie_Village", type = "mv", x = 477.6221618652344, y = 254.37265014648438, z = 122.10852813720703},

		{map = "Prairie_Village", type = "tp-mv", to_map = "Prairie_NestAndKeeper", x = 120.34546661376953, y = 180.1386260986328, z = -144.81192016601562},
		{map = "Prairie_NestAndKeeper", type = "mv", x = 57.971797943115234, y = 171.68272399902344, z = -102.97749328613281},
	
    	{map = "Prairie_NestAndKeeper", type = "tp-mv", to_map = 'Prairie_Island', x = 221.30966186523438, y = 95.4205093383789,  z = 246.12799072265625},
		{map = "Prairie_Island", type = "mv", x = 330.4920959472656, y = 0.7480080723762512,z = 49.76979446411133},
		{map = "Prairie_Island", type = "mv", x = 407.047119140625, y = 1.8199610710144043,z = 133.8062744140625},

		{map = "Prairie_Island", type = "tp-mv", to_map = "DayEnd", x = 43.756683349609375, y = 83.43392944335938, z = -100.00375366210938},
		{map = "DayEnd", type = "tp", to_map = "CandleSpace"},
    },		

	Vault = {
		{map = "Night", type = "mv", x = 0.23936225473880768, y = 42.3804931640625, z = 0.47766169905662537},
		{map = "Night", type = "mv", x = 18.126060485839844, y = 82.0923080444336, z = 15.638044357299805},
		{map = "Night", type = "mv", x = -30.136156, y = 146.913833, z = -3.242324},

		{map = "Night", type = "tp-mv", to_map = "NightDesert", x = 347.528564453125, y = 12.2946138381958, z = 134.120361328125},
		{map = "NightDesert", type = "mv", x = 1026.362060, y = 150.298233, z = 395.193969},

		{map = "NightDesert", type = "tp-mv", to_map = "NightDesert_Beach", x = 605.5531005859375, y = 0.5945964455604553, z = 606.4830932617188},
		{map = "NightDesert_Beach", type = "mv", x = 565.524414, y = 13.000000, z = 440.000000, skip = true},

		{map = "NightDesert", type = "tp", to_map = "Night_JarCave"},
		{map = "Night_JarCave", type = "mv", x = 373.4429626464844, y = 28.68767738342285, z = -77.86063385009766, skip = true},

		{map = "NightDesert", type = "tp", to_map = "NightArchive"},
		{map = "NightArchive", type = "mv", x = 27.369735717773438, y = 541.7713623046875, z = 30.13688087463379, skip = true},

		{map = "Night", type = "tp", to_map = "TGCOffice"},
		{map = "TGCOffice", type = "mv", x = -26.367294311523438, y = 61.92649841308594, z = 6.851436138153076, skip = true},

		{map = "Night", type = "tp", to_map = "Night2"},
		{map = "Night2", type = "mv", x = 56.743221, y = 306.096588, z = 9.978611},
	}
}



local old_ranges = gg.getRanges()

bootloader = nil
player = nil
sarray = {}

-- bootloader to player offset 0x1441FE8
-- bootloader to entity offset  0x172D4D8
-- bootloader to gui offset 0x0x16d0500 (basically search for number us "Ca" 330,712,483,300)
-- entity to nentity offset 0x80505C  (seems like this offset never changes)
-- player to props offset  0x447624
-- player to firework charge amount offset  0x447624 + 0x1540
-- friend_node(each) to node_price offset -2C
-- nentity to portal_off -0x4011F0
-- nentity to darkplants  (511) or (315) or (256)

-- PTOPBASE IS 424848 -this is just wing light count of the player (I didn't event know about it before)

-- MOV W0, W0			704,644,064 	<- to return 0
-- MOV W0, #0x1 		1,384,120,352 	<- to return 1
-- ????????????			4,043,309,695 	<- Chats
-- CBZ W8, [PC, #0xC]	872,415,336 	<- Friendship Nodes
-- LDR W8, [X28,#0x28]	-1,186,976,888 	<- Emotes
-- CSET W0, WZR, NE 	446,629,856 	<- Cosmetics

settings = {
	wdistance = 5.0,
	useautoburn = true
}

gg.setRanges(gg.REGION_C_ALLOC)

on  = '¦🎃¦'
off = '¦❌¦'




















--
-- json.lua
--
-- Copyright (c) 2020 rxi
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy of
-- this software and associated documentation files (the "Software"), to deal in
-- the Software without restriction, including without limitation the rights to
-- use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
-- of the Software, and to permit persons to whom the Software is furnished to do
-- so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in all
-- copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
-- SOFTWARE.
--

local json = { _version = "0.1.2" }

-------------------------------------------------------------------------------
-- Encode
-------------------------------------------------------------------------------

local encode

local escape_char_map = {
  [ "\\" ] = "\\",
  [ "\"" ] = "\"",
  [ "\b" ] = "b",
  [ "\f" ] = "f",
  [ "\n" ] = "n",
  [ "\r" ] = "r",
  [ "\t" ] = "t",
}

local escape_char_map_inv = { [ "/" ] = "/" }
for k, v in pairs(escape_char_map) do
  escape_char_map_inv[v] = k
end


local function escape_char(c)
  return "\\" .. (escape_char_map[c] or string.format("u%04x", c:byte()))
end


local function encode_nil(val)
  return "null"
end


local function encode_table(val, stack, ml)
  local res = {}
  stack = stack or {}

  -- Circular reference?
  if stack[val] then error("circular reference") end

  stack[val] = true

  if rawget(val, 1) ~= nil or next(val) == nil then
    -- Treat as array -- check keys are valid and it is not sparse
    local n = 0
    for k in pairs(val) do
      if type(k) ~= "number" then
        error("invalid table: mixed or invalid key types")
      end
      n = n + 1
    end
    if n ~= #val then
      error("invalid table: sparse array")
    end
    -- Encode
    for i, v in ipairs(val) do
      table.insert(res, encode(v, stack, ml + 1))
    end
    stack[val] = nil
    return "[" .. table.concat(res, ", ") .. "]"

  else
    -- Treat as an object
    for k, v in pairs(val) do
      if type(k) ~= "string" then
        error("invalid table: mixed or invalid key types")
      end
      table.insert(res, encode(k, stack, ml + 1) .. " : " .. encode(v, stack, ml + 1))
    end
    stack[val] = nil
    return "{\n"..string.rep("\t", ml) .. table.concat(res, ",\n"..string.rep('\t', ml)) ..'\n'..string.rep("\t", ml - 1).."}"
  end
end


local function encode_string(val)
  return '"' .. val:gsub('[%z\1-\31\\"]', escape_char) .. '"'
end


local function encode_number(val)
  -- Check for NaN, -inf and inf
  if val ~= val or val <= -math.huge or val >= math.huge then
    error("unexpected number value '" .. tostring(val) .. "'")
  end
  return string.format("%.14g", val)
end


local type_func_map = {
  [ "nil"     ] = encode_nil,
  [ "table"   ] = encode_table,
  [ "string"  ] = encode_string,
  [ "number"  ] = encode_number,
  [ "boolean" ] = tostring,
}


encode = function(val, stack, ml)
  local t = type(val)
  local f = type_func_map[t]
  if f then
    return f(val, stack, ml)
  end
  error("unexpected type '" .. t .. "'")
end


function json.encode(val)
  return ( encode(val, nil, 1) )
end


-------------------------------------------------------------------------------
-- Decode
-------------------------------------------------------------------------------

local parse

local function create_set(...)
  local res = {}
  for i = 1, select("#", ...) do
    res[ select(i, ...) ] = true
  end
  return res
end

local space_chars   = create_set(" ", "\t", "\r", "\n")
local delim_chars   = create_set(" ", "\t", "\r", "\n", "]", "}", ",")
local escape_chars  = create_set("\\", "/", '"', "b", "f", "n", "r", "t", "u")
local literals      = create_set("true", "false", "null")

local literal_map = {
  [ "true"  ] = true,
  [ "false" ] = false,
  [ "null"  ] = nil,
}


local function next_char(str, idx, set, negate)
  for i = idx, #str do
    if set[str:sub(i, i)] ~= negate then
      return i
    end
  end
  return #str + 1
end


local function decode_error(str, idx, msg)
  local line_count = 1
  local col_count = 1
  for i = 1, idx - 1 do
    col_count = col_count + 1
    if str:sub(i, i) == "\n" then
      line_count = line_count + 1
      col_count = 1
    end
  end
  error( string.format("%s at line %d col %d", msg, line_count, col_count) )
end


local function codepoint_to_utf8(n)
  -- http://scripts.sil.org/cms/scripts/page.php?site_id=nrsi&id=iws-appendixa
  local f = math.floor
  if n <= 0x7f then
    return string.char(n)
  elseif n <= 0x7ff then
    return string.char(f(n / 64) + 192, n % 64 + 128)
  elseif n <= 0xffff then
    return string.char(f(n / 4096) + 224, f(n % 4096 / 64) + 128, n % 64 + 128)
  elseif n <= 0x10ffff then
    return string.char(f(n / 262144) + 240, f(n % 262144 / 4096) + 128,
                       f(n % 4096 / 64) + 128, n % 64 + 128)
  end
  error( string.format("invalid unicode codepoint '%x'", n) )
end


local function parse_unicode_escape(s)
  local n1 = tonumber( s:sub(1, 4),  16 )
  local n2 = tonumber( s:sub(7, 10), 16 )
   -- Surrogate pair?
  if n2 then
    return codepoint_to_utf8((n1 - 0xd800) * 0x400 + (n2 - 0xdc00) + 0x10000)
  else
    return codepoint_to_utf8(n1)
  end
end


local function parse_string(str, i)
  local res = ""
  local j = i + 1
  local k = j

  while j <= #str do
    local x = str:byte(j)

    if x < 32 then
      decode_error(str, j, "control character in string")

    elseif x == 92 then -- `\`: Escape
      res = res .. str:sub(k, j - 1)
      j = j + 1
      local c = str:sub(j, j)
      if c == "u" then
        local hex = str:match("^[dD][89aAbB]%x%x\\u%x%x%x%x", j + 1)
                 or str:match("^%x%x%x%x", j + 1)
                 or decode_error(str, j - 1, "invalid unicode escape in string")
        res = res .. parse_unicode_escape(hex)
        j = j + #hex
      else
        if not escape_chars[c] then
          decode_error(str, j - 1, "invalid escape char '" .. c .. "' in string")
        end
        res = res .. escape_char_map_inv[c]
      end
      k = j + 1

    elseif x == 34 then -- `"`: End of string
      res = res .. str:sub(k, j - 1)
      return res, j + 1
    end

    j = j + 1
  end

  decode_error(str, i, "expected closing quote for string")
end


local function parse_number(str, i)
  local x = next_char(str, i, delim_chars)
  local s = str:sub(i, x - 1)
  local n = tonumber(s)
  if not n then
    decode_error(str, i, "invalid number '" .. s .. "'")
  end
  return n, x
end


local function parse_literal(str, i)
  local x = next_char(str, i, delim_chars)
  local word = str:sub(i, x - 1)
  if not literals[word] then
    decode_error(str, i, "invalid literal '" .. word .. "'")
  end
  return literal_map[word], x
end


local function parse_array(str, i)
  local res = {}
  local n = 1
  i = i + 1
  while 1 do
    local x
    i = next_char(str, i, space_chars, true)
    -- Empty / end of array?
    if str:sub(i, i) == "]" then
      i = i + 1
      break
    end
    -- Read token
    x, i = parse(str, i)
    res[n] = x
    n = n + 1
    -- Next token
    i = next_char(str, i, space_chars, true)
    local chr = str:sub(i, i)
    i = i + 1
    if chr == "]" then break end
    if chr ~= "," then decode_error(str, i, "expected ']' or ','") end
  end
  return res, i
end


local function parse_object(str, i)
  local res = {}
  i = i + 1
  while 1 do
    local key, val
    i = next_char(str, i, space_chars, true)
    -- Empty / end of object?
    if str:sub(i, i) == "}" then
      i = i + 1
      break
    end
    -- Read key
    if str:sub(i, i) ~= '"' then
      decode_error(str, i, "expected string for key")
    end
    key, i = parse(str, i)
    -- Read ':' delimiter
    i = next_char(str, i, space_chars, true)
    if str:sub(i, i) ~= ":" then
      decode_error(str, i, "expected ':' after key")
    end
    i = next_char(str, i + 1, space_chars, true)
    -- Read value
    val, i = parse(str, i)
    -- Set
    res[key] = val
    -- Next token
    i = next_char(str, i, space_chars, true)
    local chr = str:sub(i, i)
    i = i + 1
    if chr == "}" then break end
    if chr ~= "," then decode_error(str, i, "expected '}' or ','") end
  end
  return res, i
end


local char_func_map = {
  [ '"' ] = parse_string,
  [ "0" ] = parse_number,
  [ "1" ] = parse_number,
  [ "2" ] = parse_number,
  [ "3" ] = parse_number,
  [ "4" ] = parse_number,
  [ "5" ] = parse_number,
  [ "6" ] = parse_number,
  [ "7" ] = parse_number,
  [ "8" ] = parse_number,
  [ "9" ] = parse_number,
  [ "-" ] = parse_number,
  [ "t" ] = parse_literal,
  [ "f" ] = parse_literal,
  [ "n" ] = parse_literal,
  [ "[" ] = parse_array,
  [ "{" ] = parse_object,
}


parse = function(str, idx)
  local chr = str:sub(idx, idx)
  local f = char_func_map[chr]
  if f then
    return f(str, idx)
  end
  decode_error(str, idx, "unexpected character '" .. chr .. "'")
end


function json.decode(str)
  if type(str) ~= "string" then
    error("expected argument of type string, got " .. type(str))
  end
  local res, idx = parse(str, next_char(str, 1, space_chars, true))
  idx = next_char(str, idx, space_chars, true)
  if idx <= #str then
    decode_error(str, idx, "trailing garbage")
  end
  return res
end




















local gx = {
	_nav = nil,
	_block_repeat = false,
	_menus = {},
	_back = "back",
	_back_function = nil,
	_lang = nil,
	_langs = {},
	_visible = false,
	vars = {},
	signs = {[false] = "[-]", [true] = "[+]"},

	json = json
}

-- [[ Menu related functions (I guess) ]] --

-- Stackoverflow is <3
function gx.copy_table(from, to_table)
	-- erase all old keys
	for k,_ in pairs(to_table) do
		to_table[k] = nil
	end

	-- copy the new ones over
	for k,v in pairs(from) do
		if type(v) == "table" then
			local _v = {}
			gx.copy_table(v, _v)
			to_table[k] = _v
		else
			to_table[k] = v
		end
	end
end

function gx.indexof(a, tbl)
	for _,a_ in pairs(tbl) do if a_==a then return true end end
	return false
end

-- Return the first index with the given value (or nil if not found).
function gx.get_ind(array, value)
    for i, v in ipairs(array) do
        if v == value then
            return i
        end
    end
    return nil
end

function gx.get_ind_h_next(array, value)
	local found = false
	local first = nil
    for i, v in pairs(array) do
    	if not(first) then first = i end
    	if found then return i end
        if i == value then
			found = true
        end
    end
    if found then return first end
    return nil
end

function gx.table_difference(a, b)
	local ret = {}
	for _,a_ in ipairs(a) do
	   if not gx.indexof(a_,b) then table.insert(ret, a_) end
	end
	
	return ret
end

function gx.table_merge(...)
	local result = {}
	-- For each source table
	for _, t in ipairs{...} do
		-- For each pair in t
		for k, v in pairs(t) do
			if result[k] == nil then
				result[k] = v
			else
				table.insert(result, v)
			end
		end
	end
	return result
end

function gx.round(x, decimals)
	-- This should be less naive about multiplication and division if you
	-- care about accuracy around edges like: numbers close to the higher
	-- values of a float or if you are rounding to large numbers of decimals.
    local n = 10^(decimals or 0)
    x = x * n
    if x >= 0 then x = math.floor(x + 0.5) else x = math.ceil(x - 0.5) end
    return x / n
end

function gx.split_string(inputstr, sep)
	if sep == nil then
		sep = "%s"
	end
	local t={}
	for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
		table.insert(t, str)
	end
	return t
end

function gx.map(tbl, f)
    local t = {}
    for k,v in pairs(tbl) do
        t[k] = f(v)
    end
    return t
end

function gx.sign(b)
	if b == true then
		return gx.signs[true]
	else
		return gx.signs[false]
	end
end

function gx.split_menu(menu)
	local ml = {}
	local fl = {}

	for k, v in ipairs(menu) do
		table.insert(ml, v[1])

		if v[2] ~= nil then
			fl[#fl + 1] = v[2]
		else
			fl[#fl + 1] = {}
		end
	end

	return {menu = ml, functions = fl}
end

function gx.make_ib(index, len, bools)
	local _index = {} 
	local _bools = {}

	for i = 1, len do
		if bools[i] == true then
			_bools[i] = true
		else
			_bools[i] = false
		end
	end

	_bools[index] = not _bools[index]
	_index = {index}

	return {index = _index, bools = _bools}
end

function gx.split_index(index, len)
	local _index = {}
	local _bools = {}

	for i = 1, len do
		if index[i] == true then
			table.insert(_index, i)
			_bools[i] = true
		else
			_bools[i] = false
		end
	end

	return {index = _index, bools = _bools}
end

function gx.index_diff(old, new)
	local index = {}

	index = gx.table_merge(gx.table_difference(old, new), gx.table_difference(new, old))

	return index
end

function gx.switch_bools(index, bools)
	for k, i in ipairs(index) do
		bools[i] = not bools[i]
	end

	return bools
end

function gx.load_json_file(filename)
	local file = io.open(filename, "r")
	if file == nil then 
		return nil
	end
	local content = json.decode(file:read("*a"))
	file:close()

	return content
end

function gx.save_json_file(filename, tbl)
	local file = io.open(filename, "w")
	file:write(json.encode(tbl))
	file:close()
end

function gx.get_var(var_path)
	if type(var_path) == "string" then
		var_path = gx.split_string(var_path, ".")
	end

	local var = gx.vars

	for k, v in ipairs(var_path) do
		var = var[v]
	end

	return var
end

function gx.set_var(var_path, value)
	if type(var_path) == "string" then
		var_path = gx.split_string(var_path, ".")
	end

	local var = gx.vars

	for i = 1, #var_path - 1 do
		var = var[var_path[i]]
	end

	var[var_path[#var_path]] = value
end

function gx.set_loop_interval(interval)
	gx._interval = interval
end

function gx.prompt_set_var(var_path, title, t, f)
	local var = gx.get_var(var_path)
	if t == nil then t = type(var) end
	local value = gg.prompt({title}, {[1] = var}, {[1] = t})
	if value ~= nil then
		if f then
			value = f(value)
		end
		gx.set_var(var_path, value[1])
	end
end

function gx.render_menu(menu, bools)
	local _menu = {}
	-- gg.toast(tostring(gx.vars["wb"]))

	for k, v in ipairs(menu) do
		local _v = tostring(v)
		local fe = 1
		while true do
			local _s = _v:find("{gx:")
			local _e = _v:find("}", fe)
	
			if _s ~= nil and _e ~= nil then
				if _e - _s > 0 then
					local name = _v:sub(_s, _e)
					local var_path = name:sub(name:find(":") + 1, name:find("}") - 1)
					local var = gx.get_var(var_path)
					if type(var) == "boolean" then
						var = gx.sign(var)
					end
					-- gg.alert(name, "ok")
					_v = _v:gsub(name, tostring(var))
				else
					fe = _e + 1
				end
			else
				break
			end
		end
		if _v == "{gxnil}" then _v = nil else
		_v = _v:gsub("{gxindex}", tostring(k))
		_v = _v:gsub("{gxsign}", gx.sign(bools[k]))
		end
		table.insert(_menu, _v)
	end

	return _menu
end

function gx.format_args(args, ind, bool)
	for k, v in pairs(args) do
		if type(v) == "string" then
			if v == "{gxindex}" then
				args[k] = ind
			elseif v == "{gxbool}" then
				args[k] = bool
			else
				local fe = 1
				while true do
					local _s = args[k]:find("{gx:")
					local _e = args[k]:find("}", fe)
	
					if _s ~= nil and _e ~= nil then
						if _e - _s > 0 then
							local name = args[k]:sub(_s, _e)
							local var_path = name:sub(name:find(":") + 1, name:find("}") - 1)
							local var = gx.get_var(var_path)
							if type(var) == "boolean" then
								local p = args[k]:sub(_s - 1, _s - 1)
								if p == "!" then var = not var end
							end
							args[k] = var
							if type(args[k]) ~= "string" then break end
						else
							fe = _e + 1
						end
					else
						break
					end
				end
			end
		elseif type(v) == "table" then
			args[k] = gx.format_args(args[k], ind, bool)
		end
	end

	return args
end

function gx.add_to_nav(t)
	gx._nav[#gx._nav + 1] = t
end

function gx.set_back_text(text)
	gx._back = text
end

function gx.set_signs(t)
	gx.signs = t
end

function gx.set_gg_visible(visible)
	gx._visible = visible
end

function gx.add_menu(menu)
	if gx._menus ~= 0 then
		if gx._menus["main"] ~= nil then
			if menu.name == "main" then
				gg.toast("Menu with name \"main\" was declared twice, exiting...")
				os.exit()
			end
		elseif menu.name == "main" and menu.type == "back" or menu.type == "xback" then
			gg.toast("Menu with name \"main\" cannot be \""..menu.type.."\" type, exiting...")
			os.exit()
		end
	end

	if menu.name == "main" then
		gx._nav = {}
		gx._nav[1] = {name = menu.name, allow_stay = true}
	end

	if menu.type == "choice" or menu.type == "back" or menu.type == "xback" then
		if type(menu.menu[1]) == "function" then
			if #menu.menu == 1 then
				menu["use_menu_function"] = true
				menu["use_single_function"] = true
			else
				gg.toast("Menu \""..menu.name.."\" has invalid menu property")
			end
		else
			local list = gx.split_menu(menu.menu)
			menu.menu = list.menu
			menu.functions = list.functions
		end
	elseif menu.type == "multi_choice" or menu.type == "multi_choice_s" then
		if menu.use_single_function ~= true then
			local list = gx.split_menu(menu.menu)
			menu.menu = list.menu
			menu.functions = list.functions
		end
	else
		if menu.type == nil then
			gg.alert("Menu \""..menu.name.."\" has nil type, exiting...")
		else
			gg.toast("Unrecognized type \""..menu.type.."\", exiting...")
		end
		os.exit()
	end

	if menu.f == nil then
		menu.f = {}
	end
	menu.bools = {}
	menu.old_ind = {}

	gx._menus[menu.name] = menu
end

function gx.go_back()
	table.remove(gx._nav)
	gx.continue()
end

gx._back_function = gx.go_back

function gx.set_language(l)
	gx._lang = l
end

function gx.set_fallback_language(fl)
	gx._fback_lang = fl
end

function gx.load_languages(tbl)
	gx._langs = tbl
end

function gx.get_sentence(sname, l)
	if l == nil then l = gx._lang end
	if gx._langs[l][sname] ~= nil then return gx._langs[l][sname] end
	if gx._langs[gx._fback_lang][sname] ~= nil then return gx._langs[gx._fback_lang][sname] end
	return sname
	-- return "hey"
end

function gx.switch_language()
	gx._lang = gx.get_ind_h_next(gx._langs, gx._lang)
end

function gx.set_menu_lang(menu_name)
	gx._menus[menu_name].lang = gx._lang

	if gx._menus[menu_name]._menu == nil then
		gx._menus[menu_name]._menu = {}
		gx.copy_table(gx._menus[menu_name].menu, gx._menus[menu_name]._menu)
		if type(gx._menus[menu_name].title) == "table" then
			gx._menus[menu_name]._title = {}
			gx.copy_table(gx._menus[menu_name].title, gx._menus[menu_name]._title)
		else
			gx._menus[menu_name]._title = gx._menus[menu_name].title
		end
	else
		gx._menus[menu_name].menu = {}
		gx.copy_table(gx._menus[menu_name]._menu, gx._menus[menu_name].menu)
		if type(gx._menus[menu_name]._title) == "table" then
			gx._menus[menu_name].title = {}
			gx.copy_table(gx._menus[menu_name]._title, gx._menus[menu_name].title)
		else
			gx._menus[menu_name].title = gx._menus[menu_name]._title
		end
	end

	if gx._menus[menu_name].use_menu_functon then
		gx._menus[menu_name].menu = gx.generate_menu(gx._menus[menu_name].menu)
	end

	gx._menus[menu_name].title = gx.text.translate(gx._menus[menu_name].title)
	gx._menus[menu_name].menu = gx.text.translate(gx._menus[menu_name].menu)
end

function gx.process_title(title)
	_title = ""
	if type(title) == "table" then
		for k, v in ipairs(title) do
			if type(v) == "table" then
				if #v > 0 then
					if #v == 1 then
						_title = _title..v[1]()
					else
						_title = _title..v[1](table.unpack(gx.format_args(v[2], nil, nil)))
					end
				end
			else
				_title = _title..v
			end
		end
	else
		_title = title
	end

	return _title
end

function gx.generate_menu(f)
	if #f == 1 then
		return f[1]()
	else
		return f[1](table.unpack(f[2]))
	end
end

function gx.process_a_function(f)
	if f == nil then return end
	if type(f) ~= "table" then 
		gg.toast("\"pre_f/post_f\" is not a table")
		return
	end

	if #f > 0 then
		if #f == 1 then
			f[1]()
		else
			f[1](table.unpack(gx.format_args(f[2], nil, nil)))
		end
	end
end

function gx.process_functions(functions, ind, bool)
	if type(ind) == "number" then
		ind = {ind}
	end

	if bool == nil then
		bool = {}
	end

	for k, i in ipairs(ind) do
		if #functions[i] > 0 then
			if #functions[i] == 1 then
				functions[i][1]()
			else
				functions[i][1](table.unpack(gx.format_args(functions[i][2], i, bool[i])))
			end
		end
	end
end

function gx.process_single_function(f, ind, bool)
	if bool == nil then
		bool = {}
	end

	if #f > 0 then
		if #f == 1 then
			f[1]()
		else
			f[1](table.unpack(gx.format_args(f[2], ind, bool)))
		end
	end
end

function gx.open_menu(menu_name)
	if gx._menus[menu_name] == nil then
		gg.toast("Menu \""..menu_name.."\" doesn't exist.")
		return
	elseif gx._lang ~= gx._menus[menu_name].lang or gx._menus[menu_name].use_menu_functon then
		gx.set_menu_lang(menu_name)
	end

	local the_menu = {}
	gx.copy_table(gx._menus[menu_name], the_menu)
	local allow_stay = false
	gx.process_a_function(the_menu.pre_f)
	local _title = gx.process_title(the_menu.title)

	if the_menu.type == "back" then
		allow_stay = true
	else
		allow_stay = false
	end

	if gx._nav[#gx._nav].name ~= menu_name then
		gx.add_to_nav({name = the_menu.name, allow_stay = allow_stay})
	end

	if the_menu.use_menu_function == true and type(the_menu.menu[1]) == "function" then
		the_menu.menu = gx.generate_menu(the_menu.menu)
	end

	local ind = nil
	local _ib = nil

	if the_menu.type == "choice" or the_menu.type == "back" or the_menu.type == "xback" then
		if the_menu.type ~= "choice" then
			table.insert(the_menu.menu, gx._back)
		end
		local _m = gx.render_menu(the_menu.menu, the_menu.bools)
		ind = gg.choice(_m, nil, _title)
		if ind == nil then return end
		if the_menu.type ~= "choice" then
			table.remove(_m)

			if ind == #the_menu.menu then
				gx._back_function()
				return
			end
		end
		_ib = gx.make_ib(ind, #_m, gx._menus[menu_name].bools)
	elseif the_menu.type == "multi_choice" or the_menu.type == "multi_choice_s" then
		local _m = gx.render_menu(the_menu.menu, the_menu.bools)
		local _b = nil
		if the_menu.type == "multi_choice_s" then _b = the_menu.bools end
		ind = gg.multiChoice(_m, _b, _title)
		if ind == nil then return end
		_ib = gx.split_index(ind, #_m)
		if the_menu.type == "multi_choice_s" then
			gx._menus[menu_name].old_ind = _ib.index
			_ib.index = gx.index_diff(the_menu.old_ind, _ib.index)
			if #_ib.index == 0 then return end
		elseif the_menu.type == "multi_choice" then
			_ib.bools = gx.switch_bools(_ib.index, the_menu.bools)
		end
	else
		gg.toast("Non existing menu type: "..the_menu.type..". Exiting...")
		os.exit()
	end

	ind = _ib.index
	gx._menus[menu_name].bools = _ib.bools

	if the_menu.use_single_function == true then
		gx.process_single_function(the_menu.f, ind, gx._menus[menu_name].bools)
	else
		gx.process_functions(the_menu.functions, ind, gx._menus[menu_name].bools)
	end

	gx.process_a_function(the_menu.post_f)

	if the_menu.menu_repeat == true and gx._nav[#gx._nav].name == menu_name and gx._block_repeat ~= true then
		gx.open_menu(the_menu.name)
	end

	gx._block_repeat = false
end

function gx.nav_update()
	while #gx._nav > 1 do
		if gx._nav[#gx._nav].allow_stay == false then
			table.remove(gx._nav)
		else
			break
		end
	end
end

function gx.continue()
	gx.open_menu(gx._nav[#gx._nav].name)
end

function gx.start()
	if gx._nav == nil then
		gg.toast("No menu was found, exiting...")
		os.exit()
	elseif gx._nav[1].name ~= "main" then
		gg.toast("No Main menu was found, exiting...")
		os.exit()
	end

	gx.nav_update()
	gx.continue()
end

function gx.isClicked(visible)
	if gg.isVisible() then
		gg.setVisible(visible or false)
		return true
	end
	return false
end

function gx.loop(interval, update_f, visible)
	gx._interval = interval
	gx._visible = visible
	gg.setVisible(false)

	while true do
		if update_f == nil then
			while true do
				if gx.isClicked(gx._visible) then
					gx.start()
					if gx._visible then
						while true do
							if not gg.isVisible() then
								break
							end
							gg.sleep(gx._interval)
						end
					end
				end
				gg.sleep(gx._interval)
			end
		else
			while true do
				if gx.isClicked(gx._visible) then
					gx.start()
					if gx._visible then
						while true do
							if not gg.isVisible() then
								break
							end
							update_f()
							gg.sleep(gx._interval)
						end
					end
				end
				update_f()
				if gx._interval ~= 0 then
					gg.sleep(gx._interval)
				end
			end
		end
	end
end

-- [[ Editor functions ]] --

gx.editor = {
	types = {
		D = gg.TYPE_DWORD,
		Q = gg.TYPE_QWORD,
		F = gg.TYPE_FLOAT,
		B = gg.TYPE_BYTE
	},
	types_str = {"D", "Q", "F", "B"}
}

gx.editor.set = function(data)
	if type(data) == "string" then
		data = gx.editor.parser.parse(data)
	end

	for k, v in ipairs(data) do
		if type(v.flags) == "string" then
			v.flags = gx.editor.types[v.flags]
		end

		if v.freeze == true then
			gg.addListItems({v})
		else
			gg.removeListItems({v})
		end
	end

	gg.setValues(data)
end

gx.editor.prompt_set = function(data, titles, f)
	if type(titles) ~= "table" then
		gg.toast("Argument \"titles\" is given wrong")
		return
	end

	titles = gx.text.translate(titles)

	if type(data) == "string" then
		data = gx.editor.parser.parse(data)
	end

	local _types = {}

	for k, v in ipairs(data) do
		if type(v.flags) == "string" then
			v.flags = gx.editor.types[v.flags]
		end
		table.insert(_types, "number")
	end

	local _data = gx.editor.get(data)

	for k, v in pairs(_data) do
		_data[k] = _data[k].value
	end

	local values = gg.prompt(titles, _data, _types)
	if values == nil then return end

	for k, v in ipairs(data) do
		if values[k] == "" then values[k] = _data[k] end
		v.value = values[k]
	end

	if f then
		data = f(data)
	end

	gx._block_repeat = true
	gx.editor.set(data)
end

gx.editor.get = function(data)
	if type(data) == "string" then
		data = gx.editor.parser.parse(data)
	end

	for k, v in ipairs(data) do
		if type(v.flags) == "string" then
			v.flags = gx.editor.types[v.flags]
		end
	end

	return gg.getValues(data)
end

gx.editor.set_string = function(data)
	local values = {}

	for k, v in ipairs(data) do
		local _address = v[1]
		local _bytes = gg.bytes(v[2])
		local _len = v[3]
	
		if #_bytes < _len then
			local _len2 = _len - #_bytes
			for i = 1, _len2 do
				table.insert(_bytes,0)
			end
		end
	
		for i = 1, _len do
			table.insert(values, {address = _address + (i - 1), flags = gg.TYPE_BYTE, value = _bytes[i]})
		end
	end

	gg.setValues(values)
end

gx.editor.get_string = function(data)
	local values = {}

	for k, v in ipairs(data) do
		local _string = ""
		local _address = v[1]
		local _len = v[2]

		for i = 0, _len do
			_byte = gx.editor.get({{address = _address + i, flags = 'B'}})[1].value
	
			if _byte < 1 then break end
	
			_string = _string .. string.char(_byte)
		end
		table.insert(values, _string)
	end

	return values
end

gx.editor.switch = function(data, bool)
	if type(data) == "string" then
		data = gx.editor.parser.parse(data)
		for k, v in ipairs(data) do
			v.bool = bool
		end
	end

	for k, v in ipairs(data) do
		if v.bool == true then
			if type(v.value) == "table" then
				v.value = v.value[2]
			end
			if type(v.freeze) == "table" then
				v.freeze = v.freeze[2]
			end
		else
			if type(v.value) == "table" then
				v.value = v.value[1]
			end
			if type(v.freeze) == "table" then
				v.freeze = v.freeze[1]
			end
		end
	end

	gx.editor.set(data)
end

gx.editor.parser = {
	parse = function(text) -- address = a, flags = [D, F, Q, B], freeze = f
		local adds = {}
		local texts = gx.split_string(text, ";")
	
		for k, v in ipairs(texts) do
			adds[#adds + 1] = {}
			local _v = v:gsub("%s+|", "|"):gsub("|%s+", "|")
			local results = gx.split_string(_v)
			for i, j in ipairs(results) do
				local suf = j:sub(#j, #j)
				if suf == "a" then
					adds[#adds].address = tonumber(j:sub(1, #j - 1))
				else
					if gx.indexof(suf, gx.editor.types_str) or suf == "f" then
						local t = j:find("|")
						local tx = j
						if t == nil then
							if suf == "f" then
								adds[#adds].freeze = true
								tx = tx:sub(1, #tx - 1)
							end
							adds[#adds].flags = tx:sub(#tx, #tx)
							adds[#adds].value = tonumber(tx:sub(1, #tx - 1))
						else
							local v1, v2, f1, f2
							v1, v2 = table.unpack(gx.split_string(j, "|"))
							f1 = v1:sub(#v1, #v1)
							f2 = v2:sub(#v2, #v2)
							adds[#adds].freeze = {f1 == "f", f2 == "f"}
							if adds[#adds].freeze[1] then
								v1 = v1:sub(1, #v1 - 1)
							end
							if adds[#adds].freeze[2] then
								v2 = v2:sub(1, #v2 - 1)
							end
							adds[#adds].flags = v2:sub(#v2, #v2)
							adds[#adds].value = {v1:sub(1, #v1 - 1), v2:sub(1, #v2 - 1)}
						end
					end
				end
			end
		end
		-- gg.alert(tostring(adds))
		return adds
	end
}

-- [[ Text Processing ]] --

gx.text = {
	ucase = "ABCDEFGHIJKLMNOPQRSTUVWXYZ",
	lcase = "abcdefghijklmnopqrstuvwxyz",
	numbers = "0123456789",
	punc = '!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~'
}

gx.text.translate = function(data, l)
	if l == nil then l = gx._lang end
	if gx._langs[l] == nil then
		gg.toast("Language undefined: \""..tostring(l).."\". Falling back to \""..gx._fback_lang.."\"")
		l = gx._fback_lang
	end
	if gx._langs[l] == nil then
		gg.toast("Language undefined: "..tostring(l))
		return data
	end

	local is_string = false

	if type(data) == "string" then
		data = {data}
		is_string = true
	end

	for k, v in pairs(data) do
		if type(data[k]) == "string" then
			while true do
				local _s = data[k]:find("{gx@")
				local _e = data[k]:find("}", fe)
	
				if _s ~= nil and _e ~= nil then
					if _e - _s > 0 then
						local name = data[k]:sub(_s, _e)
						local sname = name:sub(name:find("@") + 1, name:find("}") - 1)
						local sentence = gx.get_sentence(sname, l)
						data[k] = data[k]:gsub(name, sentence)
					else
						fe = _e + 1
					end
				else
					break
				end
			end
		elseif type(data[k]) == "table" then
			data[k] = gx.text.translate(data[k], l)
		end
	end

	if is_string then
		data = data[1]
	end

	return data
end

-- [[ Extractors ]] --

gx.extract = {}

gx.extract.values = function(tbl)
	local _tbl = {}

	for k, v in ipairs(tbl) do
		table.insert(_tbl, v.value)
	end

	return _tbl
end

gx.extract.address = function(tbl)
	local _tbl = {}

	for k, v in ipairs(tbl) do
		table.insert(_tbl, v.address)
	end

	return _tbl
end

gx.extract.arg = function(tbl, arg)
	local _tbl = {}

	for k, v in ipairs(tbl) do
		table.insert(_tbl, v[arg])
	end

	return _tbl
end

-- [[ Packers ]] --

gx.pack = {}

gx.pack.values = function(tbl, values)
	for k, v in pairs(values) do
		tbl[k].value = v
	end

	return tbl
end

gx.pack.address = function(tbl, addresses)
	for k, v in pairs(addresses) do
		tbl[k].addresses = v
	end

	return tbl
end

gx.pack.args = function(tbl, values, arg_name)
	for k, v in pairs(values) do
		tbl[k][arg_name] = v
	end

	return tbl
end




















function sign(b)
	if b then return on else return off end
end

function getadd(add,flag)
	local a = {
		[1] = {address = add, flags = flag}
	}

	b = gg.getValues(a)
	return tonumber(b[1].value)
end

function setadd(add,flag,val,bfreeze)
	local uu = {}

	uu[1] = {
		address = add,
		flags = flag,
		value = val,
		freeze = bfreeze
	}

	gg.setValues(uu)

	if bfreeze then 
		gg.addListItems(uu)
	else
		if indexof(sarray,uu[1].address) == -1 then
			gg.removeListItems(uu)
		else
			gg.addListItems(uu)
		end
	end
end

function setstr(addr,range,str)
	nn = gg.bytes(str)
	hv = {}

	if #nn < range then
		mm = range - #nn
		for i = 1, mm do
			table.insert(nn,0)
		end
	end

	for i = 1, range do
		table.insert(hv,{address = addr + (i - 1),flags = gg.TYPE_BYTE,value = nn[i]})
	end

	gg.setValues(hv)
end

function addtostr(add,amount)
	mp = ''

	for i = 0, amount do
		mu = getadd(add + i,gg.TYPE_BYTE)

		if mu < 1 then break end

		mp = mp .. string.char(mu)
	end

	return mp
end

function indexof(a,b)
	for k, v in ipairs(a) do
		if v == b then
			return k 
		end
	end

	return -1
end

function has(t, a)
	for i, v in ipairs(t) do
		if v == a then
			return true
		end
	end

	return false
end

-----------------------------------

function get_map()
	local c = ""
	local c1 = ""

	for i = 0, 23 do
		c1 = getadd(curmap + i, gg.TYPE_BYTE)

		if c1 == 47 then
			break
		end

		c = c..string.char(c1)
	end

	return c
end

function get_map_name()
	local c = get_map()

	for i, v in ipairs(maps) do
		if v[2] == c then
			return v[1]
		end
	end

	return nil
end

function get_family_by_map(map)
	local family = nil

	for i, v in ipairs(crpoints) do
		if v.map == map then
			family = v.family
			break
		end
	end

	return family
end

function get_names(list)
	local nm = {}

	for i, v in ipairs(list) do
		table.insert(nm, v.name)
	end

	return nm
end

function get_pos_by_name(list, name)
	for i, v in ipairs(list) do
		if v.name == name then
			return {x = v.x, y = v.y, z = v.z}
		end
	end

	return nil
end

function make_points_list(map)
	local m = {}

	for i, v in ipairs(crpoints) do
		if v.map == map then
			table.insert(m, v)
		end
	end

	return m
end

function make_fastpoints_list(family)
	return
end

function make_map_list(family)
	local m = {}

	for i, v in ipairs(crpoints) do
		if v.family == family then
			if not(has(m, v.name)) then
				table.insert(m, v.name)
			end
		end
	end

	return m
end

function make_positions(map)
	local points = {}

	for i, v in ipairs(posits) do
		if v.map == map then
			table.insert(points, v)
		end
	end

	return points
end

-----------------------------------

function find_adds()
	bootloader = gg.getRangesList('libBootloader.so')[1].start
	player = getadd(bootloader + offsets.ptoplayer, gg.TYPE_QWORD)
	player_r = player + offsets.pos_off + 0x20
	pbase = player + offsets.ptopbase
	nentity = getadd(bootloader + offsets.ptoentity, gg.TYPE_QWORD) + offsets.ptonentity
	nentity_test = getadd(nentity, gg.TYPE_DWORD) == 1099746509

	if not(nentity_test) then
		gg.searchNumber(1099746509, gg.TYPE_DWORD)
		
		if gg.getResultsCount() > 0 then
			nentity = gg.getResults(1)[1].address
			nentity_test = getadd(nentity, gg.TYPE_DWORD) == 1099746509
		end
	end

	if not(nentity_test) then
		gg.toast("Error, some functions may not work.")
	else
		curmap = nentity + offsets.curmap_off
	end
end

function find_pos()
	local coords = {
		z = player + offsets.pos_off,
		y = player + offsets.pos_off + 4,
		x = player + offsets.pos_off + 8
	}

	return coords
end

function find_candles()
	if nentity_test then
		local c = {}

		local n = nentity + 0x1D4
		for i=1, 650 do
			table.insert(c, {address = n + (i - 1) * 0x1C0, flags = gg.TYPE_FLOAT, value = 0, name = 'cndl', freeze = false})
		end

		return c
	else
		return {}
	end
end

function find_plants()
	if nentity_test then
		local m = {}

		for i=1, 511 do
			m[i]= {address = nentity + offsets.plants + ((i - 1) * 8), flags = gg.TYPE_FLOAT}
		end

		local plants = gg.getValues(m)

		return plants
	else
		return {}
	end
end

function find_nodes()
	if nentity_test then
		local n = {}
		local offs = nentity + offsets.friend_node

		local mx = 45

		for i = 0, mx do
			if string.find(addtostr(offs + i * 0x2E8 + 0x1, 20), "aceptar_") then
				table.insert(n, {offs + i * 0x2E8 + offsets.node_off, getadd(offs - offsets.node_off, gg.TYPE_DWORD)})
			end
		end

		gg.toast("Found "..#n.." friendship nodes")
		return n
	else
		return {}
	end
end

find_adds()

-- Teleport variables
coords = find_pos()

candle = coords['x'] - offsets.hcandle
prop_bckp = nil
cape_bckp = nil

wind_bckp = {}

custom_teleport_points = {}

-- Hack variables

inffire = off
fakesleep = off

autoburn = off
candles = find_candles()
plants = find_plants()
cosmetics = off
friendnode_unlock = off
friend_nodes = nil -- this has to be found only after logging in { deprecated :) }
energy = off
quick = off
quick_results = nil
clouds = off
clouds_results = nil
cosmetic_lock = off
chat_read = off
noknock = off
godmode = off
walkwithinst = off
cur_cape = nil
cur_world1 = nil
oonaki = off
oonaki_resulfs = nil
capespam = off

gg.setRanges(old_ranges)
gg.clearResults()

-- Finding Value of Speed of Walk --

gg.setRanges(gg.REGION_C_DATA)
gg.searchNumber('3.5', gg.TYPE_FLOAT)
quick_results = gg.getResults(1)
gg.clearResults()

------------------------------------

------ Finding Value of Clouds -----

gg.searchNumber('1D;0.15000000596F;0.5F;1.0F;0.40000000596F::25', gg.TYPE_DWORD)
clouds_results = gg.getResults(1)
gg.clearResults()

------------------------------------

function set_game_speed(speed)
	setadd(nentity + offsets.gamespeed_off, gg.TYPE_FLOAT, speed, false)
end

i = 0

function change_map(mp)
	setstr(player + offsets.portal_off, 30, '.' .. mp)
	set_game_speed(10)
	pmagic(8, 224110574, 0)
	gg.sleep(1000)
	set_game_speed(1)
	setstr(player + offsets.portal_off, 30, '.Rain_Cave')
	pmagic(8, 0)
end

function setposit(mx,my,mz)
	jh = {
		{
			address = coords['z'],
			flags = gg.TYPE_FLOAT,
			value = mx
		},
		{
			address = coords['y'],
			flags = gg.TYPE_FLOAT,
			value = my
		},
		{
			address = coords['x'],
			flags = gg.TYPE_FLOAT,
			value = mz
		}
	}
	gg.setValues(jh)
end

function pmove(dis)
	local x,y,z = getadd(coords['z'], gg.TYPE_FLOAT), getadd(coords['y'], gg.TYPE_FLOAT), getadd(coords['x'], gg.TYPE_FLOAT)
	local radin = getadd(player_r, gg.TYPE_FLOAT)
	
	local ax = dis * math.sin(radin)
	local az = dis * math.cos(radin)

	setposit(x + ax,y,z + az)
end

function show_candles(bool)
	local xv = {}
	for i = 0,512 do
		if getadd(nentity + offsets.vcandles + (offsets.vcandles_dist * i) - 0x4,gg.TYPE_DWORD) ~= 0 then
			if bool then
				table.insert(xv,{address = nentity + offsets.vcandles + (offsets.vcandles_dist * i),flags = gg.TYPE_DWORD,value = 28673})
			else
				table.insert(xv,{address = nentity + offsets.vcandles + (offsets.vcandles_dist * i),flags = gg.TYPE_DWORD,value = 0})
			end			
		else
			break;
		end
	end

	gg.toast(#xv)
	gg.setValues(xv)
end

function set_autoburn(b)
	if b then
		autoburn = on

		for i, v in ipairs(candles) do
			v.value = 1.0
			v.freeze = true
		end
		
		gg.setValues(candles)
		gg.addListItems(candles)

		for i, v in ipairs(plants) do
			v.value = 0.0
			v.freeze = true
		end

		gg.setValues(plants)
		gg.addListItems(plants)

	else
		autoburn = off

		for i, v in ipairs(candles) do
			v.value = 0.0
			v.freeze = false
		end
		
		gg.setValues(candles)
		gg.removeListItems(candles)

		for i, v in ipairs(plants) do
			v.value = 1.0
			v.freeze = false
		end

		gg.setValues(plants)
		gg.removeListItems(plants)
	end
end

function clamp(n, a, b)
	if n < a then return a end
	if n > b then return b end
	return n
end

function getAction()
	actionmenu = gg.choice({
		"⬅️ Previous",
		"➡️ Next",
		"❌ END!",
		"🛑 ABORT!"
	}, nil, "choose:")

	if actionmenu == 1 then
		return -1
	elseif actionmenu == 2 then
		return 1
	elseif actionmenu == 3 then
		return 0
	elseif actionmenu == 4 then
		return -999
	end
end

function get_next_map(map)
	local back = {}
	local next = {}
	local maps = {}
	local mps = {}

	for i, v in ipairs(crpoints) do
		if indexof(mps, v.map) == -1 then
			table.insert(mps, v.map)
			table.insert(maps, {name = v.name, map = v.map})
		end
	end

	if map == mps[1] then
		back = maps[#maps]
		next = maps[2]
   return {b = back, n = next}
	elseif map == mps[#mps] then
		back = maps[#maps - 1]
		next = maps[1]
    return {b = back, n = next}
	else
		for i, v in ipairs(maps) do
			if v.map == map then
				back = maps[i - 1]
				next = maps[i + 1]
	

			 return {b = back, n = next}

			end
		end
	end

	return nil
end

function PointsEnd(map)
	local n = get_next_map(map)
	local mmenu = {
		"⬅️|"..n.b.name,
		"➡️|"..n.n.name,
		"✔️| Done!"
	}

	if n ~= nil then
		while true do
			gg.setVisible(false)
			action = gg.choice(mmenu, nil, "We are in: "..get_map_name().."\n (Teleport just for you)")
			
			if action == nil then
				while true do
					if gg.isVisible(true) then
						gg.setVisible(false)
						break
					end

					gg.sleep(500)
				end
			else
				break
			end
		end

		if action == #mmenu then
			gg.toast("Done!")
		elseif action == 1 then
			ChangeMapDoPoints(n.b.map)
		elseif action == 2 then
			ChangeMapDoPoints(n.n.map)
		end

	else
		gg.toast("Next map no found")
		return
	end
end

function gotomenu()
    local map = get_map()

    ppoints = make_positions(map)

    if ppoints ~= nil then
        mp_names = get_names(ppoints)
        place = gg.choice(mp_names, nil, "Where do you want to go?")

        if place == nil then
            return
        end

        pos = get_pos_by_name(ppoints, mp_names[place])
        setposit(pos.x, pos.y, pos.z)

        gg.toast(place)
    else
        gg.toast("there are no places to go here.")
    end
end

function ChangeMapDoPoints(map)
	local cur_map = get_map()
	change_map(map)

	while cur_map ~= map do
		gg.sleep(1000)
		cur_map = get_map()
	end

	gg.sleep(1000)

	while true do
		if gg.isVisible(true) then
			gg.setVisible(false)
			break
		end
		gg.sleep(500)
	end

	DoPoints(make_points_list(map))
end

function ChangeMapDoPoints(map)
	local cur_map = get_map()
	change_map(map)

	while cur_map ~= map do
		gg.sleep(1000)
		cur_map = get_map()
	end

	gg.sleep(1000)

	while true do
		if gg.isVisible(true) then
			gg.setVisible(false)
			break
		end
		gg.sleep(500)
	end

	DoPoints(make_points_list(map))
end

function DoPoints(points, cr_mode, use_candle)
	local b = false
	local stopped = false

	if settings.useautoburn then
		if autoburn == off then
			set_autoburn(true)
			b = true
		end
	end

	if use_candle == nil then
		use_candle = false
	end

	if cr_mode == nil then
		cr_mode = false
	end

	local bckp_values = gg.getValues({
		{address = coords.x, flags = gg.TYPE_FLOAT},
		{address = coords.y, flags = gg.TYPE_FLOAT},
		{address = coords.z, flags = gg.TYPE_FLOAT},
	})

	local i = 1
	local t = 0
	local st = 250
	local endt = 60000

	while i <= #points do
		gg.toast(tostring(i).." / "..#points)
	
		if use_candle then
			gg.setValues({{address = candle, flags = gg.TYPE_BYTE, value = 1}})
		end
	
		gg.setValues({
			{address = coords['x'], flags = gg.TYPE_FLOAT, value = points[i].x},
			{address = coords['y'], flags = gg.TYPE_FLOAT, value = points[i].y},
			{address = coords['z'], flags = gg.TYPE_FLOAT, value = points[i].z}
		})
	
		if not(points[i].e == true) and not(i == #points) then
			while true do
				if gg.isVisible(true) then
					gg.setVisible(false)
					a = 1
					break
				else
					gg.sleep(st)
					t = t + st

					if t >= endt then
						gg.toast("Manual mode")
						break
					end
				end
			end

			while t >= endt do
				if gg.isVisible(true) then
					gg.setVisible(false)

					a = getAction()

					if a ~= nil then
						break
					end
				end
			end

			if a == -999 then
				gg.setValues(bckp_values)
				i = #points + 1
				stopped = true
			elseif a == 0 then
				stopped = true
				i = #points + 1
			else
				i = i + a
				if a == -1 then
					i = clamp(i, 1, #points)
					if points[i].e == true then
						i = i - 1
					end
				end
			end

			t = 0
		else
			i = i + 1
			gg.sleep(100)
		end
	end

	if b then
		set_autoburn(false)
	end

	if use_candle then
		gg.setValues({{address = candle, flags = gg.TYPE_BYTE, value = 0}})
	end

	if stopped == false then
		gotomenu()
	end
end

function settingsmenu()
	local smenu = gg.choice({
		"Distance breackwall: "..settings.wdistance,
		"Use Autoburn in AutoCandleRun: "..sign(settings.useautoburn)
	}, nil, "settings:")

	if smenu == nil then 
		return
	end

	if smenu == 1 then
		local wbd = gg.prompt({"Default distance: "..settings.wdistance}, {[1] = settings.wdistance}, {[1] = "number"})
		if wbd ~= nil then
			settings.wdistance = wbd[1]
		end

		gg.toast("Distance breackwall: "..settings.wdistance)
	elseif smenu == 2 then
		settings.useautoburn = not(settings.useautoburn)
		gg.toast("Use Autoburn in AutoCandleRun: "..sign(settings.useautoburn))
	end
end

function update()
	if cosmetic_lock == on then
		ccape2 = gg.getValues({
			{address = player + offsets.cape2_off, flags = gg.TYPE_DWORD}
		})[1].value

		if cur_cape ~= ccape2 then
			ccape = gg.getValues({
				{address = player + offsets.cape_off, flags = gg.TYPE_DWORD}
			})[1].value

			if ccape == ccape2 then
				wrld = get_map()
				if cur_world1 ~= wrld then
					capeset(cur_cape, false)
					cur_world1 = wrld
				end
			else
				capeset(ccape2, false)
				cur_cape = ccape2
			end
		end
	end
end
function getCords()
    local array = {};
    local bool;
    local map = get_map();
    for i, v in ipairs(crpoints) do
        if v.map == map then
            bool = true;
            table.insert(array, {v.x, v.y, v.z});
        end
    end
    return array, bool;
end
function FastCR(name)
	local m = nil
	local points = fastpoints[name]

	local after = 3000
	local skip_p = false
	local skip = false

	m = get_map()

	for i, v in ipairs(points) do
		if m ~= v.map then
			change_map(v.map)
		end

		gg.sleep(3000)

		m = get_map()

		if m ~= v.map then
			gg.toast("Please, enter "..name.." or be at Home and try again.")
			return
		end
		break
	end

	for i, v in ipairs(points) do
		skip_p = false
		skip = false

		if v.type == "tp" or v.type == "tp-mv" then 
			while get_map() ~= v.map do
				gg.sleep(2000)
			end

			change_map(v.to_map)

			while get_map() ~= v.to_map do
				gg.sleep(2000)
			end 

			if v.type == "tp" then
				skip_p = true
			end

			gg.sleep(2000)
			
		elseif v.type == "mv" then
			while get_map() ~= v.map do
				gg.sleep(2000)
			end

			skip = v.skip

			if skip then
				gg.sleep(3000)
			end
		end

		if skip_p ~= true then
			gg.setValues({
				{address = coords['x'], flags = gg.TYPE_FLOAT, value = v.x},
				{address = coords['y'], flags = gg.TYPE_FLOAT, value = v.y},
				{address = coords['z'], flags = gg.TYPE_FLOAT, value = v.z}
			})
		end
		
		if skip ~= true then
			AbsorbWings()
		end

		if skip ~= true then
			collect_waxes()
		end

		gg.sleep(after)
	end
end
function AbsorbWings()
    local offset = nentity + offsets.wl_pos
    local values1 = {}
    local values2 = {}
    local count = 0

    for i = 0, 11 do
        ad = offset + i * 0x130 + 0xA8
        st = getadd(ad, gg.TYPE_DWORD)

        if st == 1 then
            count = count + 1
            table.insert(values1, {address = ad, value = 4, flags = gg.TYPE_DWORD})
            table.insert(values2, {address = ad, value = 8, flags = gg.TYPE_DWORD})
        end
    end

    gg.setValues(values1)
    gg.sleep(200)
    gg.setValues(values2)
    
    if count == 0 then
        gg.toast("Aqui no se encuentran alas")
    else
        gg.toast("Alas encontradas: "..count)
    end            
end
function getposit()
	local values = gg.getValues({
		{address = coords["z"], flags = gg.TYPE_FLOAT},
		{address = coords["y"], flags = gg.TYPE_FLOAT},
		{address = coords["x"], flags = gg.TYPE_FLOAT},
	})

	return {
		x = values[1].value,
		y = values[2].value,
		z = values[3].value
	}
end

i = 0

function UnlockSeason()
	gg.setRanges(gg.REGION_CODE_APP)
	gg.searchNumber("7037807", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
	revert = gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)
	gg.editAll("0", gg.TYPE_QWORD)
	gg.clearResults()
	gg.toast(" CLEAR QUEST ON ")
end

function rapidfarm()
	local cords, bool = getCords();
    if bool then
        for i, v in ipairs(cords) do
			if gg.isVisible(true) then
				break;
			end
            gg.setValues({
            {
                address = coords.x,
                flags = gg.TYPE_FLOAT,
                value = v[1],
            },
            {
                address = coords.y,
                flags = gg.TYPE_FLOAT,
                value = v[2],
            },
            {
                address = coords.z,
                flags = gg.TYPE_FLOAT,
                value = v[3],
            },
        });
        gg.sleep(700);
        end
    else
        return gg.toast("There are no routes here at the moment");
    end
end

function slowfarm()
	local map = get_map()
	local family = get_family_by_map(map)

	if family ~= nil then
		if gg.alert("Press GG icon to move, let's go for wax in "..get_map_name().."?", "Yes", "Cancelar") == 1 then
			DoPoints(make_points_list(map))
		else
			return
		end
	else
		if map == "CandleSpace" then
			gg.toast("You are at Home. Enter the portal first!")
		else
			gg.toast("we can't look for candles in "..get_map_name())
		end
	end
end

function _goto()
	local map = get_map()

	ppoints = make_positions(map)

	if ppoints ~= nil then
		mp_names = get_names(ppoints)
		place = gg.choice(mp_names, nil, "Where we go?")

		if place == nil then
			return
		end

		pos = get_pos_by_name(ppoints, mp_names[place])
		setposit(pos.x, pos.y, pos.z)

		gg.toast(place)
	else
		gg.toast("no places to go.")
	end
end

function changemap()
	mps = {}
	for i, v in ipairs(maps) do
		table.insert(mps, v[1])
	end

	local mpchoice = gg.choice(mps, nil, "Where we go?")

	if mpchoice == nil then
		return
	else
		change_map(maps[mpchoice][2])
	end
end



function autorun()
	realms = {
		"Isle",
		"Prairie",
		"Vault"
	}
	
	mmenu = gg.choice(realms, nil, "select map: ")
	
	if mmenu ~= nil then
		FastCR(realms[mmenu])
	end
end


function show_location()
	values = gg.getValues({
		{address = coords['x'], flags = gg.TYPE_FLOAT},
		{address = coords['y'], flags = gg.TYPE_FLOAT},
		{address = coords['z'], flags = gg.TYPE_FLOAT},
	})

	crds = {
		x = tostring(values[1].value),
		y = tostring(values[2].value),
		z = tostring(values[3].value)
	}

	gg.choice({
		"X : "..crds['x'],
		"Y : "..crds['y'],
		"Z : "..crds['z']
	})
end

function set_wings()
	local c = gg.prompt({"Default: "..w}, {[1] = ""}, {[1] = "number"})

	if c == nil then
		return
	end

	c[1] = tonumber(c[1])

	if c[1] < 1 then
		gg.toast("cannot be less than 1")
		return
	end

	local b = false
	local a = gg.alert("Do you want to block??", "YES", "NO")

	if a == nil then
		return
	end

	if a == 1 then
		b = true
	end

	setadd(pbase, gg.TYPE_DWORD, c[1], b)
end

function throw_wings()
	local c = gg.prompt({"How many wings are you going to throw?"}, {[1] = ""}, {[1] = "Number"})

	if c == nil then
		return
	end

	c[1] = tonumber(c[1])

	if c[1] < 0 then
		gg.toast("The number cannot be negative.")
		return
	elseif c[1] > gx.vars.w then
		gg.toast("The number cannot be greater than the amount of wings.")
		return
	end

	setadd(player + offsets.damage, gg.TYPE_DWORD, c[1], false)
end

function explode_wings()
	if gg.alert("this will leave only one wing, are you sure?", "Yes", "No") == 1 then
		setadd(player + offsets.damage, gg.TYPE_DWORD, clamp(gx.vars.w - 1, 0, 100), false)
	end
end

function absorb_wings()
	local offset = nentity + offsets.wl_pos
    local values1 = {}
    local values2 = {}
    local count = 0

    for i = 0, 11 do
        ad = offset + i * 0x130 + 0xA8
        st = getadd(ad, gg.TYPE_DWORD)

        if st == 1 then
            count = count + 1
            table.insert(values1, {address = ad, value = 4, flags = gg.TYPE_DWORD})
            table.insert(values2, {address = ad, value = 8, flags = gg.TYPE_DWORD})
        end
    end

    gg.setValues(values1)
    gg.sleep(200)
    gg.setValues(values2)
    
    if count == 0 then
        gg.toast("there are no wings here")
    else
        gg.toast("Wings collect: "..count)
    end
end

function dospell(ind, bl)
	local mlist = {}
	local mids = {}
	ind = ind[1]
	gx._block_repeat = true
	if ind == 7 then
		gx._block_repeat = false
		gx.vars.sparkle = bl
	elseif ind == 9 then
		slotmenu = gg.multiChoice(mslot, nil, "Choose slots to remove:")
		if slotmenu == nil then
			return
		end
		for i, v in pairs(slotmenu) do
			mslot[i] = magicsid[1][1]
			pmagic(i, magicsid[1][2], 0, false)
		end
	else
		if ind == 8 then
			magicmenu = 1
			mlist[1] = "-- -- Manual -- --"
			mids[1] = gg.prompt({[1] = "Write Spell ID:"}, {[1] = ""}, {[1] = "number"})
			if mids[1] == nil then return end
			mids[1] = mids[1][1]
		else
			for i, v in ipairs(magicsid) do
				if v[3] == ind then
					table.insert(mlist, v[1])
					table.insert(mids, v[2])
				end
			end
			magicmenu = gg.choice(mlist, nil, "Choose spell:")
			if magicmenu == nil then
				return
			end
		end
		slotmenu = gg.choice(mslot, nil, "Choose slot:")
		if slotmenu == nil then return end
		mslot[slotmenu] = mlist[magicmenu]
		if gx.vars.sparkle then
			pmagic(slotmenu, mids[magicmenu], 0)
		else
			pmagic(slotmenu, mids[magicmenu], 257)
		end
	end
end

function inputnum(def)
    input = gg.prompt({
      "Default : " .. def
    }, {
      [1] = def
    }, {
      [1] = "number"
    })
    if input == nil then
      return def
    else
      return input[1]
    end
end

function noselect()
	gg.toast('You not select anything')
end


--suiscript

so = gg.getRangesList("libBootloader.so")[1].start
--setvalue(so + qh, 16, 8.89715548E-21)
--setvalue(so + qh, 16, 8.89715548E-21)
--gg.setVisible(so + qh)
gg.setRanges(gg.REGION_C_ALLOC)
gg.searchNumber("32,481,138,503,150,965", gg.TYPE_QWORD)
if gg.getResultsCount() == 0 then
  gg.setRanges(gg.REGION_OTHER)
  gg.searchNumber("32,481,138,503,150,965", gg.TYPE_QWORD, 8.89715548E-21, gg.SIGN_EQUAL, 0, -1, 1)
end
pl = gg.getResults(1)
addr = pl[1].address
sh = addr + 407040
sh2 = addr + 407044
pants = addr + 411068
hair = addr + 411060
mask = addr + 411064
neck = addr + 411068
prop = addr + 411084
wingl = addr + 239840
mfdz = addr + 452584

spc = on
sn1 = ""
sn2 = ""
sn3 = ""

spn1 = " "
spn2 = " "
spn3 = " "

local sl = "◉ "
local nsl = "○ "

local ont = "ON"
local offt = "OFF"
sui1 = cd
suiv1 = off
suiw1 = off
suiw2 = off
suiu1 = off
suiu2 = off
suiu3 = off
suiu4 = off
suiu5 = off
suic1 = off
suic2 = off
suic3 = off
suip1 = off
suip2 = off
suia1 = off
suia2 = off
suiwo1 = off
suiwo2 = off
suiwo3 = off
suio1 = off
suio2 = off
suio3 = off
suio4 = off
suio5 = off
suio6 = off
suio7 = off
suih1 = off
suiem1 = nsl
suiem2 = nsl
suiem3 = sl
suidm1 = nsl
suidm2 = nsl
suidm3 = nsl
suidm4 = sl
glow1 = nsl
glow2 = nsl
glow3 = sl

va = 4843048
va_v = 1.192416902995319E-7
em = 5791224
dm = 8284852
jm = 10530856
cu = 4423384
eu = 11653336
eu_v = -1.832657726481557E-4
fu = 9302916
hq = 10220592
bc = 7721784
bp = 6975592
bp_v = -1.8345301214139909E-4
aw1 = 12916960
aw2 = 20998692
sof = 5844836
sch = 6526064
sj = 10568736
fd = 10607792
rw = 7678172
rb = 6790380
rc = 23179080
qh = 9700316
ih = 5806924
uf = 9710428
uo = 5788448
ik1 = 5794336
ik2 = 5794340
fh = 5787580
ais = 8682216

function setvalue(address, flags, value)
	local tt = {}
	tt[1] = {}
	tt[1].address = address
	tt[1].flags = flags
	tt[1].value = value
	gg.setValues(tt)
end
function frzvalue(address, flags, value)
	local tt = {}
	tt[1] = {}
	tt[1].address = address
	tt[1].flags = flags
	tt[1].value = value
	tt[1].freeze = true
	gg.addListItems(tt)
end
function ufrzvalue(address, flags, value)
	local tt = {}
	tt[1] = {}
	tt[1].address = address
	tt[1].flags = flags
	tt[1].value = value
	tt[1].freeze = false
	gg.addListItems(tt)
end
function setpos(x, y, z)
	local t = {}
	t[1] = {}
	t[1].address = px
	t[1].flags = 16
	t[1].value = x
	t[2] = {}
	t[2].address = py
	t[2].flags = 16
	t[2].value = y
	t[3] = {}
	t[3].address = pz
	t[3].flags = 16
	t[3].value = z
	gg.setValues(t)
end
function getv(a, f)
	local t = {}
	t[1] = {}
	t[1].address = a
	t[1].flags = f
	t = gg.getValues(t)
	al = t[1].value
	gg.alert(al)
	gg.copyText(al)
end
function get_va()
	local t = {}
	t[1] = {}
	t[1].address = so + va
	t[1].flags = gg.TYPE_DWORD
	t = gg.getValues(t)
	if t[1].value == -721215457 then
	  suiv1 = on
	end
end
function get_em()
	local t = {}
	t[1] = {}
	t[1].address = so + em
	t[1].flags = gg.TYPE_DWORD
	t = gg.getValues(t)
	if t[1].value == 505794560 then
	  suiem1 = sl
	  suiem2 = nsl
	  suiem3 = nsl
	end
	if t[1].value == 506466304 then
	  suiem1 = nsl
	  suiem2 = sl
	  suiem3 = nsl
	end
end

function get_dm()
	local t = {}
	t[1] = {}
	t[1].address = so + dm
	t[1].flags = gg.TYPE_DWORD
	t = gg.getValues(t)
	if t[1].value == 506073088 then
	  suidm1 = sl
	  suidm2 = nsl
	  suidm3 = nsl
	  suidm4 = nsl
	end
	if t[1].value == 505417729 then
	  suidm1 = nsl
	  suidm2 = sl
	  suidm3 = nsl
	  suidm4 = nsl
	end
	if t[1].value == 505794560 then
	  suidm1 = nsl
	  suidm2 = nsl
	  suidm3 = sl
	  suidm4 = nsl
	end
end
function get_jm()
	local t = {}
	t[1] = {}
	t[1].address = so + jm
	t[1].flags = gg.TYPE_DWORD
	t = gg.getValues(t)
	if t[1].value == 506761216 then
	  suiw1 = on
	end
end
function get_cu()
	local t = {}
	t[1] = {}
	t[1].address = so + cu
	t[1].flags = gg.TYPE_DWORD
	t = gg.getValues(t)
	if t[1].value == 1384120352 then
	  suiu1 = on
	end
end
function get_eu()
	local t = {}
	t[1] = {}
	t[1].address = so + eu
	t[1].flags = gg.TYPE_DWORD
	t = gg.getValues(t)
	if t[1].value == 1384120352 then
	  suiu2 = on
	end
end
function get_fu()
	local t = {}
	t[1] = {}
	t[1].address = so + fu
	t[1].flags = gg.TYPE_DWORD
	t = gg.getValues(t)
	if t[1].value == 1384120352 then
	  suiu3 = on
	end
end
function get_hq()
	local t = {}
	t[1] = {}
	t[1].address = so + hq
	t[1].flags = gg.TYPE_DWORD
	t = gg.getValues(t)
	if t[1].value == 335544341 then
	  suiu4 = on
	end
end
function get_bc()
	local t = {}
	t[1] = {}
	t[1].address = so + bc
	t[1].flags = gg.TYPE_DWORD
	t = gg.getValues(t)
	if t[1].value == -721215457 then
	  suic1 = on
	end
end
function get_bp()
	local t = {}
	t[1] = {}
	t[1].address = so + bp
	t[1].flags = gg.TYPE_DWORD
	t = gg.getValues(t)
	if t[1].value == 706675691 then
	  suic2 = on
	end
end
function get_aw()
	local t = {}
	t[1] = {}
	t[1].address = so + aw1
	t[1].flags = gg.TYPE_DWORD
	t = gg.getValues(t)
	if t[1].value == 506630144 then
	  suic3 = on
	end
end
function get_sof()
	local t = {}
	t[1] = {}
	t[1].address = so + sof
	t[1].flags = gg.TYPE_DWORD
	t = gg.getValues(t)
	if t[1].value == 505873376 then
	  suip1 = on
	end
end
function get_sch()
	local t = {}
	t[1] = {}
	t[1].address = so + sch
	t[1].flags = gg.TYPE_DWORD
	t = gg.getValues(t)
	if t[1].value == 1384120352 then
	  suip2 = on
	end
end
function get_sj()
	local t = {}
	t[1] = {}
	t[1].address = so + sj
	t[1].flags = gg.TYPE_DWORD
	t = gg.getValues(t)
	if t[1].value == 505581568 then
	  suia1 = on
	end
end
function get_fd()
	local t = {}
	t[1] = {}
	t[1].address = so + fd
	t[1].flags = gg.TYPE_DWORD
	t = gg.getValues(t)
	if t[1].value == 505712640 then
	  suia2 = on
	end
end
function get_rw()
	local t = {}
	t[1] = {}
	t[1].address = so + rw
	t[1].flags = gg.TYPE_DWORD
	t = gg.getValues(t)
	if t[1].value == 505873376 then
	  suiwo1 = on
	end
end
function get_rb()
	local t = {}
	t[1] = {}
	t[1].address = so + rb
	t[1].flags = gg.TYPE_DWORD
	t = gg.getValues(t)
	if t[1].value == -721215457 then
	  suiwo2 = on
	end
end
function get_rc()
	local t = {}
	t[1] = {}
	t[1].address = so + rc
	t[1].flags = gg.TYPE_DWORD
	t = gg.getValues(t)
	if t[1].value == 0 then
	  suiwo3 = on
	end
end
function get_ih()
	local t = {}
	t[1] = {}
	t[1].address = so + ih
	t[1].flags = gg.TYPE_DWORD
	t = gg.getValues(t)
	if t[1].value == 505712640 then
	  suio1 = on
	end
end
function get_uf()
	local t = {}
	t[1] = {}
	t[1].address = so + uf
	t[1].flags = gg.TYPE_DWORD
	t = gg.getValues(t)
	if t[1].value == 822084938 then
	  suio2 = on
	end
end
function get_uo()
	local t = {}
	t[1] = {}
	t[1].address = so + uo
	t[1].flags = gg.TYPE_DWORD
	t = gg.getValues(t)
	if t[1].value == 505647104 then
	  suio3 = on
	end
end
function get_ik()
	local t = {}
	t[1] = {}
	t[1].address = so + ik1
	t[1].flags = gg.TYPE_DWORD
	t = gg.getValues(t)
	if t[1].value == 1384120320 then
	  suio4 = on
	end
end
function get_fh()
	local t = {}
	t[1] = {}
	t[1].address = so + fh
	t[1].flags = gg.TYPE_DWORD
	t = gg.getValues(t)
	if t[1].value == 505712640 then
	  suio5 = on
	end
end
function get_ais()
	local t = {}
	t[1] = {}
	t[1].address = so + ais
	t[1].flags = gg.TYPE_DWORD
	t = gg.getValues(t)
	if t[1].value == -721215457 then
	  sui1 = dcd
	end
end
function get_sh()
	local t = {}
	t[1] = {}
	t[1].address = sh
	t[1].flags = gg.TYPE_DWORD
	t = gg.getValues(t)
	if t[1].value == 1148829696 then
	  glow1 = sl
	  glow2 = nsl
	  glow3 = nsl
	end
	if t[1].value == 2139081118 then
	  glow1 = nsl
	  glow2 = sl
	  glow3 = nsl
	end
end
function setspf0()
	frzvalue(mfdz + 144, 4, 0)
	frzvalue(mfdz + 192, 4, 0)
	frzvalue(mfdz + 240, 4, 0)
end
function setspf1()
	setvalue(mfdz + 8, 4, -1600133292)
	frzvalue(mfdz + 12, 4, 1600132692)
	setvalue(mfdz + 16, 4, -1720562886)
	setvalue(mfdz + 20, 4, -1806973714)
	setvalue(mfdz + 24, 4, 1020395176)
	setvalue(mfdz + 28, 4, 131004170)
	setvalue(mfdz + 32, 4, 1)
end
function setspf2()
	setvalue(mfdz + 56, 4, -1600133292)
	frzvalue(mfdz + 60, 4, 1600132692)
	setvalue(mfdz + 64, 4, -1720562886)
	setvalue(mfdz + 68, 4, -1806973714)
	setvalue(mfdz + 72, 4, 1020395176)
	setvalue(mfdz + 76, 4, 131004170)
	setvalue(mfdz + 80, 4, 1)
end
function setspf3()
	setvalue(mfdz + 104, 4, -1600133292)
	frzvalue(mfdz + 108, 4, 1600132692)
	setvalue(mfdz + 112, 4, -1720562886)
	setvalue(mfdz + 116, 4, -1806973714)
	setvalue(mfdz + 120, 4, 1020395176)
	setvalue(mfdz + 124, 4, 131004170)
	setvalue(mfdz + 128, 4, 1)
end
function setsp1()
	frzvalue(mfdz + 9824, 4, 3)
	setvalue(mfdz + 8, 4, -1600133292)
	frzvalue(mfdz + 12, 4, 1600132692)
	setvalue(mfdz + 16, 4, -1720562886)
	setvalue(mfdz + 20, 4, -1806973714)
	setvalue(mfdz + 24, 4, 1020395176)
	setvalue(mfdz + 28, 4, 131004170)
	setvalue(mfdz + 32, 4, 1)
	if su == frz then
	  ufrzvalue(mfdz + 0, 4, 0)
	  su = ufrz
	end
end
function setsp2()
	frzvalue(mfdz + 9824, 4, 3)
	setvalue(mfdz + 56, 4, -1600133292)
	frzvalue(mfdz + 60, 4, 1600132692)
	setvalue(mfdz + 64, 4, -1720562886)
	setvalue(mfdz + 68, 4, -1806973714)
	setvalue(mfdz + 72, 4, 1020395176)
	setvalue(mfdz + 76, 4, 131004170)
	setvalue(mfdz + 80, 4, 1)
	if su == frz then
	  ufrzvalue(mfdz + 48, 4, 0)
	  su = ufrz
	end
end
function setsp3()
	frzvalue(mfdz + 9824, 4, 3)
	setvalue(mfdz + 104, 4, -1600133292)
	frzvalue(mfdz + 108, 4, 1600132692)
	setvalue(mfdz + 112, 4, -1720562886)
	setvalue(mfdz + 116, 4, -1806973714)
	setvalue(mfdz + 120, 4, 1020395176)
	setvalue(mfdz + 124, 4, 131004170)
	setvalue(mfdz + 128, 4, 1)
	if su == frz then
	  ufrzvalue(mfdz + 96, 4, 0)
	  su = ufrz
	end
end
function spark1()
	if spc == on then
	  setvalue(mfdz + 28, 4, 0)
	end
	gg.sleep(100)
	setvalue(mfdz + 28, 4, 131004170)
end
function spark2()
	if spc == on then
	  setvalue(mfdz + 76, 4, 0)
	end
	gg.sleep(100)
	setvalue(mfdz + 76, 4, 131004170)
end
function spark3()
	if spc == on then
	  setvalue(mfdz + 124, 4, 0)
	end
	gg.sleep(100)
	setvalue(mfdz + 124, 4, 131004170)
end

-----------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------

function getmode()
	if suiw1 == on then
		suiw1 = off
	else
		suiw1 = on
	end
	if suiw1 == on then
		setvalue(so + jm, 16, 9.55889916E-21)
		gg.toast("Enabled - Jet Mode")
		setvalue(so + jm, 16, 9.55889916E-21)
	else
		setvalue(so + jm, 16, 2.91466459E-20)
		gg.toast("Disabled - Jet Mode")
		setvalue(so + jm, 16, 2.91466459E-20)
	end
end

function glown()
	if suiw1 == on then
		suiw1 = off
	else
		suiw1 = on
	end
	if suiw1 == on then
	    frzvalue(sh, 16, 999)
        frzvalue(sh2, 16, 999)
        glow1 = sl
        glow2 = nsl
        glow3 = nsl
        gg.toast("Glowing Body - Glow")
        frzvalue(sh, 16, 999)
        frzvalue(sh2, 16, 999)
	else
		frzvalue(sh, 16, 0)
        frzvalue(sh2, 16, 0)
        glow1 = nsl
        glow2 = nsl
        glow3 = sl
        frzvalue(sh, 16, 0)
        frzvalue(sh2, 16, 0)
        gg.toast("Glowing Body - Off")
        ufrzvalue(sh, 16, 0)
        ufrzvalue(sh2, 16, 0)
        setvalue(sh, 16, 0)
        setvalue(sh2, 16, 0)
	end
end

function burningmod()
	pwr = gg.choice({
	  "Burn Candle",
	  "Burn Plant",
	  "Absord Wax"
	  },nil,'BURNING MODDS')
	if pwr == nil then
	  noselect()
	else
	    if pwr == 1 then
			if suic1 == on then
				suic1 = off
			else
				suic1 = on
			end
			if suic1 == on then
				setvalue(so + bc, 16, -9010873890000)
				gg.toast("Enabled - Burn Candle")
				setvalue(so + bc, 16, -9010873890000)
			else
				setvalue(so + bc, 16, 1.19212586E-7)
				gg.toast("Disabled - Burn Candle")
				setvalue(so + bc, 16, 1.19212586E-7)
			end

	    else
			if pwr == 2 then
				if suic2 == on then
					suic2 = off
				else
					suic2 = on
				end
				if suic2 == on then
					gg.alert("If there are other players, it is difficult to burn due to the server")
					setvalue(so + bp, 16, 1.41233962E-13)
					gg.toast("Enabled - Burn Plant")
					setvalue(so + bp, 16, 1.41233962E-13)
				else
					setvalue(so + bp, 16, bp_v)
					gg.toast("Disabled - Burn Plant")
					setvalue(so + bp, 16, bp_v)
				end

			else
				if suic3 == on then
					suic3 = off
				else
					suic3 = on
				end
				if suic3 == on then
					setvalue(so + aw1, 16, 9.45302004E-21)
					setvalue(so + aw2, 16, 9999.9)
					gg.toast("Enabled - Absord Wax")
					setvalue(so + aw1, 16, 9.45302004E-21)
					setvalue(so + aw2, 16, 9999.9)
				else
					setvalue(so + aw1, 16, 1.25233015E28)
					setvalue(so + aw2, 16, 3.5)
					gg.toast("Disabled - Absord Wax")
					setvalue(so + aw1, 16, 1.25233015E28)
					setvalue(so + aw2, 16, 3.5)
				end
			end
		end
	end
end

--------------------------test-------------------------------

-- Función para mostrar el menú

-- Función magic1 que encapsula el código del menú
function Magic1()
    -- Tabla con las opciones del menú
    local opciones = {
        "Cape",
        "Pants",
        "Hairstyle",
        "Mask",
        "Accessory",
        "Prop",
        "Others",
        "Salir"
    }

    -- Variable para guardar la opción seleccionada por el usuario
    local opcion = 0

    -- Ciclo para mostrar el menú y pedir la opción al usuario hasta que seleccione "Salir"
    while opcion ~= #opciones do
        -- Mostrar el menú y leer la opción seleccionada por el usuario
        opcion = choice(opciones)

        -- Realizar una acción dependiendo de la opción seleccionada
        if opcion == 1 then
			if opcion == 1 then
				local cape = gg.choice({
					"Yeti Cape",
					"Wings of AURORA",
					"Cat Cape",
					"Platinum Cape",
					"Fish Cape",
					"TGC Cape",
					"Ghostbat Cape",
					"Spider Cape",
					"Christmas Cape",
					"Snowflake Cape",
					"Old Winter Feast Cape",
					"White Bird Cape",
					"Petal Cape",
					"Fortune Cape",
					"Sakura Cape",
					"Wisteria Cape",
					"Ocean Cape",
					"Dream Season Cape",
					"Rainbow Cape",
					"Little Prince Scarf Cape",
					"Little Prince Asteroid Jacket",
					"Bloom Cape 2023",
					"Alchemist Cape",
					"Earth Cape",
					"Light Scholar Cape",
					"Giving In Cape",
					"Postman Cape",
					"Turtle Cape",
					"Dead Leaves Cape"
				}, "Select a cape to equip", "Slot1/Cape")
				if cape == nil then
					print("Regresando al menú principal...")
				elseif cape == #opciones-1 then
					opcion = cape
				else
					print("Seleccionaste " .. cape)
					if cape == 1 then
						setsp1()
						setvalue(mfdz + 0, 4, -940505450)
						spn1 = "Yeti cloak"
						spark1()
					elseif cape == 2 then
						setsp1()
						setvalue(mfdz + 0, 4, 1326646141)
						spn1 = "Aurora concert cloak"
						spark1()
					elseif cape == 3 then
						setsp1()
						setvalue(mfdz + 0, 4, 583315364)
						spn1 = "Cat cloak"
						spark1()
					elseif cape == 4 then
						setsp1()
						setvalue(mfdz + 0, 4, 330655056)
						spn1 = "Platinum cloak"
						spark1()
					elseif cape == 5 then
						setsp1()
						setvalue(mfdz + 0, 4, 573237039)
						spn1 = "Fish cloak"
						spark1()
					elseif cape == 6 then
						setsp1()
						setvalue(mfdz + 0, 4, 540856305)
						spn1 = "TGC cloak"
						spark1()
					elseif cape == 7 then
						setsp1()
						setvalue(mfdz + 0, 4, -1407986309)
						spn1 = "Ghostbat cloak"
						spark1()
					elseif cape == 8 then
						setsp1()
						setvalue(mfdz + 0, 4, 633325982)
						spn1 = "pwr1ider cloak"
						spark1()
					elseif cape == 9 then
						setsp1()
						setvalue(mfdz + 0, 4, -1763984799)
						spn1 = "Christmas cloak"
						spark1()
					elseif cape == 10 then
						setsp1()
						setvalue(mfdz + 0, 4, -2118481318)
						spn1 = "Snowflake cloak"
						spark1()
					elseif cape == 11 then
						setsp1()
						setvalue(mfdz + 0, 4, 82088375)
						spn1 = "Old Winter Feast cloak"
						spark1()
					elseif cape == 12 then
						setsp1()
						setvalue(mfdz + 0, 4, 1725590052)
						spn1 = "White Bird cloak"
						spark1()
					elseif cape == 13 then
						setsp1()
						setvalue(mfdz + 0, 4, 1865271385)
						spn1 = "Petal cloak"
						spark1()
					elseif cape == 14 then
						setsp1()
						setvalue(mfdz + 0, 4, 221562364)
						spn1 = "Fortune cloak"
						spark1()
					elseif cape == 15 then
						setsp1()
						setvalue(mfdz + 0, 4, -630842234)
						spn1 = "Sakura cloak"
						spark1()
					elseif cape == 16 then
						setsp1()
						setvalue(mfdz + 0, 4, -1322784839)
						spn1 = "Wisteria cloak"
						spark1()
					elseif cape == 17 then
						setsp1()
						setvalue(mfdz + 0, 4, -438670659)
						spn1 = "Ocean cloak"
						spark1()
					elseif cape == 18 then
						setsp1()
						setvalue(mfdz + 0, 4, 1946019958)
						spn1 = "Dream Season cloak"
						spark1()
					elseif cape == 19 then
						setsp1()
						setvalue(mfdz + 0, 4, 869005924)
						spn1 = "Rainbow cloak"
						spark1()
					elseif cape == 20 then
						setsp1()
						setvalue(mfdz + 0, 4, -2052540323)
						spn1 = "Little Prince Scarf cloak"
						spark1()
					elseif cape == 21 then
						setsp1()
						setvalue(mfdz + 0, 4, -87150565)
						spn1 = "Little Prince Asteroid Jacket cloak"
						spark1()
					elseif cape == 22 then
						setsp1()
						setvalue(mfdz + 0, 4, 549258087)
						spn1 = "Dob cloak"
						spark1()
					elseif cape == 23 then
						setsp1()
						setvalue(mfdz + 0, 4, -383842131)
						spark1()
					elseif cape == 24 then
						setsp1()
						setvalue(mfdz + 0, 4, 2079599063)
						spark1()
					elseif cape == 25 then
						setsp1()
						setvalue(mfdz + 0, 4, 1375571404)
						spark1()
					elseif cape == 26 then
						setsp1()
						setvalue(mfdz + 0, 4, 939730131)
						spark1()
					elseif cape == 27 then
						setsp1()
						setvalue(mfdz + 0, 4, -308941587)
						spark1()
					elseif cape == 28 then
						setsp1()
						setvalue(mfdz + 0, 4, -700035318)
						spark1()
					elseif cape == 29 then
						setsp1()
						setvalue(mfdz + 0, 4, 769892976)
						spark1()
					end
				end
				
			end
			
            
        elseif opcion == 2 then
            print("Seleccionaste Pants")
        elseif opcion == 3 then
            print("Seleccionaste Hairstyle")
        elseif opcion == 4 then
            print("Seleccionaste Mask")
        elseif opcion == 5 then
            print("Seleccionaste Accessory")
        elseif opcion == 6 then
            print("Seleccionaste Prop")
        elseif opcion == 7 then
            print("Seleccionaste Others")
        elseif opcion == #opciones then
            print("Saliendo del programa...")
        else
            print("Opción inválida")
        end
    end
end


function Magic()
	pwr = gg.choice({
		"Slot1 ",
        "Slot2 ",
        "Slot3 ",
		"reset "
	   },nil, "Slot1")
	if pwr == nil then
	  noselect()
	else
	    if pwr == 1 then
			Magic1()
	    elseif pwr == 2 then
			Magic2()
		elseif pwr == 3 then
			Magic3()
		elseif pwr == 4 then
			ufrzvalue(mfdz + 96, 4, 0)
			setvalue(mfdz + 96, 4, 0)
			spn3 = " "
		end
	end
end









---------------------------------------------end test-------------------------------------------


















































































function uwc()
	gx.vars.w = gx.editor.get({{address = pbase, flags = "D"}})[1].value
end

gx.vars.settings = {
	wdistance = settings.wdistance,
	w = 0
}
gx.set_signs({[false] = '¦❌¦', [true] = '¦🎅¦'})
gx.set_back_text("|⬅️| Back")

gx.add_menu({
	title = "Welcome to SKYSHOT :",
	name = "main",
	menu = {
		{"[⬆️] Break wall: {gx:settings.wdistance}", {pmove, {"{gx:settings.wdistance}"}}},
		{"[👥] Farming with friends", {gx.open_menu, {"farmmenu"}}},
		{"[👤] Player mods", {gx.open_menu, {"Playermenu"}}},
		{"[🌎] World menu", {gx.open_menu, {"worldmenu"}}},
		{"[🌀] Magic spells", {Magic}},
		--{"[🤡] Fun!!", {gx.open_menu, {"funmenu"}}},
		{"[📣] Jet mode", {getmode}},
		{"[📣] Glown", {glown}},
	},
	type = "choice"
})

gx.add_menu({
	title = "world menu: ",
	name = "worldmenu",
	menu = {
		{"[🌎] Go to", {_goto}},
		{"[🌀] Change_Map", {changemap}},
		{"[🌌] Constelation", {gx.editor.set, {tostring(player + offsets.constel_menu).."a 1D"}}},
		{"[📷] Zoom", {cameradistance}},
		{"[💨] Remove wind walls", {nowind}},
		{"[☁️] Remove Clouds ", {gx.editor.switch, {tostring(clouds_results[1].address).."a 1D | 0D", "{gxbool}"}}},
		{"[📍]  Show location", {show_location}}
	},
	type = "back"
})

gx.add_menu({
	title = "God Farming: ",
	name = "farmmenu",
	menu = {
		{"[⬆️] Break wall: {gx:settings.wdistance}", {pmove, {"{gx:settings.wdistance}"}}},
		{"[🚀] Rapid Farm", {rapidfarm}},
		{"[🕯️] Slow Farm", {slowfarm}},
		{"[🌎] Go to", {_goto}}, 
        {"[🌀] Change_Map", {changemap}},
        {"[🔥] Burning mods", {burningmod}},
		{"[📣] Super shout", {supershout}},
        {"[☀️] Absorb wax (deprecated)", {collect_waxes}},
        {"[🦋] absorb wings", {absorb_wings}},
		{"[📍] Show location", {show_location}}
	},
	type = "back"
})

gx.add_menu({
	title = "Player menu: ",
	name = "Playermenu",
	menu = {

        {"[⚡] fast flap {gxsign}", {gx.editor.switch, {tostring(bootloader + offsets.fastflap).."a 520725538D | 506761216D", "{gxbool}"}}},
		{"[🎨] cosmetics & Emotes {gxsign}", {unlock_all, {"{gxbool}"}}},
		{"[🔓] Friendnode unlock {gxsign}", {gx.editor.switch, {tostring(bootloader + offsets.ptofnodes).."a 872415336D | 1384120352D", "{gxbool}"}}},
        --{"[🔓] Unlock season by BIAN", {UnlockSeason}},
		{"[♾️] Energy unlimited {gxsign}", {gx.editor.switch, {tostring(player + offsets.wing_charge).."a 14F | 14Ff", "{gxbool}"}}},
		{"[⚡] Quick steps {gxsign}", {gx.editor.switch, {tostring(quick_results[1].address).."a 3.5F | 200F", "{gxbool}"}}},
	},
	menu_repeat = true,
	type = "xback",
})

gx.add_menu({
	title = "Fun menu: ",
	name = "funmenu",
	menu = {
		{"[💤] Fake sleep {gxsign}", {gx.editor.switch, {tostring(player + offsets.sleeping).."a 1D | 257Df", "{gxbool}"}}},
		{"[📣] Super shout", {getmode}},
		{"[✨] spams magic {gxsign}", {pmagic, {9, -1727483534, 0, "{gxbool}"}}},
		{"[🎇] Infinity fireworks {gxsign}", {gx.editor.switch, {tostring(player + offsets.famount_off).."a 5D | 5Df", "{gxbool}"}}},
		{"[🦋] Cape spam", {capespam}}
	},
	type = "back"
})

gg.toast("SKYSHOT LOADED!!")

gx.loop(500)


