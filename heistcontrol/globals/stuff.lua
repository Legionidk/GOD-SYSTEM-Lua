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
        text = "",
        dist = "",
        arrivalTime = ""
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
    wepWheelInVehicle = {module = "GTA5.exe", pattern = "44 88 6D E0 EB 06"},
}

Addreses = {
    wepWheelInVehicle = nil,
}

GetSelectedPlayer = function () end

function local_player()
    return player.index()
end

function mp()
    return script_global:new(1574915):get_int64()
end

draw.crop_text = function (text_s, len_n)
    if len_n <= 0 then return "" end
    if string.len(text_s) == 0 then return "" end
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
function PlayerID()
    return script_global:new(2672761):get_int64()
end

-- автор скрипта SilentHy6
-- https://www.unknowncheats.me/forum/grand-theft-auto-v/604599-silent-night.html
function PokerDealersIDGetter(current_table)
    players = 0
    for i = 0, 31 do
        players_table = script_local:new('three_card_poker', 747 + 1 + (i * 9) + 2):get_int64()
        if i ~= PlayerID() and players_table == current_table then
            players = players + 1
        end
        return players + 1
    end
end

a2i = tonumber
i2s = tostring
rnd = math.random