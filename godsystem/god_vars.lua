-- MAIN
VER = '3.0'

FREEMODE_GLOBAL = 262145
FOR_LOOPS_GLOBAL = 4537211
PID_GLOBAL = 2672761

LAST_MP_CHAR_HASH = string.smart_joaat('MPPLY_LAST_MP_CHAR')

PopupType = {
    BOX = 0,
    LINE = 1
}

PageColumn = {
    FIRST = 1,
    SECOND = 2,
    THIRD = 3,
}

GroupRect = {
    FULL = 0,
    TITLE = 1,
    BODY = 2,
}

Icons = {
	INVALID = 0,
	FIRST_ICON = 59648,
	LAST_ICON = 59710,
	ARROW_DOWN = 59648,
	ARROW_UP = 59649,
	CAR = 59650,
	COLOR_PALETTE = 59651,
	CONTRAST = 59652,
	EXTENSION_PUZZLE = 59653,
	EYE = 59654,
	FISH = 59655,
	FLASH = 59656,
	GRID = 59657,
	HARDWARE_CHIP = 59658,
	LOGO_BUFFER = 59659,
	PEOPLE = 59660,
	PERSON = 59661,
	PLANET = 59662,
	SAVE = 59663,
	SETTINGS = 59664,
	SHIELD = 59665,
	SKULL = 59666,
	SPEEDOMETER = 59667,
	TRASH = 59668,
	WALLET = 59670,
	SEARCH = 59671,
	CANCEL = 59672,
	CLOUD_DOWNLOAD = 59673,
	CLOUD_UPLOAD = 59674,
	CLOUD_DISCONNECTED = 59675,
	CLOUD_SUCCESS = 59676,
	EXCLAMATION_TRIANGLE = 59677,
	SHIELD_SUCCESS = 59678,
	SQUARE_CHECKMARK_SUCCESS = 59679,
	CIRCLE_CANCEL = 59680,
	GAMEPAD = 59681,
	CROSSHAIR = 59682,
	MIDNIGHT_HEADER_LOGO = 59683,
	CHECKMARK_SUCCESS = 59684,
	CANCEL2 = 59685,
	PEN = 59686,
	SHARE = 59687,
	DOWNLOAD = 59688,
	CLOUD = 59689,
	GUN = 59690,
	MOVEMENT = 59691,
	WHEELCHAIR_MOVE = 59692,
	EXCLAMATION_CIRCLE = 59693,
	KEYBOARD = 59694,
	MIDNIGHT_LOGO = 59695,
	THREE_DOTS = 59696,
	REFRESH = 59697,
	PLUS = 59698,
	COPY = 59699,
	FILE = 59700,
	CAR2 = 59701,
	CARD = 59702,
	EARTH = 59703,
	BACKSPACE = 59704,
	KARAMBIT = 59705,
	GRIPDOTS = 59706,
	PORTAL = 59707,
	SPOOFING = 59708,
	UI = 59709,
	ETHERNET = 59710
}

MODS = {

}

SPAWNED = {

}

SPAWNED_HANDLE = {

}

-- OFFICE
PICKED_WAREHOUSE = 0

OFFICES = {
    [0] = {name= 'Office not found'},
    [87]  = {name = 'Lombank West',                    coords = {x = -1583.427612,  y =  -557.392517,  z = 33.654240 }},
    [88]  = {name = 'Maze Bank West',                  coords = {x = -1371.461670,   y =  -506.922180, z = 31.857445 }},
    [89]  = {name = 'Arcadius Business Center',        coords = {x = -106.573792,  y =  -612.973083, z = 34.766911 }},
    [90]  = {name = 'Maze Bank Tower',                 coords = {x = -82.427208,   y =  -795.496277,    z = 42.927375}}
}

WAREHOUSES = {
    [0]  = {name = 'Warehouse not found',           capacity = 0,},
    [1]  = {name = 'Pacific Bait Storage',          capacity = 16,      coords = {x = 54.191,    y = -2569.248,  z = 6.0046 }},
    [2]  = {name = 'White Widow Garage',            capacity = 16,      coords = {x = -1083.054, y = -1261.893,  z = 5.534  }},
    [3]  = {name = 'Celltowa Unit',                 capacity = 16,      coords = {x = 896.3665,  y = -1035.749,  z = 35.1096}},
    [4]  = {name = 'Convenience Store Lockup',      capacity = 16,      coords = {x = 247.473,   y = -1956.943,  z = 23.1908}},
    [5]  = {name = 'Foreclosed Garage',             capacity = 16,      coords = {x = -424.828,  y = 185.825,    z = 80.775 }},
    [6]  = {name = 'Xero Gas Factory',              capacity = 111,     coords = {x = -1042.482, y = -2023.516,  z = 13.1616}},
    [7]  = {name = 'Derriere Lingerie Backlot',     capacity = 42,      coords = {x = -1268.119, y = -812.2741,  z = 17.1075}},
    [8]  = {name = 'Bilgeco Warehouse',             capacity = 111,     coords = {x = -874,   y = -2736,  z = 13.9438}},
    [9]  = {name = 'Pier 400 Utility Building',     capacity = 16,      coords = {x = 274.5224,  y = -3015.413,  z = 5.6993 }},
    [10] = {name = 'GEE Warehouse',                 capacity = 42,      coords = {x = 1569.69,   y = -2129.792,  z = 78.3351}},
    [11] = {name = 'LS Marine Building 3',          capacity = 42,      coords = {x = -315.551,  y = -2698.654,  z = 7.5495 }},
    [12] = {name = 'Railyard Warehouse',            capacity = 42,      coords = {x = 499.81,    y = -651.982,   z = 24.909 }},
    [13] = {name = 'Fridgit Annexe',                capacity = 42,      coords = {x = -528.5296, y = -1784.573,  z = 21.5853}},
    [14] = {name = 'Disused Factory Outlet',        capacity = 42,      coords = {x = -295.8596, y = -1353.238,  z = 31.3138}},
    [15] = {name = 'Discount Retail Unit',          capacity = 42,      coords = {x = 349.839,   y = 328.889,    z = 104.272}},
    [16] = {name = 'Logistics Depot',               capacity = 111,     coords = {x = 926.2818,  y = -1560.311,  z = 30.7404}},
    [17] = {name = 'Darnell Bros Warehouse',        capacity = 111,     coords = {x = 759.566,   y = -909.466,   z = 25.244 }},
    [18] = {name = 'Wholesale Furniture',           capacity = 111,     coords = {x = 1037.813,  y = -2173.062,  z = 31.5334}},
    [19] = {name = 'Cypress Warehouses',            capacity = 111,     coords = {x = 1019.116,  y = -2511.69,   z = 28.302 }},
    [20] = {name = 'West Vinewood Backlot',         capacity = 111,     coords = {x = -245.3405, y = 203.3286,   z = 83.818 }},
    [21] = {name = 'Old Power Station',             capacity = 42,      coords = {x = 539.346,   y = -1945.682,  z = 24.984 }},
    [22] = {name = 'Walker & Sons Warehouse',       capacity = 111,     coords = {x = 96.1538,   y = -2216.4,    z = 6.1712 }}
}

WAREHOUSE_CRATES_PRICE_GLOBAL = {
    [1] = FREEMODE_GLOBAL + 15734, -- for 3 crates / EXEC_CONTRABAND_SALE_VALUE_THRESHOLD3 in tunables_processing
    [2] = FREEMODE_GLOBAL + 15737, -- for 8 crates / EXEC_CONTRABAND_SALE_VALUE_THRESHOLD6 in tunables_processing
    [3] = FREEMODE_GLOBAL + 15739, -- for 16 crates / EXEC_CONTRABAND_SALE_VALUE_THRESHOLD8 in tunables_processing
    [4] = FREEMODE_GLOBAL + 15740, -- for 21 crates / EXEC_CONTRABAND_SALE_VALUE_THRESHOLD9 in tunables_processing
    [5] = FREEMODE_GLOBAL + 15744, -- for 42 crates / EXEC_CONTRABAND_SALE_VALUE_THRESHOLD13 in tunables_processing
    [6] = FREEMODE_GLOBAL + 15746, -- for 56 crates / EXEC_CONTRABAND_SALE_VALUE_THRESHOLD15 in tunables_processing
    [7] = FREEMODE_GLOBAL + 15752, -- for 111 crates / EXEC_CONTRABAND_SALE_VALUE_THRESHOLD21 in tunables_processing
}

WAREHOUSE_CRATES_PRICE_TO_SET = {
    [1] = 2000000, -- 3 crates = $6.000.000
    [2] = 750000, -- 8 crates = $6.000.000
    [3] = 375000, -- 16 crates = $6.000.000
    [4] = 272727, -- 21 crates = $5.727.267
    [5] = 142857, -- 42 crates = $5.999.994
    [6] = 107142, -- 56 crates = $5.999.952
    [7] = 54054 -- 111 crates = $5.999.994
}

WAREHOUSE_CRATES_PRICE_TO_RESET = {
    [1] = 12000,
    [2] = 14000,
    [3] = 15000,
    [4] = 15500,
    [5] = 17500,
    [6] = 18000,
    [7] = 20000
}

WAREHOUSE_INSTANT_BUY_SCRIPT = 'gb_contraband_buy'
WAREHOUSE_INSTANT_BUY_GLOBAL1 = 603 + 5
WAREHOUSE_INSTANT_BUY_GLOBAL2 = 603 + 191
WAREHOUSE_INSTANT_BUY_GLOBAL3 = 603 + 192
WAREHOUSE_INSTANT_BUY_CRATES_AMOUNT_GLOBAL = 603 + 1
WAREHOUSE_BUY_COOLDOWN_GLOBAL = FREEMODE_GLOBAL + 15499

WAREHOUSE_INSTANT_SELL_SCRIPT = 'gb_contraband_sell'
WAREHOUSE_INSTANT_SELL_GLOBAL = 545 + 1
WAREHOUSE_SELL_COOLDOWN_GLOBAL = FREEMODE_GLOBAL + 15500

-- BUSINESSES
BUNKERS = {
    [0] = {name = 'Bunker not found'},
    [21] = {name = 'Grand Senora Oilfields Bunker',      coords = {x = 492.8395,   y = 3014.057,   z = 39.9793}, type = 5},
    [22] = {name = 'Grand Senora Desert Bunker',         coords = {x = 849.603,    y = 3021.697,   z = 40.3076}, type = 5},
    [23] = {name = 'Route 68 Bunker',                    coords = {x = 39.5967,    y = 2930.506,   z = 54.8034}, type = 5},
    [24] = {name = 'Farmhouse Bunker',                   coords = {x = 1572.078,   y = 2226.001,   z = 77.2829}, type = 5},
    [25] = {name = 'Smoke Tree Road Bunker',             coords = {x = 2110.019,   y = 3326.12,    z = 44.3526}, type = 5},
    [26] = {name = 'Thomson Scrapyard Bunker',           coords = {x = 2489.36,    y = 3162.12,    z = 48.0015}, type = 5},
    [27] = {name = 'Grapeseed Bunker',                   coords = {x = 1801.273,   y = 4705.483,   z = 38.8253}, type = 5},
    [28] = {name = 'Paleto Forest Bunker',               coords = {x = -755.5687,  y = 5943.835,   z = 18.9008}, type = 5},
    [29] = {name = 'Raton Canyon Bunker',                coords = {x = -388.8392,  y = 4340.109,   z = 55.1741}, type = 5},
    [30] = {name = 'Lago Zancudo Bunker',                coords = {x = -3031.356,  y = 3334.059,   z = 9.1805 }, type = 5},
    [31] = {name = 'Chumash Bunker',                     coords = {x = -3157.599,  y = 1376.695,   z = 15.866 }, type = 5}
}
BUNKER_GET_SUPP_GLOBAL = 1663174 + 5 + 1


HANGAR_INSTANT_SELL_SCRIPT = 'gb_smuggler'
HANGAR_INSTANT_SELL_READ_GLOBAL = 1934 + 1078
HANGAR_INSTANT_SELL_WRITE_GLOBAL = 1934 + 1035

CLUBHOUSE_GET_SUPP_GLOBAL = 1663174 + 1
CLUBHOUSE_GET_COCSUPP_GLOBAL = 4
CLUBHOUSE_GET_METHSUPP_GLOBAL = 3
CLUBHOUSE_GET_CASHSUPP_GLOBAL = 2
CLUBHOUSE_GET_WEEDSUPP_GLOBAL = 1
CLUBHOUSE_GET_DOCSSUPP_GLOBAL = 0
CLUBHOUSE_SUPP_NAMES = {
    [1] = 'Cocaine',
    [2] = 'Methamphetamine',
    [3] = 'Counterfeit cash',
    [4] = 'Weed',
    [5] = 'Document forgery'
}

ACIDLAB_GET_SUPP_GLOBAL = 1663174 + 6 + 1

-- CASINO
CHIPS_PUR_LIM_GLOBAL = FREEMODE_GLOBAL + 26534
CHIPS_PUR_LIM_WITH_PENT_GLOBAL = FREEMODE_GLOBAL + 26535

CHIPS_PUR_COOLDOWN_HASH1 = string.smart_joaat('MPPLY_CASINO_CHIPS_PUR_GD')
CHIPS_PUR_COOLDOWN_HASH2 = string.smart_joaat('MPPLY_CASINO_CHIPS_PURTIM')

CASINO_LW_SCRIPT = 'casino_lucky_wheel'
CASINO_LW_CHOOSE_DROP_GLOBAL = 280 + 14
CASINO_LW_DROP_GLOBAL = 280 + 45
CASINO_LW_DROP_NAMES = {
    'Clothing (1)', 'Clothing (2)', 'Clothing (3)', 'Clothing (4)',
    '2,500 RP', '5,000 RP', '7,500 RP', '10,000 RP', '15,000 RP',
    '$20,000', '$30,000', '$40,000', '$50,000',
    '10,000 Chips', '15,000 Chips', '20,000 Chips', '25,000 Chips',
	'Discount', 'Mystery', 'Vehicle'
}
CASINO_LW_DROP_IDS = {
    0, 8, 12, 16,
    1, 5, 9, 13, 17,
    2, 6, 14, 19,
    3, 7, 10, 15,
    4, 11, 18
}

BLACKJACK_SCRIPT = 'blackjack'
BLACKJACK_TABLE_LOCAL = 1776 + 1 + 4
BLACKJACK_SET_CARDS_TO_DEALER_LOCAL1 = 116 + 846 + 1 + 1
BLACKJACK_SET_CARDS_TO_DEALER_LOCAL2 = 116 + 846 + 1 + 2
BLACKJACK_SET_CARDS_TO_DEALER_LOCAL3 = 116 + 846 + 1 + 3
BLACKJACK_SET_CARDS_TO_DEALER_LOCAL4 = 116 + 846 + 1 + 12

-- LOOPS
NC_LOOP_GLOBAL1 = FREEMODE_GLOBAL + 23657 -- NIGHTCLUBINCOMEUPTOPOP5
NC_LOOP_GLOBAL2 = FREEMODE_GLOBAL + 23676 -- NIGHTCLUBINCOMEUPTOPOP100
NC_LOOP_GLOBAL3 = FREEMODE_GLOBAL + 23680 -- NIGHTCLUBMAXSAFEVALUE

CHIPS_LOOP_GLOBAL = 1964419

-- MISC
V169 = {
    [1] = 2707347, -- 'bypass' idk, set to 1
    [2] = FREEMODE_GLOBAL + 35635, -- ENABLE_VEHICLE_CASTIGATOR / tunables_processing
    [3] = FREEMODE_GLOBAL + 35636, -- ENABLE_VEHICLE_DOMINATOR10 / tunables_processing
    [4] = FREEMODE_GLOBAL + 35637, -- ENABLE_VEHICLE_VORSCHLAGHAMMER / tunables_processing
    [5] = FREEMODE_GLOBAL + 35643, -- ENABLE_VEHICLE_PIZZABOY / tunables_processing
    [6] = FREEMODE_GLOBAL + 35640, -- ENABLE_VEHICLE_POLDOMINATOR10 / tunables_processing
    [7] = FREEMODE_GLOBAL + 35634 -- ENABLE_VEHICLE_POLIMPALER6 / tunables_processing
}

DELETED_VEHICLES = {
    [1] =  FREEMODE_GLOBAL + 22565, -- ENABLE_Z190 / tunables_processing
    [2] =  FREEMODE_GLOBAL + 14708, -- ENABLEEXEC1_PFISTER / tunables_processing
    [3] = FREEMODE_GLOBAL + 34371, -- ENABLE_VEHICLE_NINEF / tunables_processing
    [4] = FREEMODE_GLOBAL + 34373, -- ENABLE_VEHICLE_NINEF2 / tunables_processing
    [5] = FREEMODE_GLOBAL + 34451, -- ENABLE_VEHICLE_AKUMA / tunables_processing
    [6] = FREEMODE_GLOBAL + 34349, -- ENABLE_VEHICLE_ALPHA / tunables_processing
    [7] = FREEMODE_GLOBAL + 34527, -- ENABLE_VEHICLE_ASEA / tunables_processing
    [8] = FREEMODE_GLOBAL + 35180, -- ENABLE_VEHICLE_ASTEROPE / tunables_processing
    [9] = FREEMODE_GLOBAL + 17356, -- ENABLE_BIKER_AVARUS / tunables_processing
    [10] = FREEMODE_GLOBAL + 17372, -- ENABLE_BIKER_BAGGER / tunables_processing
    [11] = FREEMODE_GLOBAL + 35188, -- ENABLE_VEHICLE_BALLER / tunables_processing
    [12] = FREEMODE_GLOBAL + 34413, -- ENABLE_VEHICLE_BALLER2 / tunables_processing
    [13] = FREEMODE_GLOBAL + 34415, -- ENABLE_VEHICLE_BALLER3 / tunables_processing
    [14] = FREEMODE_GLOBAL + 34417, -- ENABLE_VEHICLE_BALLER5 / tunables_processing
    [15] = FREEMODE_GLOBAL + 34465, -- ENABLE_VEHICLE_BATI2 / tunables_processing
    [16] = FREEMODE_GLOBAL + 34573, -- ENABLE_VEHICLE_BJXL / tunables_processing
    [17] = FREEMODE_GLOBAL + 34499, -- ENABLE_VEHICLE_BFINJECTION / tunables_processing
    [18] = FREEMODE_GLOBAL + 34495, -- ENABLE_VEHICLE_BIFTA / tunables_processing
    [19] = FREEMODE_GLOBAL + 34493, -- ENABLE_VEHICLE_BLADE / tunables_processing
    [20] = FREEMODE_GLOBAL + 34511, -- ENABLE_VEHICLE_BLAZER / tunables_processing
    [21] = FREEMODE_GLOBAL + 28191, -- ENABLE_VEHICLE_BLAZER2 / tunables_processing
    [22] = FREEMODE_GLOBAL + 34501, -- ENABLE_VEHICLE_BODHI2 / tunables_processing
    [23] = FREEMODE_GLOBAL + 34333, -- ENABLE_VEHICLE_BRAWLER / tunables_processing
    [24] = FREEMODE_GLOBAL + 34551, -- ENABLE_VEHICLE_BUFFALO / tunables_processing
    [25] = FREEMODE_GLOBAL + 34553, -- ENABLE_VEHICLE_BUFFALO2 / tunables_processing
    [26] = FREEMODE_GLOBAL + 34409, -- ENABLE_VEHICLE_BULLET / tunables_processing
    [27] = FREEMODE_GLOBAL + 34569, -- ENABLE_VEHICLE_CAVALCADE / tunables_processing
    [28] = FREEMODE_GLOBAL + 34571, -- ENABLE_VEHICLE_CAVALCADE2 / tunables_processing
    [29] = FREEMODE_GLOBAL + 23726, -- ENABLE_CHEBUREK / tunables_processing
    [30] = FREEMODE_GLOBAL + 34401, -- ENABLE_VEHICLE_CHEETAH / tunables_processing
    [31] = FREEMODE_GLOBAL + 17230, -- ENABLESTUNT_CLIFFHANGER / tunables_processing
    [32] = FREEMODE_GLOBAL + 25367, -- ENABLE_VEHICLE_CLIQUE / tunables_processing
    [33] = FREEMODE_GLOBAL + 34335, -- ENABLE_VEHICLE_COGNOSCENTI / tunables_processing
    [34] = FREEMODE_GLOBAL + 34337, -- ENABLE_VEHICLE_COGNOSCENTI2 / tunables_processing
    [35] = FREEMODE_GLOBAL + 34339, -- ENABLE_VEHICLE_COG55 / tunables_processing
    [36] = FREEMODE_GLOBAL + 34341, -- ENABLE_VEHICLE_COG552 / tunables_processing
    [37] = FREEMODE_GLOBAL + 34325, -- ENABLE_VEHICLE_COGCABRIO / tunables_processing
    [38] = FREEMODE_GLOBAL + 18947, -- ENABLE_IE_COMET2 / tunables_processing
    [39] = FREEMODE_GLOBAL + 18948, -- ENABLE_IE_COMET3 / tunables_processing
    [40] = FREEMODE_GLOBAL + 22564, -- ENABLE_COMET5 / tunables_processing
    [41] = FREEMODE_GLOBAL + 17229, -- ENABLESTUNT_CONTENDER / tunables_processing
    [42] = FREEMODE_GLOBAL + 34367, -- ENABLE_VEHICLE_COQUETTE / tunables_processing
    [43] = FREEMODE_GLOBAL + 34331, -- ENABLE_VEHICLE_COQUETTE3 / tunables_processing
    [44] = FREEMODE_GLOBAL + 21603, -- ENABLE_CYCLONE / tunables_processing
    [45] = FREEMODE_GLOBAL + 17364, -- ENABLE_BIKER_WESTERNDAEMON / tunables_processing
    [46] = FREEMODE_GLOBAL + 25369, -- ENABLE_VEHICLE_DEVIANT / tunables_processing
    [47] = FREEMODE_GLOBAL + 34431, -- ENABLE_VEHICLE_DILETTANTE / tunables_processing
    [48] = FREEMODE_GLOBAL + 34453, -- ENABLE_VEHICLE_DOUBLE / tunables_processing
    [49] = FREEMODE_GLOBAL + 34497, -- ENABLE_VEHICLE_DUNE / tunables_processing
    [50] = FREEMODE_GLOBAL + 25387, -- ENABLE_VEHICLE_DYNASTY / tunables_processing
    [51] = FREEMODE_GLOBAL + 34455, -- ENABLE_VEHICLE_ENDURO  / tunables_processing
    [52] = FREEMODE_GLOBAL + 34403, -- ENABLE_VEHICLE_ENTITYXF / tunables_processing
    [53] = FREEMODE_GLOBAL + 17355, -- ENABLE_BIKER_ESSKEY / tunables_processing
    [54] = FREEMODE_GLOBAL + 34399, -- ENABLE_VEHICLE_SHEAVA / tunables_processing
    [55] = FREEMODE_GLOBAL + 34323, -- ENABLE_VEHICLE_EXEMPLAR / tunables_processing
    [56] = FREEMODE_GLOBAL + 34437, -- ENABLE_VEHICLE_F620 / tunables_processing
    [57] = FREEMODE_GLOBAL + 23717, -- ENABLE_FAGALOA / tunables_processing
    [58] = FREEMODE_GLOBAL + 17358, -- ENABLE_BIKER_FAGGIO / tunables_processing
    [59] = FREEMODE_GLOBAL + 17370, -- ENABLE_BIKER_FAGGIO3 / tunables_processing
    [60] = FREEMODE_GLOBAL + 34467, -- ENABLE_VEHICLE_FAGGIO2 / tunables_processing
    [61] = FREEMODE_GLOBAL + 34433, -- ENABLE_VEHICLE_FELON / tunables_processing
    [62] = FREEMODE_GLOBAL + 34435, -- ENABLE_VEHICLE_FELON2 / tunables_processing
    [63] = FREEMODE_GLOBAL + 34351, -- ENABLE_VEHICLE_FELTZER2 / tunables_processing
    [64] = FREEMODE_GLOBAL + 34411, -- ENABLE_VEHICLE_FMJ / tunables_processing
    [65] = FREEMODE_GLOBAL + 34587, -- ENABLE_VEHICLE_FQ2 / tunables_processing
    [66] = FREEMODE_GLOBAL + 34565, -- ENABLE_VEHICLE_BTYPE2 / tunables_processing
    [67] = FREEMODE_GLOBAL + 34523, -- ENABLE_VEHICLE_FUGITIVE / tunables_processing
    [68] = FREEMODE_GLOBAL + 34369, -- ENABLE_VEHICLE_FUROREGT / tunables_processing
    [69] = FREEMODE_GLOBAL + 34563, -- ENABLE_VEHICLE_FUSILADE / tunables_processing
    [70] = FREEMODE_GLOBAL + 34559, -- ENABLE_VEHICLE_FUTO / tunables_processing
    [71] = FREEMODE_GLOBAL + 34481, -- ENABLE_VEHICLE_GAUNTLET / tunables_processing
    [72] = FREEMODE_GLOBAL + 19951, -- ENABLEGP1 / tunables_processing
    [73] = FREEMODE_GLOBAL + 34581, -- ENABLE_VEHICLE_GRANGER / tunables_processing
    [74] = FREEMODE_GLOBAL + 34577, -- ENABLE_VEHICLE_GRESLEY / tunables_processing
    [75] = FREEMODE_GLOBAL + 22556, -- ENABLE_GT500 / tunables_processing
    [76] = FREEMODE_GLOBAL + 34585, -- ENABLE_VEHICLE_HABANERO / tunables_processing
    [77] = FREEMODE_GLOBAL + 34473, -- ENABLE_VEHICLE_HAKUCHOU / tunables_processing
    [78] = FREEMODE_GLOBAL + 25386, -- ENABLE_VEHICLE_HELLION / tunables_processing
    [79] = FREEMODE_GLOBAL + 22563, -- ENABLE_HERMES / tunables_processing
    [80] = FREEMODE_GLOBAL + 34457, -- ENABLE_VEHICLE_HEXER / tunables_processing
    [81] = FREEMODE_GLOBAL + 34513, -- ENABLE_VEHICLE_BLAZER3 / tunables_processing
    [82] = FREEMODE_GLOBAL + 22557, -- ENABLE_HUSTLER / tunables_processing
    [83] = FREEMODE_GLOBAL + 28201, -- ENABLE_VEHICLE_IMORGEN / tunables_processing
    [84] = FREEMODE_GLOBAL + 34405, -- ENABLE_VEHICLE_INFERNUS / tunables_processing
    [85] = FREEMODE_GLOBAL + 34541, -- ENABLE_VEHICLE_INGOT / tunables_processing
    [86] = FREEMODE_GLOBAL + 34459, -- ENABLE_VEHICLE_INNOVATION / tunables_processing
    [87] = FREEMODE_GLOBAL + 34535, -- ENABLE_VEHICLE_INTRUDER / tunables_processing
    [88] = FREEMODE_GLOBAL + 34429, -- ENABLE_VEHICLE_ISSI2 / tunables_processing
    [89] = FREEMODE_GLOBAL + 25383, -- ENABLE_VEHICLE_ISSI7 / tunables_processing
    [90] = FREEMODE_GLOBAL + 34439, -- ENABLE_VEHICLE_JACKAL / tunables_processing
    [91] = FREEMODE_GLOBAL + 34387, -- ENABLE_VEHICLE_JB700 / tunables_processing
    [92] = FREEMODE_GLOBAL + 34361, -- ENABLE_VEHICLE_JESTER / tunables_processing
    [93] = FREEMODE_GLOBAL + 34557, -- ENABLE_VEHICLE_JESTER2 / tunables_processing
    [94] = FREEMODE_GLOBAL + 34503, -- ENABLE_VEHICLE_KALAHARI / tunables_processing
    [95] = FREEMODE_GLOBAL + 34583, -- ENABLE_VEHICLE_LANDSTALKER / tunables_processing
    [96] = FREEMODE_GLOBAL + 28830, -- ENABLE_VEH_LANDSTALKER2 / tunables_processing
    [97] = FREEMODE_GLOBAL + 28190, -- ENABLE_VEHICLE_LGUARD / tunables_processing
    [98] = FREEMODE_GLOBAL + 25379, -- ENABLE_VEHICLE_LOCUST / tunables_processing
    [99] = FREEMODE_GLOBAL + 17232, -- ENABLESTUNT_LYNX / tunables_processing
    [100] = FREEMODE_GLOBAL + 34353, -- ENABLE_VEHICLE_MASSACRO / tunables_processing
    [101] = FREEMODE_GLOBAL + 34555, -- ENABLE_VEHICLE_MASSACRO2 / tunables_processing
    [102] = FREEMODE_GLOBAL + 34597, -- ENABLE_VEHICLE_MESA3 / tunables_processing
    [103] = FREEMODE_GLOBAL + 23729, -- ENABLE_MICHELLI / tunables_processing
    [104] = FREEMODE_GLOBAL + 14703, -- ENABLE_LOWRIDER2_MINIVAN / tunables_processing
    [105] = FREEMODE_GLOBAL + 25385, -- ENABLE_VEHICLE_NEBULA / tunables_processing
    [106] = FREEMODE_GLOBAL + 34471, -- ENABLE_VEHICLE_NEMESIS / tunables_processing
    [107] = FREEMODE_GLOBAL + 25396, -- ENABLE_VEHICLE_NEO / tunables_processing
    [108] = FREEMODE_GLOBAL + 34443, -- ENABLE_VEHICLE_ORACLE / tunables_processing
    [109] = FREEMODE_GLOBAL + 34441, -- ENABLE_VEHICLE_ORACLE2 / tunables_processing
    [110] = FREEMODE_GLOBAL + 25397, -- ENABLE_VEHICLE_PARAGON / tunables_processing
    [111] = FREEMODE_GLOBAL + 34591, -- ENABLE_VEHICLE_PATRIOT / tunables_processing
    [112] = FREEMODE_GLOBAL + 34475, -- ENABLE_VEHICLE_PCJ / tunables_processing
    [113] = FREEMODE_GLOBAL + 34561, -- ENABLE_VEHICLE_PENUMBRA / tunables_processing
    [114] = FREEMODE_GLOBAL + 25389, -- ENABLE_VEHICLE_PEYOTE2 / tunables_processing
    [115] = FREEMODE_GLOBAL + 34485, -- ENABLE_VEHICLE_PICADOR / tunables_processing
    [116] = FREEMODE_GLOBAL + 34567, -- ENABLE_VEHICLE_PIGALLE / tunables_processing
    [117] = FREEMODE_GLOBAL + 34427, -- ENABLE_VEHICLE_PRAIRIE / tunables_processing
    [118] = FREEMODE_GLOBAL + 34529, -- ENABLE_VEHICLE_PREMIER / tunables_processing
    [119] = FREEMODE_GLOBAL + 34595, -- ENABLE_VEHICLE_RADI / tunables_processing
    [120] = FREEMODE_GLOBAL + 22560, -- ENABLE_RAIDEN / tunables_processing
    [121] = FREEMODE_GLOBAL + 34505, -- ENABLE_VEHICLE_RANCHERXL / tunables_processing
    [122] = FREEMODE_GLOBAL + 34355, -- ENABLE_VEHICLE_RAPIDGT / tunables_processing
    [123] = FREEMODE_GLOBAL + 34357, -- ENABLE_VEHICLE_RAPIDGT2 / tunables_processing
    [124] = FREEMODE_GLOBAL + 21607, -- ENABLE_RAPIDGT3 / tunables_processing
    [125] = FREEMODE_GLOBAL + 17363, -- ENABLE_BIKER_RAPTOR / tunables_processing
    [126] = FREEMODE_GLOBAL + 17373, -- ENABLE_BIKER_RATBIKE / tunables_processing
    [127] = FREEMODE_GLOBAL + 34483, -- ENABLE_VEHICLE_RATLOADER / tunables_processing
    [128] = FREEMODE_GLOBAL + 17223, -- ENABLESTUNT_LE7B / tunables_processing
    [129] = FREEMODE_GLOBAL + 34507, -- ENABLE_VEHICLE_REBEL2 / tunables_processing
    [130] = FREEMODE_GLOBAL + 34531, -- ENABLE_VEHICLE_REGINA / tunables_processing
    [131] = FREEMODE_GLOBAL + 21606, -- ENABLE_RETINUE / tunables_processing
    [132] = FREEMODE_GLOBAL + 22558, -- ENABLE_REVOLTER / tunables_processing
    [133] = FREEMODE_GLOBAL + 22562, -- ENABLE_RIATA / tunables_processing
    [134] = FREEMODE_GLOBAL + 34593, -- ENABLE_VEHICLE_ROCOTO / tunables_processing
    [135] = FREEMODE_GLOBAL + 34521, -- ENABLE_VEHICLE_ROMERO / tunables_processing
    [136] = FREEMODE_GLOBAL + 34377, -- ENABLE_VEHICLE_BTYPE / tunables_processing
    [137] = FREEMODE_GLOBAL + 34393, -- ENABLE_VEHICLE_BTYPE3 / tunables_processing
    [138] = FREEMODE_GLOBAL + 34469, -- ENABLE_VEHICLE_RUFFIAN / tunables_processing
    [139] = FREEMODE_GLOBAL + 34489, -- ENABLE_VEHICLE_RUINER / tunables_processing
    [140] = FREEMODE_GLOBAL + 19953, -- ENABLERUSTON / tunables_processing
    [141] = FREEMODE_GLOBAL + 34509, -- ENABLE_VEHICLE_REBEL / tunables_processing
    [142] = FREEMODE_GLOBAL + 25393, -- ENABLE_VEHICLE_S80 / tunables_processing
    [143] = FREEMODE_GLOBAL + 34463, -- ENABLE_VEHICLE_SANCHEZ2 / tunables_processing
    [144] = FREEMODE_GLOBAL + 34461, -- ENABLE_VEHICLE_SANCHEZ / tunables_processing
    [145] = FREEMODE_GLOBAL + 17366, -- ENABLE_BIKER_SANCTUS / tunables_processing
    [146] = FREEMODE_GLOBAL + 34515, -- ENABLE_VEHICLE_SANDKING2 / tunables_processing
    [147] = FREEMODE_GLOBAL + 22561, -- ENABLE_SAVESTRA / tunables_processing
    [148] = FREEMODE_GLOBAL + 22554, -- ENABLE_SC1 / tunables_processing
    [149] = FREEMODE_GLOBAL + 34519, -- ENABLE_VEHICLE_SCHAFTER2 / tunables_processing
    [150] = FREEMODE_GLOBAL + 34345, -- ENABLE_VEHICLE_SCHAFTER4 / tunables_processing
    [151] = FREEMODE_GLOBAL + 34347, -- ENABLE_VEHICLE_SCHAFTER6 / tunables_processing
    [152] = FREEMODE_GLOBAL + 34547, -- ENABLE_VEHICLE_SCHWARZER / tunables_processing
    [153] = FREEMODE_GLOBAL + 34579, -- ENABLE_VEHICLE_SEMINOLE / tunables_processing
    [154] = FREEMODE_GLOBAL + 28831, -- ENABLE_VEH_SEMINOLE2 / tunables_processing
    [155] = FREEMODE_GLOBAL + 34445, -- ENABLE_VEHICLE_SENTINEL2 / tunables_processing
    [156] = FREEMODE_GLOBAL + 34575, -- ENABLE_VEHICLE_SERRANO / tunables_processing
    [157] = FREEMODE_GLOBAL + 34359, -- ENABLE_VEHICLE_SEVEN70 / tunables_processing
    [158] = FREEMODE_GLOBAL + 34479, -- ENABLE_VEHICLE_SOVEREIGN / tunables_processing
    [159] = FREEMODE_GLOBAL + 23781, -- ENABLE_STAFFORD / tunables_processing
    [160] = FREEMODE_GLOBAL + 34539, -- ENABLE_VEHICLE_STANIER / tunables_processing
    [161] = FREEMODE_GLOBAL + 34383, -- ENABLE_VEHICLE_STINGER / tunables_processing
    [162] = FREEMODE_GLOBAL + 34381, -- ENABLE_VEHICLE_STINGERGT / tunables_processing
    [163] = FREEMODE_GLOBAL + 34379, -- ENABLE_VEHICLE_FELTZER3 / tunables_processing
    [164] = FREEMODE_GLOBAL + 34545, -- ENABLE_VEHICLE_STRATUM / tunables_processing
    [165] = FREEMODE_GLOBAL + 22551, -- ENABLE_STREITER / tunables_processing
    [166] = FREEMODE_GLOBAL + 34343, -- ENABLE_VEHICLE_SUPERD / tunables_processing
    [167] = FREEMODE_GLOBAL + 34549, -- ENABLE_VEHICLE_SURANO / tunables_processing
    [168] = FREEMODE_GLOBAL + 34525, -- ENABLE_VEHICLE_SURGE / tunables_processing
    [169] = FREEMODE_GLOBAL + 23780, -- ENABLE_SWINGER / tunables_processing
    [170] = FREEMODE_GLOBAL + 34537, -- ENABLE_VEHICLE_TAILGATER / tunables_processing
    [171] = FREEMODE_GLOBAL + 34327, -- ENABLE_VEHICLE_THRUST / tunables_processing
    [172] = FREEMODE_GLOBAL + 29156, -- ENABLE_VEH_TIGON / tunables_processing
    [173] = FREEMODE_GLOBAL + 20830, -- ENABLE_TORERO / tunables_processing
    [174] = FREEMODE_GLOBAL + 17371, -- ENABLE_BIKER_TORNADO6 / tunables_processing
    [175] = FREEMODE_GLOBAL + 25370, -- ENABLE_VEHICLE_TULIP / tunables_processing
    [176] = FREEMODE_GLOBAL + 17221, -- ENABLESTUNT_TYRUS / tunables_processing
    [177] = FREEMODE_GLOBAL + 34407, -- ENABLE_VEHICLE_VACCA / tunables_processing
    [178] = FREEMODE_GLOBAL + 34477, -- ENABLE_VEHICLE_VADER / tunables_processing
    [179] = FREEMODE_GLOBAL + 26330, -- ENABLE_VEHICLE_VAMOS / tunables_processing
    [180] = FREEMODE_GLOBAL + 34375, -- ENABLE_VEHICLE_VERLIERER2 / tunables_processing
    [181] = FREEMODE_GLOBAL + 29605, -- ENABLE_VEHICLE_VERUS / tunables_processing
    [182] = FREEMODE_GLOBAL + 34487, -- ENABLE_VEHICLE_VIGERO / tunables_processing
    [183] = FREEMODE_GLOBAL + 22566, -- ENABLE_VISERIS / tunables_processing
    [184] = FREEMODE_GLOBAL + 34397, -- ENABLE_VEHICLE_VOLTIC / tunables_processing
    [185] = FREEMODE_GLOBAL + 34543, -- ENABLE_VEHICLE_WARRENER / tunables_processing
    [186] = FREEMODE_GLOBAL + 34517, -- ENABLE_VEHICLE_WASHINGTON / tunables_processing
    [187] = FREEMODE_GLOBAL + 17369, -- ENABLE_BIKER_WOLFSBANE / tunables_processing
    [188] = FREEMODE_GLOBAL + 20828, -- ENABLE_XA21 / tunables_processing
    [189] = FREEMODE_GLOBAL + 34423, -- ENABLE_VEHICLE_XLS / tunables_processing
    [190] = FREEMODE_GLOBAL + 34425, -- ENABLE_VEHICLE_XLS2 / tunables_processing
    [191] = FREEMODE_GLOBAL + 34395, -- ENABLE_VEHICLE_ZTYPE / tunables_processing
    [192] = FREEMODE_GLOBAL + 34447, -- ENABLE_VEHICLE_ZION / tunables_processing
    [193] = FREEMODE_GLOBAL + 34449, -- ENABLE_VEHICLE_ZION2 / tunables_processing
    [194] = FREEMODE_GLOBAL + 25384, -- ENABLE_VEHICLE_ZION3 / tunables_processing
    [195] = FREEMODE_GLOBAL + 17354, -- ENABLE_BIKER_ZOMBIEA / tunables_processing
    [196] = FREEMODE_GLOBAL + 25381, -- ENABLE_VEHICLE_ZORRUSSO / tunables_processing
    [197] = FREEMODE_GLOBAL + 34599 -- ENABLE_VEHICLE_MONSTER / tunables_processing
}

GUNVAN_GLOBAL = 2652592 + 2671 + 1

GUNVAN_COORDS = {
    [0] = {-29.532, 6435.136, 31.162},
    [1] = {1705.214, 4819.167, 41.75},
    [2] = {1795.522, 3899.753, 33.869},
    [3] = {1335.536, 2758.746, 51.099},
    [4] = {795.583, 1210.78, 338.962},
    [5] = {-3192.67, 1077.205, 20.594},
    [6] = {-789.719, 5400.921, 33.915},
    [7] = {-24.384, 3048.167, 40.703},
    [8] = {2666.786, 1469.324, 24.237},
    [9] = {-1454.966, 2667.503, 3.2},
    [10] = {2340.418, 3054.188, 47.888},
    [11] = {1509.183, -2146.795, 76.853},
    [12] = {1137.404, -1358.654, 34.322},
    [13] = {-57.208, -2658.793, 5.737},
    [14] = {1905.017, 565.222, 175.558},
    [15] = {974.484, -1718.798, 30.296},
    [16] = {779.077, -3266.297, 5.719},
    [17] = {-587.728, -1637.208, 19.611},
    [18] = {733.99, -736.803, 26.165},
    [19] = {-1694.632, -454.082, 40.712},
    [20] = {-1330.726, -1163.948, 4.313},
    [21] = {-496.618, 40.231, 52.316},
    [22] = {275.527, 66.509, 94.108},
    [23] = {260.928, -763.35, 30.559},
    [24] = {-478.025, -741.45, 30.299},
    [25] = {894.94, 3603.911, 32.56},
    [26] = {-2166.511, 4289.503, 48.733},
    [27] = {1465.633, 6553.67, 13.771},
    [28] = {1101.032, -335.172, 66.944},
    [29] = {149.683, -1655.674, 29.028}
}
