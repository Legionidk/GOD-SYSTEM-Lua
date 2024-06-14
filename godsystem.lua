-- /godmode // GOD SYSTEM

require('godsystem/god_stuff.lua')
addon_checker()

-- Main page

local main_page = ui.new_page('GOD SYSTEM v'..ver, Icons.PORTAL)

-- Office

local bus = main_page:new_subpage('Businesses')
local bus_office_group = bus:new_group('Office', GroupRect.TITLE)
local bus_hangar_group = bus:new_group('Hangar', GroupRect.BODY)
local bus_bunker_group = bus:new_group('Bunker', GroupRect.TITLE)
local bus_ch_group = bus:new_group('Clubhouse', GroupRect.BODY)
local bus_acid_group = bus:new_group('Acid lab', GroupRect.TITLE)

local office_group_tptooffice = bus_office_group:new_button('TP to office', function ()
    office = stats.get_u32(string.smart_joaat('MP'..stats.get_character_index()..'_PROP_OFFICE'))
    if office == 0 then
        ui.popup('GOD SYSTEM', 'Office not found.', Icons.CANCEL2, PopupType.BOX)
    else
        coords = Apartments[office].coords
        utils.teleport_self(coords.x, coords.y, coords.z)
        ui.popup('GOD SYSTEM', 'Teleported.', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
    end
end)

local office_group_instantsellcargo = bus_office_group:new_button('Instant cargo sell', function ()
    if script.is_running('gb_contraband_sell') then
        script.get_local('gb_contraband_sell', 543 + 1):write_u32(99999)
        ui.popup('GOD SYSTEM', 'Done.', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
    else
        ui.popup('GOD SYSTEM', 'Error: mission has not started.', Icons.CANCEL2, PopupType.BOX)
    end
end)

local office_group_cargoloop = bus_office_group:new_checkbox('Cargo loop', false)

local hangar_group_instantsellcargo_number = bus_hangar_group:new_slider('Number of vehicles', 1, 16)

local hangar_group_instantsellcargo = bus_hangar_group:new_button('Instant cargo sell', function ()
    if script.is_running('gb_smuggler') then
        script.get_global(262145):at(23003):write_float(0)
        script.get_local('gb_smuggler', 1932 + 1078):write_u32(hangar_group_instantsellcargo_number:get())
        script.get_local('gb_smuggler', 2700):write_u32(-1)
        ui.popup('GOD SYSTEM', 'Done.', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
    else
        ui.popup('GOD SYSTEM', 'Error: mission has not started.', Icons.CANCEL2, PopupType.BOX)
    end
end):set_hint('Instantly completes the air mission. Before activation, you must select the number of vehicles in the mission.')

local hangar_group_cargoloop = bus_hangar_group:new_checkbox('Cargo loop', false)

local bunker_group_tptobunker = bus_bunker_group:new_button('TP to bunker', function ()
    bunker = stats.get_u32(string.smart_joaat('MP'..stats.get_character_index()..'_FACTORYSLOT5'))
    if bunker == 0 then
        ui.popup('GOD SYSTEM', 'Bunker not found.', Icons.CANCEL2, PopupType.BOX)
    else
        coords = Bunkers_name[bunker].coords
        utils.teleport_self(coords.x, coords.y, coords.z)
        ui.popup('GOD SYSTEM', 'Teleported.', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
    end
end)

local bunker_group_supp = bus_bunker_group:new_button('Get supplies', function ()
    script.get_global(2707225):write_u32(121)
    ui.popup('GOD SYSTEM', 'Done.', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
end)

local ch_group_supp = bus_ch_group:new_table_list('Get supplies', McSupp_name):set_click_callback(function (item)
    script.get_global(1662873):at(item):write_u32(1)
    ui.popup('GOD SYSTEM', 'Done.', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
end)

local ch_group_allsupp = bus_ch_group:new_button('Get all supplies', function ()
    for i = 1, 5 do
        script.get_global(1662873):at(i):write_u32(1)
    end
    ui.popup('GOD SYSTEM', 'Done.', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
end)

local acid_group_supp = bus_acid_group:new_button('Get supplies', function ()
    script.get_global(1662873):at(7):write_u32(1)
    ui.popup('GOD SYSTEM', 'Done.', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
end)

-- Casino

local casino = main_page:new_subpage('Casino')
local casino_chips = casino:new_group('Chips', GroupRect.TITLE)
local casino_lw = casino:new_group('Lucky wheel', GroupRect.TITLE)
local casino_bj = casino:new_group('Blackjack', GroupRect.BODY)
local casino_poker = casino:new_group('Poker', GroupRect.BODY)

local casino_chips_limit = casino_chips:new_slider('Chips purchase limit', 100000, 2000000)
local casino_chips_limit_set = casino_chips:new_button('Set chips purchase limit', function ()
    script.get_global(262145):at(27238):write_u32(casino_chips_limit:get())
    ui.popup('GOD SYSTEM', 'New limit: '..casino_chips_limit:get()..'.', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
end)

local casino_chips_reset = casino_chips:new_button('Reset chips purchase cooldown', function ()
    stats.set_u32(string.smart_joaat('MPPLY_CASINO_CHIPS_PUR_GD'), 0)
    stats.set_u32(string.smart_joaat('MPPLY_CASINO_CHIPS_PURTIM'), 0)
    ui.popup('GOD SYSTEM', 'Chips purchase cooldown has been reseted.', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
end)

local casino_lw_drop = casino_lw:new_table_list('Drop', LuckyWheel_name):set_click_callback(function (item)
    if script.is_running('casino_lucky_wheel') then
        script.get_local('casino_lucky_wheel', 278 + 14):write_u32(LuckyWheel_id[item])
        script.get_local('casino_lucky_wheel', 278 + 45):write_u32(11)
        ui.popup('GOD SYSTEM', 'Done.', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
    else
        ui.popup('GOD SYSTEM', "Error: you're not in casino.", Icons.CANCEL2, PopupType.BOX)
    end
end)

local casino_bj_trickdealer = casino_bj:new_button('Trick the dealer', function ()
    if script.is_running('blackjack') then
        current_table = script.get_local('blackjack', 1774 + 1 + (player.id() * 8) + 4):read_u32()
        if current_table ~= -1 then
            script.get_local('blackjack', 114 + 846 + 1 + (current_table * 13) + 1):write_u32(11)
            script.get_local('blackjack', 114 + 846 + 1 + (current_table * 13) + 2):write_u32(12)
            script.get_local('blackjack', 114 + 846 + 1 + (current_table * 13) + 3):write_u32(13)
            script.get_local('blackjack', 114 + 846 + 1 + (current_table * 13) + 12):write_u32(3)
            ui.popup('GOD SYSTEM', 'Dealer tricked.', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
        else
            ui.popup('GOD SYSTEM', 'Error: you are not at the table.', Icons.CANCEL2, PopupType.BOX)
        end
    else
        ui.popup('GOD SYSTEM', 'Error: you are not at the table.', Icons.CANCEL2, PopupType.BOX)
    end
end)

local casino_poker_flush = casino_poker:new_button('Give straight flush', function ()
    if script.is_running('three_card_poker') then
        current_table = script.get_local('three_card_poker', 747 + 1 + (player.id() * 9) + 2):read_u32()
        if current_table ~= nil and current_table ~= -1 then
            PokerCardsSetter(player.id(), current_table, 50, 51, 52)
            ui.popup('GOD SYSTEM', 'Straight flush in your hand.', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
        else
            ui.popup('GOD SYSTEM', 'Error: you are not at the table.', Icons.CANCEL2, PopupType.BOX)
        end
    else
        ui.popup('GOD SYSTEM', 'Error: you are not at the table.', Icons.CANCEL2, PopupType.BOX)
    end
end)

local casino_poker_trickthedealer = casino_poker:new_button('Trick the dealer', function ()
    if script.is_running('three_card_poker') then
        current_table = script.get_local('blackjack', 747 + 1 + (player.id() * 9) + 2):read_u32()
        if current_table ~= nil and current_table ~= -1 then
            PokerCardsSetter(PokerDealersIDGetter(current_table), current_table, 2, 17, 32)
            ui.popup('GOD SYSTEM', 'Dealer tricked.', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
        else
            ui.popup('GOD SYSTEM', 'Error: you are not at the table.', Icons.CANCEL2, PopupType.BOX)
        end
    else
        ui.popup('GOD SYSTEM', 'Error: you are not at the table.', Icons.CANCEL2, PopupType.BOX)
    end
end)

-- Spawner

local spawner = main_page:new_subpage('Spawner')
local spawn_by_name = spawner:new_group('Spawn by name', GroupRect.TITLE)
local spawn_from_mods = spawner:new_group("Spawn from 'mods' folder", GroupRect.TITLE)
local spawned_vehicles = spawner:new_group('Spawned vehicles', GroupRect.BODY)

local spawn_by_name_input = spawn_by_name:new_input('Model name', '', '')
local spawn_by_name_button = spawn_by_name:new_button('Spawn', function ()
    if spawn_by_name_input:get() == '' then
        ui.popup('GOD SYSTEM', "Can't spawn nothing!", Icons.CANCEL2, PopupType.BOX)
    else
        vehicle.spawn(spawn_by_name_input:get(), function (veh)
            ui.popup('GOD SYSTEM', 'Spawned successfully: '..spawn_by_name_input:get()..'.', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
            table.insert(Spawned_veh_handle, 1, veh)
            table.insert(Spawned_veh, 1, spawn_by_name_input:get())
        end)
    end
end)

local spawn_from_mods_list = spawn_from_mods:new_table_list("'mods' folder", Checked_addons):set_click_callback(function (item)
    vehicle.spawn(Checked_addons[item], function (veh)
        ui.popup('GOD SYSTEM', 'Spawned successfully: '..Checked_addons[item]..'.', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
        table.insert(Spawned_veh_handle, 1, veh)
        table.insert(Spawned_veh, 1, Checked_addons[item])
    end)
end)

local spawned_vehicles_list = spawned_vehicles:new_table_list('Spawned vehicles', Spawned_veh):set_click_callback(function (item)
    entity.delete(Spawned_veh_handle[item], function ()
        ui.popup('GOD SYSTEM', 'Failed to delete.', Icons.CANCEL2, PopupType.BOX)
    end, function ()
        ui.popup('GOD SYSTEM', 'Deleted successfully.', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
    end)
    Spawned_veh[item], Spawned_veh_handle[item] = nil, nil
end)

local spawned_vehicles_del_all = spawned_vehicles:new_button('Delete all', function ()
    for i = 1, #Spawned_veh do
        entity.delete(Spawned_veh_handle[i])
    end
    ui.popup('GOD SYSTEM', 'Deleted successfully: '..#Spawned_veh..'.', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
    for i = 1, #Spawned_veh do
        Spawned_veh[i], Spawned_veh_handle[i] = nil, nil
    end
end)

-- Misc

local misc = main_page:new_subpage('Misc')
local misc_group = misc:new_group('Unlocks', GroupRect.TITLE)
local misc_loops_group = misc:new_group('Loops', GroupRect.BODY)
local loops_nc_loop = misc_loops_group:new_checkbox('Nigh Club Loop ($300k/2s)', false)
local loops_death_loop = misc_loops_group:new_checkbox('Death Loop ($50k/1s)', false)
local loops_chips_loop = misc_loops_group:new_checkbox('Chips Loop (5k/3s)', false)
loops_nc_loop:set_hint('Fill safe in your Night Club.')

local misc_unlock_del_vehs = misc_group:new_button('Unlock deleted vehicles', function ()
    for i = 1, #Removed_veh do
        script.get_global(262145):at(Removed_veh[i]):write_u32(1)
    end
    ui.popup('GOD SYSTEM', 'Vehicles unlocked.', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
end):set_hint('Unlocks 197 units of previously removed vehicles from stores.')

local misc_lscarmeet_prize_unlock = misc_group:new_button('Unlock LS Car Meet podium prize', function ()
    stats.set_bool(string.smart_joaat('MP'..stats.get_character_index()..'_CARMEET_PV_CHLLGE_CMPLT'), true)
    stats.set_bool(string.smart_joaat('MP'..stats.get_character_index()..'_CARMEET_PV_CLMED'), false)
    ui.popup('GOD SYSTEM', 'Prize unlocked.', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
end)

local misc_tp_to_gunvan = misc_group:new_button('TP to gunvan', function ()
    if check_table(script.get_global(2652572):at(2650 + 1):read_u32(), Gunvan_coords) then
        coords = Gunvan_coords[script.get_global(2652572):at(2650 + 1):read_u32()]
        utils.teleport_self(coords[1], coords[2], coords[3])
        ui.popup('GOD SYSTEM', 'Teleported.', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
    else
        ui.popup('GOD SYSTEM', "Error: couldn't find gun van.", Icons.CANCEL2, PopupType.BOX)
    end
end)

-- Events

events.on_script_tick(function ()
    if loops_nc_loop:get() then
        if loops_death_loop:get() == true or loops_chips_loop:get() == true then
            ui.popup('GOD SYSTEM', 'For security reasons, it is not possible to enable multiple functions at the same time.', Icons.CANCEL2, PopupType.BOX)
            loops_nc_loop:set(false)
        else
            script.get_global(262145):at(24234):write_u32(300000)
            script.get_global(262145):at(24253):write_u32(300000)
            script.get_global(262145):at(24257):write_u32(300000)
            stats.set_u32(string.smart_joaat('MP'..stats.get_character_index()..'_CLUB_PAY_TIME_LEFT'), -1)
            utils.sleep(2000)
        end
    end
    if loops_death_loop:get() then
        if loops_nc_loop:get() == true or loops_chips_loop:get() == true then
            ui.popup('GOD SYSTEM', 'For security reasons, it is not possible to enable multiple functions at the same time.', Icons.CANCEL2, PopupType.BOX)
            loops_death_loop:set(false)
        else
            loop(0x610F9AB4, 50000)
            utils.sleep(1000)
        end
    end
    if loops_chips_loop:get() then
        if loops_nc_loop:get() == true or loops_death_loop:get() == true then
            ui.popup('GOD SYSTEM', 'For security reasons, it is not possible to enable multiple functions at the same time.', Icons.CANCEL2, PopupType.BOX)
            loops_chips_loop:set(false)
        else
            script.get_global(1963515):at(24234):write_u32(2147483646)
            utils.sleep(3000)
        end
    end
    if office_group_cargoloop:get() then
        for i = 12, 16 do
            stats.set_masked_int(string.smart_joaat('MP'..stats.get_character_index()..'_FIXERPSTAT_BOOL1'), 1, i, stats.get_character_index())
        end
    end
    if hangar_group_cargoloop:get() then
        stats.set_masked_int(string.smart_joaat('MP'..stats.get_character_index()..'_DLC22022PSTAT_BOOL3'), 1, 9, stats.get_character_index())
    end
end)

-- End

ui.popup('GOD SYSTEM v'..ver, 'Loaded successfully.', Icons.PORTAL, PopupType.BOX)