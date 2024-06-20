-- Office page
local office = Main_page:new_subpage('OFFICE')

local office_warehouses_group = office:new_group('Warehouses', GroupRect.TITLE)
local office_crates_group = office:new_group('Crates', GroupRect.BODY)
local office_group = office:new_group('Office', GroupRect.BODY)

local picked_warehouse = 1

-- Office
local office_group_name = office_group:new_text(function ()
    if native.is_invoker_ready() then
        local hash = string.smart_joaat('MP'..stats.get_character_index()..'_PROP_OFFICE')
        if stats.exists(hash) then
            local office_stat = stats.get_u32(hash)
            return Apartments[office_stat].name
        else
            return Apartments[0].name
        end
    else
        return Apartments[0].name
    end
end)

local office_group_tp = office_group:new_button('TP to office', function ()
    local office_hash = string.smart_joaat('MP'..stats.get_character_index()..'_PROP_OFFICE')
    local office_stat = stats.get_u32(office_hash)
    if office_stat == 0 then
        ui.popup('GOD SYSTEM', 'Office not found.', Icons.CANCEL2, PopupType.BOX)
    else
        local coords = Apartments[office_stat].coords
        utils.teleport_self(coords.x, coords.y, coords.z)
        ui.popup('GOD SYSTEM', 'Teleported.', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
    end
end)

-- Warehouses
local office_warehouses_group_list = office_warehouses_group:new_table_list('Warehouses', {'Warehouse #1', 'Warehouse #2', 'Warehouse #3', 'Warehouse #4', 'Warehouse #5'})
office_warehouses_group_list:set_click_callback(function (item)
    picked_warehouse = item
end)

local office_warehouses_group_name = office_warehouses_group:new_text(function ()
    if native.is_invoker_ready() then
        local warehouse_hash = string.smart_joaat('MP'..stats.get_character_index()..'_PROP_WHOUSE_SLOT'..picked_warehouse)
        local crates_hash = string.smart_joaat('MP'..stats.get_character_index()..'_CONTOTALFORWHOUSE'..picked_warehouse)
        if not stats.exists(warehouse_hash) or not stats.exists(crates_hash) then
            return '#'..picked_warehouse..': '..Warehouses[0].name..'\nCapacity: 0 / 0'
        else
            local warehouse = stats.get_u32(warehouse_hash)
            local available = stats.get_u32(crates_hash)
            return '#'..picked_warehouse..': '..Warehouses[warehouse].name..'\nCapacity: '..available..' / '..Warehouses[warehouse].capacity
        end
    else
        return '#'..picked_warehouse..': '..Warehouses[0].name..'\nCapacity: 0 / 0'
    end
end)

local office_warehouses_group_tp = office_warehouses_group:new_button('TP to warehouse', function ()
    local warehouse_hash = string.smart_joaat('MP'..stats.get_character_index()..'_PROP_WHOUSE_SLOT'..picked_warehouse)
    local warehouse_stat = stats.get_u32(warehouse_hash)
    if warehouse_stat == 0 then
        ui.popup('GOD SYSTEM', 'Warehouse not found.', Icons.CANCEL2, PopupType.BOX)
    else
        local coords = Warehouses[warehouse_stat].coords
        utils.teleport_self(coords.x, coords.y, coords.z)
        ui.popup('GOD SYSTEM', 'Teleported.', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
    end
end)

-- Crates
local office_crates_group_total = office_crates_group:new_text(function ()
    if native.is_invoker_ready() then
        local total_capacity = 0
        local total_available = 0
        for i = 1, 5 do
            local warehouse_hash = string.smart_joaat('MP'..stats.get_character_index()..'_PROP_WHOUSE_SLOT'..i)
            local crates_hash = string.smart_joaat('MP'..stats.get_character_index()..'_CONTOTALFORWHOUSE'..i)
            if not stats.exists(warehouse_hash) or not stats.exists(crates_hash) then
                total_capacity = total_capacity + 0
                total_available = total_available + 0
            else
                local warehouse_stat = stats.get_u32(warehouse_hash)
                local available_stat = stats.get_u32(crates_hash)
                total_capacity = total_capacity + Warehouses[warehouse_stat].capacity
                total_available = total_available + available_stat
            end
        end
        return 'Total crates: '..total_available..' / '..total_capacity
    else
        return 'Total crates: 0 / 0'
    end
end)

Office_crates_group_afkfarm = office_crates_group:new_checkbox('Crates AFK farm')

local office_crates_group_instant = office_crates_group:new_button('Instant buy/sell', function ()
    if script.is_running('gb_contraband_buy') then
        script.get_local('gb_contraband_buy', 601 + 5):write_u32(1)
        script.get_local('gb_contraband_buy', 601 + 191):write_u32(6)
        script.get_local('gb_contraband_buy', 601 + 192):write_u32(4)
        ui.popup('GOD SYSTEM', 'Done.', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
    elseif script.is_running('gb_contraband_sell') then
        script.get_local('gb_contraband_sell', 543 + 1):write_u32(99999)
        ui.popup('GOD SYSTEM', 'Done.', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
    else
        ui.popup('GOD SYSTEM', 'Error: mission has not started.', Icons.CANCEL2, PopupType.BOX)
    end
end)

local office_crates_group_deletecooldown = office_crates_group:new_button('Delete cooldown for buy and sell', function ()
    script.get_global(262145):at(15756):write_u32(0)
    script.get_global(262145):at(15757):write_u32(0)
    ui.popup('GOD SYSTEM', 'Cooldown deleted.', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
end)
