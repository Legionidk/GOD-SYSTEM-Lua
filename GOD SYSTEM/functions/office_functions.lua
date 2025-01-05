---- /godmode
-- Data
offices_data = {
    [0]  = {name= 'Office not found'},
    [87] = {name = 'Lombank West',               coords = {x = -1583.427612,   y =  -557.392517,   z = 33.654240}},
    [88] = {name = 'Maze Bank West',             coords = {x = -1371.461670,   y =  -506.922180,   z = 31.857445}},
    [89] = {name = 'Arcadius Business Center',   coords = {x = -106.573792,    y =  -612.973083,   z = 34.766911}},
    [90] = {name = 'Maze Bank Tower',            coords = {x = -82.427208,     y =  -795.496277,   z = 42.927375}}
}

warehouses_data = {
    [0]  = {name = 'Warehouse not found',         capacity = 0,},
    [1]  = {name = 'Pacific Bait Storage',        capacity = 16,    coords = {x = 54.191,      y = -2569.248,  z = 6.0046 }},
    [2]  = {name = 'White Widow Garage',          capacity = 16,    coords = {x = -1083.054,   y = -1261.893,  z = 5.534  }},
    [3]  = {name = 'Celltowa Unit',               capacity = 16,    coords = {x = 896.3665,    y = -1035.749,  z = 35.1096}},
    [4]  = {name = 'Convenience Store Lockup',    capacity = 16,    coords = {x = 247.473,     y = -1956.943,  z = 23.1908}},
    [5]  = {name = 'Foreclosed Garage',           capacity = 16,    coords = {x = -424.828,    y = 185.825,    z = 80.775 }},
    [6]  = {name = 'Xero Gas Factory',            capacity = 111,   coords = {x = -1042.482,   y = -2023.516,  z = 13.1616}},
    [7]  = {name = 'Derriere Lingerie Backlot',   capacity = 42,    coords = {x = -1268.119,   y = -812.2741,  z = 17.1075}},
    [8]  = {name = 'Bilgeco Warehouse',           capacity = 111,   coords = {x = -874,        y = -2736,      z = 13.9438}},
    [9]  = {name = 'Pier 400 Utility Building',   capacity = 16,    coords = {x = 274.5224,    y = -3015.413,  z = 5.6993 }},
    [10] = {name = 'GEE Warehouse',               capacity = 42,    coords = {x = 1569.69,     y = -2129.792,  z = 78.3351}},
    [11] = {name = 'LS Marine Building 3',        capacity = 42,    coords = {x = -315.551,    y = -2698.654,  z = 7.5495 }},
    [12] = {name = 'Railyard Warehouse',          capacity = 42,    coords = {x = 499.81,      y = -651.982,   z = 24.909 }},
    [13] = {name = 'Fridgit Annexe',              capacity = 42,    coords = {x = -528.5296,   y = -1784.573,  z = 21.5853}},
    [14] = {name = 'Disused Factory Outlet',      capacity = 42,    coords = {x = -295.8596,   y = -1353.238,  z = 31.3138}},
    [15] = {name = 'Discount Retail Unit',        capacity = 42,    coords = {x = 349.839,     y = 328.889,    z = 104.272}},
    [16] = {name = 'Logistics Depot',             capacity = 111,   coords = {x = 926.2818,    y = -1560.311,  z = 30.7404}},
    [17] = {name = 'Darnell Bros Warehouse',      capacity = 111,   coords = {x = 759.566,     y = -909.466,   z = 25.244 }},
    [18] = {name = 'Wholesale Furniture',         capacity = 111,   coords = {x = 1037.813,    y = -2173.062,  z = 31.5334}},
    [19] = {name = 'Cypress Warehouses',          capacity = 111,   coords = {x = 1019.116,    y = -2511.69,   z = 28.302 }},
    [20] = {name = 'West Vinewood Backlot',       capacity = 111,   coords = {x = -245.3405,   y = 203.3286,   z = 83.818 }},
    [21] = {name = 'Old Power Station',           capacity = 42,    coords = {x = 539.346,     y = -1945.682,  z = 24.984 }},
    [22] = {name = 'Walker & Sons Warehouse',     capacity = 111,   coords = {x = 96.1538,     y = -2216.4,    z = 6.1712 }}
}

-- Warehouses group
picked_warehouse = 0

function warehouse_info_function()
    if native.is_invoker_ready() and stats.exists(string.smart_joaat('MPPLY_LAST_MP_CHAR')) then
        local warehouse_hash = string.smart_joaat('MP'..stats.get_character_index()..'_PROP_WHOUSE_SLOT'..picked_warehouse)
        local crates_hash = string.smart_joaat('MP'..stats.get_character_index()..'_CONTOTALFORWHOUSE'..picked_warehouse)
        if not stats.exists(warehouse_hash) or not stats.exists(crates_hash) then
            return '#'..picked_warehouse..': Warehouse not found\nCapacity: 0 / 0'
        else
            local warehouse = stats.get_u32(warehouse_hash)
            local available = stats.get_u32(crates_hash)
            return '#'..picked_warehouse..': '..warehouses_data[warehouse].name..'\nCapacity: '..available..' / '..warehouses_data[warehouse].capacity
        end
    else
        return ''
    end
end

function tp_to_warehouse_function()
    local warehouse_hash = string.smart_joaat('MP'..stats.get_character_index()..'_PROP_WHOUSE_SLOT'..picked_warehouse)
    local warehouse_stat = stats.get_u32(warehouse_hash)
    if warehouse_stat ~= 0 then
        local warehouse_info = warehouses_data[warehouse_stat]
        utils.teleport_self(warehouse_info.coords.x, warehouse_info.coords.y, warehouse_info.coords.z)
        ui.popup('GOD SYSTEM', 'Teleported to '..warehouse_info.name, Icons.CHECKMARK_SUCCESS, PopupType.BOX)
    else
        ui.popup('GOD SYSTEM', 'Warehouse not found', Icons.CANCEL2, PopupType.BOX)
    end
end

-- Office group
function tp_to_office_function()
	local office_hash = string.smart_joaat('MP'..stats.get_character_index()..'_PROP_OFFICE')
    local office_stat = stats.get_u32(office_hash)
    if office_stat ~= 0 then
    	local office_info = offices_data[office_stat]
        utils.teleport_self(office_info.coords.x, office_info.coords.y, office_info.coords.z)
        ui.popup('GOD SYSTEM', 'Teleported to '..office_info.name, Icons.CHECKMARK_SUCCESS, PopupType.BOX)
    else
        ui.popup('GOD SYSTEM', 'Office not found', Icons.CANCEL2, PopupType.BOX)
    end
end

-- Buy crates
function total_crates_function()
    if native.is_invoker_ready() and stats.exists(string.smart_joaat('MPPLY_LAST_MP_CHAR')) then
        local total_capacity = 0
        local total_available = 0
        for i = 0, 4 do
            local warehouse_hash = string.smart_joaat('MP'..stats.get_character_index()..'_PROP_WHOUSE_SLOT'..i)
            local crates_hash = string.smart_joaat('MP'..stats.get_character_index()..'_CONTOTALFORWHOUSE'..i)
            if not stats.exists(warehouse_hash) or not stats.exists(crates_hash) then
                total_capacity = total_capacity + 0
                total_available = total_available + 0
            else
                local warehouse_stat = stats.get_u32(warehouse_hash)
                local available_stat = stats.get_u32(crates_hash)
                total_capacity = total_capacity + warehouses_data[warehouse_stat].capacity
                total_available = total_available + available_stat
            end
        end
        return 'Total crates: '..total_available..' / '..total_capacity
    else
        return ''
    end
end

function get_crates_function()
    for i = 12, 16 do
        stats.set_masked_int(string.smart_joaat('MP'..stats.get_character_index()..'_FIXERPSTAT_BOOL1'), 1, i, stats.get_character_index())
    end
    ui.popup('GOD SYSTEM', 'Done', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
end

function instant_buy_function()
    if script.is_running('gb_contraband_buy') then
        script.get_local('gb_contraband_buy', 621 + 5):write_u32(1)
        script.get_local('gb_contraband_buy', 621 + 191):write_u32(6)
        script.get_local('gb_contraband_buy', 621 + 192):write_u32(4)
        ui.popup('GOD SYSTEM', 'Done', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
    else
        ui.popup('GOD SYSTEM', 'Mission has not started', Icons.CANCEL2, PopupType.BOX)
    end
end

function instant_buy_full_function()
    if script.is_running('gb_contraband_buy') then
        script.get_local('gb_contraband_buy', 621 + 1):write_u32(111)
        script.get_local('gb_contraband_buy', 621 + 5):write_u32(1)
        script.get_local('gb_contraband_buy', 621 + 191):write_u32(6)
        script.get_local('gb_contraband_buy', 621 + 192):write_u32(4)
        ui.popup('GOD SYSTEM', 'Done', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
    else
        ui.popup('GOD SYSTEM', 'Mission has not started', Icons.CANCEL2, PopupType.BOX)
    end
end

function delete_buy_cooldown_function()
    tunables.set_int('EXEC_BUY_COOLDOWN', 0)
    ui.popup('GOD SYSTEM', 'Done', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
end

-- Sell crates
function instant_sell_function()
    if script.is_running('gb_contraband_sell') then
        script.get_local('gb_contraband_sell', 563 + 1):write_u32(99999)
        ui.popup('GOD SYSTEM', 'Done', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
    else
        ui.popup('GOD SYSTEM', 'Mission has not started', Icons.CANCEL2, PopupType.BOX)
    end
end

function delete_sell_cooldown_function()
	tunables.set_int('EXEC_SELL_COOLDOWN', 0)
    ui.popup('GOD SYSTEM', 'Done', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
end
