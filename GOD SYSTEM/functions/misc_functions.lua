---- /godmode
-- Data
deleted_vehicles = {
    [1]   = 262145 + 22565, -- ENABLE_Z190 / tunables_processing
    [2]   = 262145 + 14708, -- ENABLEEXEC1_PFISTER / tunables_processing
    [3]   = 262145 + 34371, -- ENABLE_VEHICLE_NINEF / tunables_processing
    [4]   = 262145 + 34373, -- ENABLE_VEHICLE_NINEF2 / tunables_processing
    [5]   = 262145 + 34451, -- ENABLE_VEHICLE_AKUMA / tunables_processing
    [6]   = 262145 + 34349, -- ENABLE_VEHICLE_ALPHA / tunables_processing
    [7]   = 262145 + 34527, -- ENABLE_VEHICLE_ASEA / tunables_processing
    [8]   = 262145 + 35180, -- ENABLE_VEHICLE_ASTEROPE / tunables_processing
    [9]   = 262145 + 17356, -- ENABLE_BIKER_AVARUS / tunables_processing
    [10]  = 262145 + 17372, -- ENABLE_BIKER_BAGGER / tunables_processing
    [11]  = 262145 + 35188, -- ENABLE_VEHICLE_BALLER / tunables_processing
    [12]  = 262145 + 34413, -- ENABLE_VEHICLE_BALLER2 / tunables_processing
    [13]  = 262145 + 34415, -- ENABLE_VEHICLE_BALLER3 / tunables_processing
    [14]  = 262145 + 34417, -- ENABLE_VEHICLE_BALLER5 / tunables_processing
    [15]  = 262145 + 34465, -- ENABLE_VEHICLE_BATI2 / tunables_processing
    [16]  = 262145 + 34573, -- ENABLE_VEHICLE_BJXL / tunables_processing
    [17]  = 262145 + 34499, -- ENABLE_VEHICLE_BFINJECTION / tunables_processing
    [18]  = 262145 + 34495, -- ENABLE_VEHICLE_BIFTA / tunables_processing
    [19]  = 262145 + 34493, -- ENABLE_VEHICLE_BLADE / tunables_processing
    [20]  = 262145 + 34511, -- ENABLE_VEHICLE_BLAZER / tunables_processing
    [21]  = 262145 + 28191, -- ENABLE_VEHICLE_BLAZER2 / tunables_processing
    [22]  = 262145 + 34501, -- ENABLE_VEHICLE_BODHI2 / tunables_processing
    [23]  = 262145 + 34333, -- ENABLE_VEHICLE_BRAWLER / tunables_processing
    [24]  = 262145 + 34551, -- ENABLE_VEHICLE_BUFFALO / tunables_processing
    [25]  = 262145 + 34553, -- ENABLE_VEHICLE_BUFFALO2 / tunables_processing
    [26]  = 262145 + 34409, -- ENABLE_VEHICLE_BULLET / tunables_processing
    [27]  = 262145 + 34569, -- ENABLE_VEHICLE_CAVALCADE / tunables_processing
    [28]  = 262145 + 34571, -- ENABLE_VEHICLE_CAVALCADE2 / tunables_processing
    [29]  = 262145 + 23726, -- ENABLE_CHEBUREK / tunables_processing
    [30]  = 262145 + 34401, -- ENABLE_VEHICLE_CHEETAH / tunables_processing
    [31]  = 262145 + 17230, -- ENABLESTUNT_CLIFFHANGER / tunables_processing
    [32]  = 262145 + 25367, -- ENABLE_VEHICLE_CLIQUE / tunables_processing
    [33]  = 262145 + 34335, -- ENABLE_VEHICLE_COGNOSCENTI / tunables_processing
    [34]  = 262145 + 34337, -- ENABLE_VEHICLE_COGNOSCENTI2 / tunables_processing
    [35]  = 262145 + 34339, -- ENABLE_VEHICLE_COG55 / tunables_processing
    [36]  = 262145 + 34341, -- ENABLE_VEHICLE_COG552 / tunables_processing
    [37]  = 262145 + 34325, -- ENABLE_VEHICLE_COGCABRIO / tunables_processing
    [38]  = 262145 + 18947, -- ENABLE_IE_COMET2 / tunables_processing
    [39]  = 262145 + 18948, -- ENABLE_IE_COMET3 / tunables_processing
    [40]  = 262145 + 22564, -- ENABLE_COMET5 / tunables_processing
    [41]  = 262145 + 17229, -- ENABLESTUNT_CONTENDER / tunables_processing
    [42]  = 262145 + 34367, -- ENABLE_VEHICLE_COQUETTE / tunables_processing
    [43]  = 262145 + 34331, -- ENABLE_VEHICLE_COQUETTE3 / tunables_processing
    [44]  = 262145 + 21603, -- ENABLE_CYCLONE / tunables_processing
    [45]  = 262145 + 17364, -- ENABLE_BIKER_WESTERNDAEMON / tunables_processing
    [46]  = 262145 + 25369, -- ENABLE_VEHICLE_DEVIANT / tunables_processing
    [47]  = 262145 + 34431, -- ENABLE_VEHICLE_DILETTANTE / tunables_processing
    [48]  = 262145 + 34453, -- ENABLE_VEHICLE_DOUBLE / tunables_processing
    [49]  = 262145 + 34497, -- ENABLE_VEHICLE_DUNE / tunables_processing
    [50]  = 262145 + 25387, -- ENABLE_VEHICLE_DYNASTY / tunables_processing
    [51]  = 262145 + 34455, -- ENABLE_VEHICLE_ENDURO  / tunables_processing
    [52]  = 262145 + 34403, -- ENABLE_VEHICLE_ENTITYXF / tunables_processing
    [53]  = 262145 + 17355, -- ENABLE_BIKER_ESSKEY / tunables_processing
    [54]  = 262145 + 34399, -- ENABLE_VEHICLE_SHEAVA / tunables_processing
    [55]  = 262145 + 34323, -- ENABLE_VEHICLE_EXEMPLAR / tunables_processing
    [56]  = 262145 + 34437, -- ENABLE_VEHICLE_F620 / tunables_processing
    [57]  = 262145 + 23717, -- ENABLE_FAGALOA / tunables_processing
    [58]  = 262145 + 17358, -- ENABLE_BIKER_FAGGIO / tunables_processing
    [59]  = 262145 + 17370, -- ENABLE_BIKER_FAGGIO3 / tunables_processing
    [60]  = 262145 + 34467, -- ENABLE_VEHICLE_FAGGIO2 / tunables_processing
    [61]  = 262145 + 34433, -- ENABLE_VEHICLE_FELON / tunables_processing
    [62]  = 262145 + 34435, -- ENABLE_VEHICLE_FELON2 / tunables_processing
    [63]  = 262145 + 34351, -- ENABLE_VEHICLE_FELTZER2 / tunables_processing
    [64]  = 262145 + 34411, -- ENABLE_VEHICLE_FMJ / tunables_processing
    [65]  = 262145 + 34587, -- ENABLE_VEHICLE_FQ2 / tunables_processing
    [66]  = 262145 + 34565, -- ENABLE_VEHICLE_BTYPE2 / tunables_processing
    [67]  = 262145 + 34523, -- ENABLE_VEHICLE_FUGITIVE / tunables_processing
    [68]  = 262145 + 34369, -- ENABLE_VEHICLE_FUROREGT / tunables_processing
    [69]  = 262145 + 34563, -- ENABLE_VEHICLE_FUSILADE / tunables_processing
    [70]  = 262145 + 34559, -- ENABLE_VEHICLE_FUTO / tunables_processing
    [71]  = 262145 + 34481, -- ENABLE_VEHICLE_GAUNTLET / tunables_processing
    [72]  = 262145 + 19951, -- ENABLEGP1 / tunables_processing
    [73]  = 262145 + 34581, -- ENABLE_VEHICLE_GRANGER / tunables_processing
    [74]  = 262145 + 34577, -- ENABLE_VEHICLE_GRESLEY / tunables_processing
    [75]  = 262145 + 22556, -- ENABLE_GT500 / tunables_processing
    [76]  = 262145 + 34585, -- ENABLE_VEHICLE_HABANERO / tunables_processing
    [77]  = 262145 + 34473, -- ENABLE_VEHICLE_HAKUCHOU / tunables_processing
    [78]  = 262145 + 25386, -- ENABLE_VEHICLE_HELLION / tunables_processing
    [79]  = 262145 + 22563, -- ENABLE_HERMES / tunables_processing
    [80]  = 262145 + 34457, -- ENABLE_VEHICLE_HEXER / tunables_processing
    [81]  = 262145 + 34513, -- ENABLE_VEHICLE_BLAZER3 / tunables_processing
    [82]  = 262145 + 22557, -- ENABLE_HUSTLER / tunables_processing
    [83]  = 262145 + 28201, -- ENABLE_VEHICLE_IMORGEN / tunables_processing
    [84]  = 262145 + 34405, -- ENABLE_VEHICLE_INFERNUS / tunables_processing
    [85]  = 262145 + 34541, -- ENABLE_VEHICLE_INGOT / tunables_processing
    [86]  = 262145 + 34459, -- ENABLE_VEHICLE_INNOVATION / tunables_processing
    [87]  = 262145 + 34535, -- ENABLE_VEHICLE_INTRUDER / tunables_processing
    [88]  = 262145 + 34429, -- ENABLE_VEHICLE_ISSI2 / tunables_processing
    [89]  = 262145 + 25383, -- ENABLE_VEHICLE_ISSI7 / tunables_processing
    [90]  = 262145 + 34439, -- ENABLE_VEHICLE_JACKAL / tunables_processing
    [91]  = 262145 + 34387, -- ENABLE_VEHICLE_JB700 / tunables_processing
    [92]  = 262145 + 34361, -- ENABLE_VEHICLE_JESTER / tunables_processing
    [93]  = 262145 + 34557, -- ENABLE_VEHICLE_JESTER2 / tunables_processing
    [94]  = 262145 + 34503, -- ENABLE_VEHICLE_KALAHARI / tunables_processing
    [95]  = 262145 + 34583, -- ENABLE_VEHICLE_LANDSTALKER / tunables_processing
    [96]  = 262145 + 28830, -- ENABLE_VEH_LANDSTALKER2 / tunables_processing
    [97]  = 262145 + 28190, -- ENABLE_VEHICLE_LGUARD / tunables_processing
    [98]  = 262145 + 25379, -- ENABLE_VEHICLE_LOCUST / tunables_processing
    [99]  = 262145 + 17232, -- ENABLESTUNT_LYNX / tunables_processing
    [100] = 262145 + 34353, -- ENABLE_VEHICLE_MASSACRO / tunables_processing
    [101] = 262145 + 34555, -- ENABLE_VEHICLE_MASSACRO2 / tunables_processing
    [102] = 262145 + 34597, -- ENABLE_VEHICLE_MESA3 / tunables_processing
    [103] = 262145 + 23729, -- ENABLE_MICHELLI / tunables_processing
    [104] = 262145 + 14703, -- ENABLE_LOWRIDER2_MINIVAN / tunables_processing
    [105] = 262145 + 25385, -- ENABLE_VEHICLE_NEBULA / tunables_processing
    [106] = 262145 + 34471, -- ENABLE_VEHICLE_NEMESIS / tunables_processing
    [107] = 262145 + 25396, -- ENABLE_VEHICLE_NEO / tunables_processing
    [108] = 262145 + 34443, -- ENABLE_VEHICLE_ORACLE / tunables_processing
    [109] = 262145 + 34441, -- ENABLE_VEHICLE_ORACLE2 / tunables_processing
    [110] = 262145 + 25397, -- ENABLE_VEHICLE_PARAGON / tunables_processing
    [111] = 262145 + 34591, -- ENABLE_VEHICLE_PATRIOT / tunables_processing
    [112] = 262145 + 34475, -- ENABLE_VEHICLE_PCJ / tunables_processing
    [113] = 262145 + 34561, -- ENABLE_VEHICLE_PENUMBRA / tunables_processing
    [114] = 262145 + 25389, -- ENABLE_VEHICLE_PEYOTE2 / tunables_processing
    [115] = 262145 + 34485, -- ENABLE_VEHICLE_PICADOR / tunables_processing
    [116] = 262145 + 34567, -- ENABLE_VEHICLE_PIGALLE / tunables_processing
    [117] = 262145 + 34427, -- ENABLE_VEHICLE_PRAIRIE / tunables_processing
    [118] = 262145 + 34529, -- ENABLE_VEHICLE_PREMIER / tunables_processing
    [119] = 262145 + 34595, -- ENABLE_VEHICLE_RADI / tunables_processing
    [120] = 262145 + 22560, -- ENABLE_RAIDEN / tunables_processing
    [121] = 262145 + 34505, -- ENABLE_VEHICLE_RANCHERXL / tunables_processing
    [122] = 262145 + 34355, -- ENABLE_VEHICLE_RAPIDGT / tunables_processing
    [123] = 262145 + 34357, -- ENABLE_VEHICLE_RAPIDGT2 / tunables_processing
    [124] = 262145 + 21607, -- ENABLE_RAPIDGT3 / tunables_processing
    [125] = 262145 + 17363, -- ENABLE_BIKER_RAPTOR / tunables_processing
    [126] = 262145 + 17373, -- ENABLE_BIKER_RATBIKE / tunables_processing
    [127] = 262145 + 34483, -- ENABLE_VEHICLE_RATLOADER / tunables_processing
    [128] = 262145 + 17223, -- ENABLESTUNT_LE7B / tunables_processing
    [129] = 262145 + 34507, -- ENABLE_VEHICLE_REBEL2 / tunables_processing
    [130] = 262145 + 34531, -- ENABLE_VEHICLE_REGINA / tunables_processing
    [131] = 262145 + 21606, -- ENABLE_RETINUE / tunables_processing
    [132] = 262145 + 22558, -- ENABLE_REVOLTER / tunables_processing
    [133] = 262145 + 22562, -- ENABLE_RIATA / tunables_processing
    [134] = 262145 + 34593, -- ENABLE_VEHICLE_ROCOTO / tunables_processing
    [135] = 262145 + 34521, -- ENABLE_VEHICLE_ROMERO / tunables_processing
    [136] = 262145 + 34377, -- ENABLE_VEHICLE_BTYPE / tunables_processing
    [137] = 262145 + 34393, -- ENABLE_VEHICLE_BTYPE3 / tunables_processing
    [138] = 262145 + 34469, -- ENABLE_VEHICLE_RUFFIAN / tunables_processing
    [139] = 262145 + 34489, -- ENABLE_VEHICLE_RUINER / tunables_processing
    [140] = 262145 + 19953, -- ENABLERUSTON / tunables_processing
    [141] = 262145 + 34509, -- ENABLE_VEHICLE_REBEL / tunables_processing
    [142] = 262145 + 25393, -- ENABLE_VEHICLE_S80 / tunables_processing
    [143] = 262145 + 34463, -- ENABLE_VEHICLE_SANCHEZ2 / tunables_processing
    [144] = 262145 + 34461, -- ENABLE_VEHICLE_SANCHEZ / tunables_processing
    [145] = 262145 + 17366, -- ENABLE_BIKER_SANCTUS / tunables_processing
    [146] = 262145 + 34515, -- ENABLE_VEHICLE_SANDKING2 / tunables_processing
    [147] = 262145 + 22561, -- ENABLE_SAVESTRA / tunables_processing
    [148] = 262145 + 22554, -- ENABLE_SC1 / tunables_processing
    [149] = 262145 + 34519, -- ENABLE_VEHICLE_SCHAFTER2 / tunables_processing
    [150] = 262145 + 34345, -- ENABLE_VEHICLE_SCHAFTER4 / tunables_processing
    [151] = 262145 + 34347, -- ENABLE_VEHICLE_SCHAFTER6 / tunables_processing
    [152] = 262145 + 34547, -- ENABLE_VEHICLE_SCHWARZER / tunables_processing
    [153] = 262145 + 34579, -- ENABLE_VEHICLE_SEMINOLE / tunables_processing
    [154] = 262145 + 28831, -- ENABLE_VEH_SEMINOLE2 / tunables_processing
    [155] = 262145 + 34445, -- ENABLE_VEHICLE_SENTINEL2 / tunables_processing
    [156] = 262145 + 34575, -- ENABLE_VEHICLE_SERRANO / tunables_processing
    [157] = 262145 + 34359, -- ENABLE_VEHICLE_SEVEN70 / tunables_processing
    [158] = 262145 + 34479, -- ENABLE_VEHICLE_SOVEREIGN / tunables_processing
    [159] = 262145 + 23781, -- ENABLE_STAFFORD / tunables_processing
    [160] = 262145 + 34539, -- ENABLE_VEHICLE_STANIER / tunables_processing
    [161] = 262145 + 34383, -- ENABLE_VEHICLE_STINGER / tunables_processing
    [162] = 262145 + 34381, -- ENABLE_VEHICLE_STINGERGT / tunables_processing
    [163] = 262145 + 34379, -- ENABLE_VEHICLE_FELTZER3 / tunables_processing
    [164] = 262145 + 34545, -- ENABLE_VEHICLE_STRATUM / tunables_processing
    [165] = 262145 + 22551, -- ENABLE_STREITER / tunables_processing
    [166] = 262145 + 34343, -- ENABLE_VEHICLE_SUPERD / tunables_processing
    [167] = 262145 + 34549, -- ENABLE_VEHICLE_SURANO / tunables_processing
    [168] = 262145 + 34525, -- ENABLE_VEHICLE_SURGE / tunables_processing
    [169] = 262145 + 23780, -- ENABLE_SWINGER / tunables_processing
    [170] = 262145 + 34537, -- ENABLE_VEHICLE_TAILGATER / tunables_processing
    [171] = 262145 + 34327, -- ENABLE_VEHICLE_THRUST / tunables_processing
    [172] = 262145 + 29156, -- ENABLE_VEH_TIGON / tunables_processing
    [173] = 262145 + 20830, -- ENABLE_TORERO / tunables_processing
    [174] = 262145 + 17371, -- ENABLE_BIKER_TORNADO6 / tunables_processing
    [175] = 262145 + 25370, -- ENABLE_VEHICLE_TULIP / tunables_processing
    [176] = 262145 + 17221, -- ENABLESTUNT_TYRUS / tunables_processing
    [177] = 262145 + 34407, -- ENABLE_VEHICLE_VACCA / tunables_processing
    [178] = 262145 + 34477, -- ENABLE_VEHICLE_VADER / tunables_processing
    [179] = 262145 + 26330, -- ENABLE_VEHICLE_VAMOS / tunables_processing
    [180] = 262145 + 34375, -- ENABLE_VEHICLE_VERLIERER2 / tunables_processing
    [181] = 262145 + 29605, -- ENABLE_VEHICLE_VERUS / tunables_processing
    [182] = 262145 + 34487, -- ENABLE_VEHICLE_VIGERO / tunables_processing
    [183] = 262145 + 22566, -- ENABLE_VISERIS / tunables_processing
    [184] = 262145 + 34397, -- ENABLE_VEHICLE_VOLTIC / tunables_processing
    [185] = 262145 + 34543, -- ENABLE_VEHICLE_WARRENER / tunables_processing
    [186] = 262145 + 34517, -- ENABLE_VEHICLE_WASHINGTON / tunables_processing
    [187] = 262145 + 17369, -- ENABLE_BIKER_WOLFSBANE / tunables_processing
    [188] = 262145 + 20828, -- ENABLE_XA21 / tunables_processing
    [189] = 262145 + 34423, -- ENABLE_VEHICLE_XLS / tunables_processing
    [190] = 262145 + 34425, -- ENABLE_VEHICLE_XLS2 / tunables_processing
    [191] = 262145 + 34395, -- ENABLE_VEHICLE_ZTYPE / tunables_processing
    [192] = 262145 + 34447, -- ENABLE_VEHICLE_ZION / tunables_processing
    [193] = 262145 + 34449, -- ENABLE_VEHICLE_ZION2 / tunables_processing
    [194] = 262145 + 25384, -- ENABLE_VEHICLE_ZION3 / tunables_processing
    [195] = 262145 + 17354, -- ENABLE_BIKER_ZOMBIEA / tunables_processing
    [196] = 262145 + 25381, -- ENABLE_VEHICLE_ZORRUSSO / tunables_processing
    [197] = 262145 + 34599 -- ENABLE_VEHICLE_MONSTER / tunables_processing
}

gunvan_coords = {
    [0]  = {-29.532,     6435.136,    31.162 },
    [1]  = {1705.214,    4819.167,    41.75  },
    [2]  = {1795.522,    3899.753,    33.869 },
    [3]  = {1335.536,    2758.746,    51.099 },
    [4]  = {795.583,     1210.78,     338.962},
    [5]  = {-3192.67,    1077.205,    20.594 },
    [6]  = {-789.719,    5400.921,    33.915 },
    [7]  = {-24.384,     3048.167,    40.703 },
    [8]  = {2666.786,    1469.324,    24.237 },
    [9]  = {-1454.966,   2667.503,    3.2    },
    [10] = {2340.418,    3054.188,    47.888 },
    [11] = {1509.183,    -2146.795,   76.853 },
    [12] = {1137.404,    -1358.654,   34.322 },
    [13] = {-57.208,     -2658.793,   5.737  },
    [14] = {1905.017,    565.222,     175.558},
    [15] = {974.484,     -1718.798,   30.296 },
    [16] = {779.077,     -3266.297,   5.719  },
    [17] = {-587.728,    -1637.208,   19.611 },
    [18] = {733.99,      -736.803,    26.165 },
    [19] = {-1694.632,   -454.082,    40.712 },
    [20] = {-1330.726,   -1163.948,   4.313  },
    [21] = {-496.618,    40.231,      52.316 },
    [22] = {275.527,     66.509,      94.108 },
    [23] = {260.928,     -763.35,     30.559 },
    [24] = {-478.025,    -741.45,     30.299 },
    [25] = {894.94,      3603.911,    32.56  },
    [26] = {-2166.511,   4289.503,    48.733 },
    [27] = {1465.633,    6553.67,     13.771 },
    [28] = {1101.032,    -335.172,    66.944 },
    [29] = {149.683,     -1655.674,   29.028 }
}

function check_table(arg, table)
    for k, v in pairs(table) do
        if k == arg then
            return true
        end
    end
    return false
end

-- Unlocks group
function unlock_deleted_vehs_function()
    for i = 1, #deleted_vehicles do
        script.get_global(deleted_vehicles[i]):write_u32(1)
    end
    ui.popup('GOD SYSTEM', 'Done', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
end

function unlock_ls_carmeet_vehicle_function()
    stats.set_bool(string.smart_joaat('MP'..stats.get_character_index()..'_CARMEET_PV_CHLLGE_CMPLT'), true)
    stats.set_bool(string.smart_joaat('MP'..stats.get_character_index()..'_CARMEET_PV_CLMED'), false)
    ui.popup('GOD SYSTEM', 'Done', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
end

-- Other group

function tp_to_gunvan_function()
    local gunvan_position = script.get_global(2652568 + 2706 + 1):read_u32()
    if check_table(gunvan_position, gunvan_coords) then
        local gunvan_coords = gunvan_coords[gunvan_position]
        utils.teleport_self(gunvan_coords[1], gunvan_coords[2], gunvan_coords[3])
        ui.popup('GOD SYSTEM', 'Done', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
    else
        ui.popup('GOD SYSTEM', "Couldn't find gun van", Icons.CANCEL2, PopupType.BOX)
    end
end
