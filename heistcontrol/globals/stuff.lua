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

ParsedFiles = {
    weapons = {},
    weaponHashes = {},
    peds = {},
    objects = {},
    vehicles = {},
}

-- Localizations = {
--     russian = {},
--     chinese = {},
--     custom = {},
-- }

Patterns = {
    wepWheelInVehicle = {module = 'GTA5.exe', pattern = '44 88 6D E0 EB 06'},
}

Addreses = {
    wepWheelInVehicle = nil,
}

Apartments = {
    [0] = {name= 'Офис не найден'},
    [87]  = {name = 'Западное здание Lombank', coords = {x = -1583.427612,  y =  -557.392517,  z = 33.654240 }},
    [88]  = {name = 'Западное здание Maze Bank', coords = {x = -1371.461670,   y =  -506.922180, z = 31.857445 }},
    [89]  = {name = 'Бизнес-центр Arcadius', coords = {x = -106.573792,  y =  -612.973083, z = 34.766911 }},
    [90]  = {name = 'Башня Maze Bank', coords = {x = -82.427208,   y =  -795.496277,    z = 42.927375}},
}

Warehouse = {
    [0]  = {name = 'Склад не найден', capacity = 0,},
    [1]  = {name = 'Хранилище Пасифик Бейт',      capacity = 16,      coords = {x = 54.191,    y = -2569.248,  z = 6.0046 }}, -- 'MP_WHOUSE_0',
    [2]  = {name = 'Гараж Уайт Видоу',        capacity = 16,      coords = {x = -1083.054, y = -1261.893,  z = 5.534  }}, -- 'MP_WHOUSE_1',
    [3]  = {name = 'Блок Целлтау',             capacity = 16,      coords = {x = 896.3665,  y = -1035.749,  z = 35.1096}}, -- 'MP_WHOUSE_2',
    [4]  = {name = 'Кладовка магазина',  capacity = 16,      coords = {x = 247.473,   y = -1956.943,  z = 23.1908}}, -- 'MP_WHOUSE_3',
    [5]  = {name = 'Изъятый гараж',         capacity = 16,      coords = {x = -424.828,  y = 185.825,    z = 80.775 }}, -- 'MP_WHOUSE_4',
    [6]  = {name = 'Газовая фабрика Xero',          capacity = 111,     coords = {x = -1042.482, y = -2023.516,  z = 13.1616}}, -- 'MP_WHOUSE_5',
    [7]  = {name = 'Derriere на Бэклот', capacity = 42,      coords = {x = -1268.119, y = -812.2741,  z = 17.1075}}, -- 'MP_WHOUSE_6',
    [8]  = {name = 'Склад Bilgeco',         capacity = 111,     coords = {x = -873.65,   y = -2738.948,  z = 13.9438}}, -- 'MP_WHOUSE_7',
    [9]  = {name = 'Пирс 400, хозяйственный блок', capacity = 16,      coords = {x = 274.5224,  y = -3015.413,  z = 5.6993 }}, -- 'MP_WHOUSE_8',
    [10] = {name = 'Склад GEE',             capacity = 42,      coords = {x = 1569.69,   y = -2129.792,  z = 78.3351}}, -- 'MP_WHOUSE_9',
    [11] = {name = 'Портовый склад №3',      capacity = 42,      coords = {x = -315.551,  y = -2698.654,  z = 7.5495 }}, -- 'MP_WHOUSE_10',
    [12] = {name = 'Железнодорожный склад',        capacity = 42,      coords = {x = 499.81,    y = -651.982,   z = 24.909 }}, -- 'MP_WHOUSE_11',
    [13] = {name = 'Пристройка Фриджит',            capacity = 42,      coords = {x = -528.5296, y = -1784.573,  z = 21.5853}}, -- 'MP_WHOUSE_12',
    [14] = {name = 'Заброшенный фабричный магазин',    capacity = 42,      coords = {x = -295.8596, y = -1353.238,  z = 31.3138}}, -- 'MP_WHOUSE_13',
    [15] = {name = 'Дисконтная розничная точка',      capacity = 42,      coords = {x = 349.839,   y = 328.889,    z = 104.272}}, -- 'MP_WHOUSE_14',
    [16] = {name = 'Склад снабжения',           capacity = 111,     coords = {x = 926.2818,  y = -1560.311,  z = 30.7404}}, -- 'MP_WHOUSE_15',
    [17] = {name = 'Склад Darnell Bros',    capacity = 111,     coords = {x = 759.566,   y = -909.466,   z = 25.244 }}, -- 'MP_WHOUSE_16',
    [18] = {name = 'Мебельная оптовая точка',       capacity = 111,     coords = {x = 1037.813,  y = -2173.062,  z = 31.5334}}, -- 'MP_WHOUSE_17',
    [19] = {name = 'Склады Cypress',        capacity = 111,     coords = {x = 1019.116,  y = -2511.69,   z = 28.302 }}, -- 'MP_WHOUSE_18',
    [20] = {name = 'Западный Вайнвуд, Бэклот',     capacity = 111,     coords = {x = -245.3405, y = 203.3286,   z = 83.818 }}, -- 'MP_WHOUSE_19',
    [21] = {name = 'Старая электростанция',         capacity = 42,      coords = {x = 539.346,   y = -1945.682,  z = 24.984 }}, -- 'MP_WHOUSE_20',
    [22] = {name = 'Склад Walker & Sons',   capacity = 111,     coords = {x = 96.1538,   y = -2216.4,    z = 6.1712 }}, -- 'MP_WHOUSE_21',
}

GetSelectedPlayer = function () end

function mp()
    return script_global:new(1574915):get_int64()
end

draw.crop_text = function (text_s, len_n)
    if len_n <= 0 then return '' end
    if string.len(text_s) == 0 then return '' end
    if draw.get_text_size(text_s).x <= len_n then return text_s end
    return draw.crop_text(text_s:sub(1, -2), len_n)
end

function stats_set(stat, value)
    hash = string.smart_joaat(stat)
    stats.set_u32(hash, value)
end

-- автор скрипта SilentHy6
-- https://www.unknowncheats.me/forum/grand-theft-auto-v/604599-silent-night.html
function globals_set_ints(global_start, global_finish, step, value)
    for i = global_start, global_finish, step do
        script_global:new(262145):at(i):set_int64(value)
    end
end

function clear(val1, val2, val3, val4)
    if val1 == 'PAINT' then
        stats_set('MP'..mp()..'_H4LOOT_PAINT', 0)
        stats_set('MP'..mp()..'_H4LOOT_PAINT_SCOPED', 0)
        stats_set('MP'..mp()..'_H4LOOT_PAINT_V', 0)
    else
        stats_set('MP'..mp()..'_H4LOOT_'..val1..'_C', 0)
        stats_set('MP'..mp()..'_H4LOOT_'..val1..'_C_SCOPED', 0)
        stats_set('MP'..mp()..'_H4LOOT_'..val1..'_I', -0)
        stats_set('MP'..mp()..'_H4LOOT_'..val1..'_I_SCOPED', -0)
        stats_set('MP'..mp()..'_H4LOOT_'..val1..'_V', 0)
    end
    stats_set('MP'..mp()..'_H4LOOT_'..val2..'_C', 0)
    stats_set('MP'..mp()..'_H4LOOT_'..val2..'_C_SCOPED', 0)
    stats_set('MP'..mp()..'_H4LOOT_'..val2..'_I', 0)
    stats_set('MP'..mp()..'_H4LOOT_'..val2..'_I_SCOPED', -0)
    stats_set('MP'..mp()..'_H4LOOT_'..val2..'_V', 0)
    stats_set('MP'..mp()..'_H4LOOT_'..val3..'_C', 0)
    stats_set('MP'..mp()..'_H4LOOT_'..val3..'_C_SCOPED', 0)
    stats_set('MP'..mp()..'_H4LOOT_'..val3..'_I', 0)
    stats_set('MP'..mp()..'_H4LOOT_'..val3..'_I_SCOPED', 0)
    stats_set('MP'..mp()..'_H4LOOT_'..val3..'_V', 0)
    stats_set('MP'..mp()..'_H4LOOT_'..val4..'_C', 0)
    stats_set('MP'..mp()..'_H4LOOT_'..val4..'_C_SCOPED', 0)
    stats_set('MP'..mp()..'_H4LOOT_'..val4..'_I', 0)
    stats_set('MP'..mp()..'_H4LOOT_'..val4..'_I_SCOPED', 0)
    stats_set('MP'..mp()..'_H4LOOT_'..val4..'_V', 0)
end

-- автор скрипта SilentHy6
-- https://www.unknowncheats.me/forum/grand-theft-auto-v/604599-silent-night.html
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

-- автор скрипта SilentHy6
-- https://www.unknowncheats.me/forum/grand-theft-auto-v/604599-silent-night.html
function PokerCardsSetter(ID, current_table, card1, card2, card3)
    script_local:new('three_card_poker', 114 + 168 + 1 + (current_table * 55) + 2 + 1 + (ID * 3)):set_int64(card1)
    script_local:new('three_card_poker', 114 + 168 + 1 + (current_table * 55) + 2 + 2 + (ID * 3)):set_int64(card2)
    script_local:new('three_card_poker', 114 + 168 + 1 + (current_table * 55) + 2 + 3 + (ID * 3)):set_int64(card3)
    script_local:new('three_card_poker', 1036 + 799 + 1 + 1 + (current_table * 55) + 1 + (ID * 3)):set_int64(card1)
    script_local:new('three_card_poker', 1036 + 799 + 1 + 1 + (current_table * 55) + 2 + (ID * 3)):set_int64(card2)
    script_local:new('three_card_poker', 1036 + 799 + 1 + 1 + (current_table * 55) + 3 + (ID * 3)):set_int64(card3)
end

-- автор скрипта SilentHy6
-- https://www.unknowncheats.me/forum/grand-theft-auto-v/604599-silent-night.html
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

a2i = tonumber
i2s = tostring
rnd = math.random