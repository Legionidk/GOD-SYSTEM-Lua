function Loop(hash, amount)
    script.get_global(4537212):at(1):write_u32(2147483646)
    script.get_global(4537212):at(7):write_u32(2147483647)
    script.get_global(4537212):at(6):write_u32(0)
    script.get_global(4537212):at(5):write_u32(0)
    script.get_global(4537212):at(3):write_u32(hash)
    script.get_global(4537212):at(2):write_u32(amount)
    script.get_global(4537212):write_u32(2)
    utils.sleep(500)
    script.get_global(4537212):at(1):write_u32(2147483647)
    script.get_global(4537212):at(7):write_u32(2147483647)
    script.get_global(4537212):at(6):write_u32(0)
    script.get_global(4537212):at(5):write_u32(0)
    script.get_global(4537212):at(3):write_u32(0)
    script.get_global(4537212):at(2):write_u32(0)
    script.get_global(4537212):write_u32(16)
end

function Addon_checker()
    local game_folders_temp = {}
    local mod_folders_temp = {}
    for mod_folder in io.popen('dir \"'..fs.get_dir_game()..'\\mods\\update\\x64\\dlcpacks'..'\" /a /b', 'r'):lines() do
        table.insert(mod_folders_temp, mod_folder)
    end
    for game_folder in io.popen('dir \"'..fs.get_dir_game()..'\\update\\x64\\dlcpacks'..'\" /a /b', 'r'):lines() do
        table.insert(game_folders_temp, game_folder)
    end
    for c = 1, #game_folders_temp do
        for v = 1, #mod_folders_temp do
            if game_folders_temp[c] == mod_folders_temp[v] then
                table.remove(mod_folders_temp, v)
            end
        end
    end
    Mods_list = mod_folders_temp
end

function Check_table(arg, table)
    for k, v in pairs(table) do
        if k == arg then
            return true
        end
    end
    return false
end

function PokerCardsSetter(ID, current_table, card1, card2, card3)
    script.get_local('three_card_poker', 114 + 168 + 1 + (current_table * 55) + 2 + 1 + (ID * 3)):write_u32(card1)
    script.get_local('three_card_poker', 114 + 168 + 1 + (current_table * 55) + 2 + 2 + (ID * 3)):write_u32(card2)
    script.get_local('three_card_poker', 114 + 168 + 1 + (current_table * 55) + 2 + 3 + (ID * 3)):write_u32(card3)
    script.get_local('three_card_poker', 1036 + 799 + 1 + 1 + (current_table * 55) + 1 + (ID * 3)):write_u32(card1)
    script.get_local('three_card_poker', 1036 + 799 + 1 + 1 + (current_table * 55) + 2 + (ID * 3)):write_u32(card2)
    script.get_local('three_card_poker', 1036 + 799 + 1 + 1 + (current_table * 55) + 3 + (ID * 3)):write_u32(card3)
end

function PokerDealersIDGetter(current_table)
    local players = 0
    for i = 0, 31 do
        local players_table = script_local:new('three_card_poker', 747 + 1 + (i * 9) + 2):get_int64()
        if i ~= player.index() and players_table == current_table then
            players = players + 1
        end
        return players + 1
    end
end

function CasinoCardNameGetter(index)
    if index == 0 then
        return '...'
    end
    local card_number = math.fmod(index, 13)
    local card_name = ''
    local card_suit = ''
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
        card_suit = ' (Club)'
    elseif index >= 14 and index <= 26 then
        card_suit = ' (Diamond)'
    elseif index >= 27 and index <= 39 then
        card_suit = ' (Heart)'
    elseif index >= 40 and index <= 52 then
        card_suit = ' (Spade)'
    end
    return card_name..card_suit
end

function Pid()
    return script.get_global(2672761):read_u32()
end

function GetTotalCapacity()
    local total_capacity = 0
    for i = 1, 5 do
        local warehouse_stat = string.smart_joaat('MP'..stats.get_character_index()..'_PROP_WHOUSE_SLOT'..i)
        if not stats.exists(warehouse_stat) then
            total_capacity = total_capacity + 0
        else
            local warehouse = stats.get_u32(warehouse_stat)
            total_capacity = total_capacity + Warehouses[warehouse].capacity
        end
    end
    return total_capacity
end

function GetTotalAvailable()
    local total_available = 0
    for i = 1, 5 do
        local crates_stat = string.smart_joaat('MP'..stats.get_character_index()..'_CONTOTALFORWHOUSE'..i)
        if not stats.exists(crates_stat) then
            total_available = total_available + 0
        else
            local available = stats.get_u32(crates_stat)
            total_available = total_available + available
        end
    end
    return total_available
end
