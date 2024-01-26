--- Стафф меню ------------------------------------------------------

Stuff = {
    ramps = {},
    bodyguards = {},
    ufos = {},
    attackers = {},
    isTextChatActive = false,
    blacklistedVehicles = {},
    onBlacklistedVehicle = function () end,
    trackedPlayers = {},
    guiKeyState = {},
    spectatingPlayer = nil,
    vehicleAccessSort = function ()
        return true
    end,
    EtaToWaypointData = {
        text = '',
        dist = '',
        arrivalTime = ''
    },
    bodyguardsTarget = nil,
}

a2i = tonumber
i2s = tostring
rnd = math.random

--- Разные данные ---------------------------------------------------

Apartments = {
    [0] = {name= 'Офис не найден'},
    [87]  = {name = 'Западное здание Lombank', coords = {x = -1583.427612,  y =  -557.392517,  z = 33.654240 }},
    [88]  = {name = 'Западное здание Maze Bank', coords = {x = -1371.461670,   y =  -506.922180, z = 31.857445 }},
    [89]  = {name = 'Бизнес-центр Arcadius', coords = {x = -106.573792,  y =  -612.973083, z = 34.766911 }},
    [90]  = {name = 'Башня Maze Bank', coords = {x = -82.427208,   y =  -795.496277,    z = 42.927375}}
}

Warehouse = {
    [0]  = {name = 'Склад не найден', capacity = 0,},
    [1]  = {name = 'Хранилище Пасифик Бейт',      capacity = 16,      coords = {x = 54.191,    y = -2569.248,  z = 6.0046 }},
    [2]  = {name = 'Гараж Уайт Видоу',        capacity = 16,      coords = {x = -1083.054, y = -1261.893,  z = 5.534  }},
    [3]  = {name = 'Блок Целлтау',             capacity = 16,      coords = {x = 896.3665,  y = -1035.749,  z = 35.1096}},
    [4]  = {name = 'Кладовка магазина',  capacity = 16,      coords = {x = 247.473,   y = -1956.943,  z = 23.1908}},
    [5]  = {name = 'Изъятый гараж',         capacity = 16,      coords = {x = -424.828,  y = 185.825,    z = 80.775 }},
    [6]  = {name = 'Газовая фабрика Xero',          capacity = 111,     coords = {x = -1042.482, y = -2023.516,  z = 13.1616}},
    [7]  = {name = 'Derriere на Бэклот', capacity = 42,      coords = {x = -1268.119, y = -812.2741,  z = 17.1075}},
    [8]  = {name = 'Склад Bilgeco',         capacity = 111,     coords = {x = -874,   y = -2736,  z = 13.9438}},
    [9]  = {name = 'Пирс 400, хозяйственный блок', capacity = 16,      coords = {x = 274.5224,  y = -3015.413,  z = 5.6993 }},
    [10] = {name = 'Склад GEE',             capacity = 42,      coords = {x = 1569.69,   y = -2129.792,  z = 78.3351}},
    [11] = {name = 'Портовый склад №3',      capacity = 42,      coords = {x = -315.551,  y = -2698.654,  z = 7.5495 }},
    [12] = {name = 'Железнодорожный склад',        capacity = 42,      coords = {x = 499.81,    y = -651.982,   z = 24.909 }},
    [13] = {name = 'Пристройка Фриджит',            capacity = 42,      coords = {x = -528.5296, y = -1784.573,  z = 21.5853}},
    [14] = {name = 'Заброшенный фабричный магазин',    capacity = 42,      coords = {x = -295.8596, y = -1353.238,  z = 31.3138}},
    [15] = {name = 'Дисконтная розничная точка',      capacity = 42,      coords = {x = 349.839,   y = 328.889,    z = 104.272}},
    [16] = {name = 'Склад снабжения',           capacity = 111,     coords = {x = 926.2818,  y = -1560.311,  z = 30.7404}},
    [17] = {name = 'Склад Darnell Bros',    capacity = 111,     coords = {x = 759.566,   y = -909.466,   z = 25.244 }},
    [18] = {name = 'Мебельная оптовая точка',       capacity = 111,     coords = {x = 1037.813,  y = -2173.062,  z = 31.5334}},
    [19] = {name = 'Склады Cypress',        capacity = 111,     coords = {x = 1019.116,  y = -2511.69,   z = 28.302 }},
    [20] = {name = 'Западный Вайнвуд, Бэклот',     capacity = 111,     coords = {x = -245.3405, y = 203.3286,   z = 83.818 }},
    [21] = {name = 'Старая электростанция',         capacity = 42,      coords = {x = 539.346,   y = -1945.682,  z = 24.984 }},
    [22] = {name = 'Склад Walker & Sons',   capacity = 111,     coords = {x = 96.1538,   y = -2216.4,    z = 6.1712 }}
}

Auto_name = {
    [1] = 'Налет на федеральное хранилище',
    [2] = 'Дело "Супердоллары"',
    [3] = 'Налет на банк',
    [4] = 'Захват ЭБУ',
    [5] = 'Налет на тюрьму',
    [6] = 'Налет на ЦУР',
    [7] = 'Налет на "Пропащих"',
    [8] = 'Похищение данных'
}
Auto_val = {
    [1] = 0,
    [2] = 1,
    [3] = 2,
    [4] = 3,
    [5] = 4,
    [6] = 5,
    [7] = 6,
    [8] = 7
}

CasApproach_name = {
    [1] = 'Скрытность',
    [2] = 'Обман',
    [3] = 'Штурм'
}

CasApproach_val = {
    [1] = 3,
    [2] = 3,
    [3] = 1
}

CasMain_name = {
    [1] = 'Деньги',
    [2] = 'Золото',
    [3] = 'Картины',
    [4] = 'Алмазы'
}

CasMain_val = {
    [1] = 0,
    [2] = 1,
    [3] = 2,
    [4] = 3
}

CasGunman_name = {
    [1] = 'Карл Аболаджи',
    [2] = 'Густаво Мота',
    [3] = 'Чарли Рид',
    [4] = 'Честер Маккой',
    [5] = 'Патрик Макрири',
    [6] = 'Стрелок удален'
}

CasDriver_name = {
    [1] = 'Карим Денц',
    [2] = 'Талиана Мартинес',
    [3] = 'Эдди Тоу',
    [4] = 'Зак Нельсон',
    [5] = 'Честер Маккой',
    [6] = 'Водитель удален'
}

CasHacker_name = {
    [1] = 'Рикки Люкенс',
    [2] = 'Кристиан Фелти',
    [3] = 'Йохан Блэр',
    [4] = 'Ави Шварцман',
    [5] = 'Пейдж Харрис',
    [6] = 'Хакер удален'
}

CayoDiff_name = {
    [1] = 'Высокая сложность',
    [2] = 'Нормальная сложность'
}

CayoDiff_val = {
    [1] = 131055,
    [2] = 126823
}

CayoMain_name = {
    [1] = 'Статуя пантеры',
    [2] = 'Розовый алмаз',
    [3] = 'Облигации',
    [4] = 'Ожерелье',
    [5] = 'Текила "Синсимито"'
}

CayoMain_val = {
    [1] = 5,
    [2] = 3,
    [3] = 2,
    [4] = 1,
    [5] = 0
}

CayoSec_name = {
    [1] = 'Золото',
    [2] = 'Картины',
    [3] = 'Кокаин',
    [4] = 'Марихуана',
    [5] = 'Деньги'
}

CayoGuns_name = {
    [1] = 'Зачинщик',
    [2] = 'Конспиратор',
    [3] = 'Снайпер',
    [4] = 'Диверсант',
    [5] = 'Марксман'
}

CayoGuns_val = {
    [1] = 1,
    [2] = 2,
    [3] = 3,
    [4] = 4,
    [5] = 5
}

CasWheel_dropname = {
    [1] = 'Машина',
    [2] = 'Тайный предмет',
    [3] = 'Одежда',
    [4] = 'Фишки',
    [5] = 'Деньги',
    [6] = 'РП',
    [7] = 'Скидка'
}
CasWheel_dropval = {
    [1] = 18,
    [2] = 11,
    [3] = 16,
    [4] = 15,
    [5] = 19,
    [6] = 17,
    [7] = 4
}

Gunvan_coords = {
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

--- Разные функции --------------------------------------------------

function mp()
    return script_global:new(1574915):get_int64()
end

function clear(val1, val2, val3, val4)
    if val1 == 'PAINT' then
        stats.set_u32(string.smart_joaat('MP'..mp()..'_H4LOOT_PAINT'), 0)
        stats.set_u32(string.smart_joaat('MP'..mp()..'_H4LOOT_PAINT_SCOPED'), 0)
        stats.set_u32(string.smart_joaat('MP'..mp()..'_H4LOOT_PAINT_V'), 0)
    else
        stats.set_u32(string.smart_joaat('MP'..mp()..'_H4LOOT_'..val1..'_C'), 0)
        stats.set_u32(string.smart_joaat('MP'..mp()..'_H4LOOT_'..val1..'_C_SCOPED'), 0)
        stats.set_u32(string.smart_joaat('MP'..mp()..'_H4LOOT_'..val1..'_I'), 0)
        stats.set_u32(string.smart_joaat('MP'..mp()..'_H4LOOT_'..val1..'_I_SCOPED'), 0)
        stats.set_u32(string.smart_joaat('MP'..mp()..'_H4LOOT_'..val1..'_V'), 0)
    end
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H4LOOT_'..val2..'_C'), 0)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H4LOOT_'..val2..'_C_SCOPED'), 0)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H4LOOT_'..val2..'_I'), 0)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H4LOOT_'..val2..'_I_SCOPED'), 0)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H4LOOT_'..val2..'_V'), 0)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H4LOOT_'..val3..'_C'), 0)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H4LOOT_'..val3..'_C_SCOPED'), 0)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H4LOOT_'..val3..'_I'), 0)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H4LOOT_'..val3..'_I_SCOPED'), 0)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H4LOOT_'..val3..'_V'), 0)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H4LOOT_'..val4..'_C'), 0)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H4LOOT_'..val4..'_C_SCOPED'), 0)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H4LOOT_'..val4..'_I'), 0)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H4LOOT_'..val4..'_I_SCOPED'), 0)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H4LOOT_'..val4..'_V'), 0)
end

--- Скрипты SilentHy6 -----------------------------------------------
--- https://www.unknowncheats.me/forum/grand-theft-auto-v/604599-silent-night.html
function globals_set_ints(global_start, global_finish, step, value)
    for i = global_start, global_finish, step do
        script_global:new(262145):at(i):set_int64(value)
    end
end

function CasinoCardNameGetter(index)
    if index == 0 then
        return '...'
    end
    card_number = math.fmod(index, 13)
    card_name = ''
    card_suit = ''
    if card_number == 1 then
        card_name = 'A'
    elseif card_number == 0 then
        card_name = 'K'
    elseif card_number == 12 then
        card_name = 'Q'
    elseif card_number == 11 then
        card_name = 'J'
    else
        card_name = tostring(card_number)
    end
    if index >= 1 and index <= 13 then
        card_suit = ' (Крести)'
    elseif index >= 14 and index <= 26 then
        card_suit = ' (Буби)'
    elseif index >= 27 and index <= 39 then
        card_suit = ' (Черви)'
    elseif index >= 40 and index <= 52 then
        card_suit = ' (Пики)'
    end
    return card_name .. card_suit
end

function PokerCardsSetter(ID, current_table, card1, card2, card3)
    script_local:new('three_card_poker', 114 + 168 + 1 + (current_table * 55) + 2 + 1 + (ID * 3)):set_int64(card1)
    script_local:new('three_card_poker', 114 + 168 + 1 + (current_table * 55) + 2 + 2 + (ID * 3)):set_int64(card2)
    script_local:new('three_card_poker', 114 + 168 + 1 + (current_table * 55) + 2 + 3 + (ID * 3)):set_int64(card3)
    script_local:new('three_card_poker', 1036 + 799 + 1 + 1 + (current_table * 55) + 1 + (ID * 3)):set_int64(card1)
    script_local:new('three_card_poker', 1036 + 799 + 1 + 1 + (current_table * 55) + 2 + (ID * 3)):set_int64(card2)
    script_local:new('three_card_poker', 1036 + 799 + 1 + 1 + (current_table * 55) + 3 + (ID * 3)):set_int64(card3)
end

function PokerDealersIDGetter(current_table)
    players = 0
    for i = 0, 31 do
        players_table = script_local:new('three_card_poker', 747 + 1 + (i * 9) + 2):get_int64()
        if i ~= player.index() and players_table == current_table then
            players = players + 1
        end
        return players + 1
    end
end