---- /godmode
-- Data
bunkers_data = {
    [0]  = {name = 'Bunker not found'},
    [21] = {name = 'Grand Senora Oilfields Bunker',   coords = {x = 492.8395,    y = 3014.057,   z = 39.9793},   type = 5},
    [22] = {name = 'Grand Senora Desert Bunker',      coords = {x = 849.603,     y = 3021.697,   z = 40.3076},   type = 5},
    [23] = {name = 'Route 68 Bunker',                 coords = {x = 39.5967,     y = 2930.506,   z = 54.8034},   type = 5},
    [24] = {name = 'Farmhouse Bunker',                coords = {x = 1572.078,    y = 2226.001,   z = 77.2829},   type = 5},
    [25] = {name = 'Smoke Tree Road Bunker',          coords = {x = 2110.019,    y = 3326.12,    z = 44.3526},   type = 5},
    [26] = {name = 'Thomson Scrapyard Bunker',        coords = {x = 2489.36,     y = 3162.12,    z = 48.0015},   type = 5},
    [27] = {name = 'Grapeseed Bunker',                coords = {x = 1801.273,    y = 4705.483,   z = 38.8253},   type = 5},
    [28] = {name = 'Paleto Forest Bunker',            coords = {x = -755.5687,   y = 5943.835,   z = 18.9008},   type = 5},
    [29] = {name = 'Raton Canyon Bunker',             coords = {x = -388.8392,   y = 4340.109,   z = 55.1741},   type = 5},
    [30] = {name = 'Lago Zancudo Bunker',             coords = {x = -3031.356,   y = 3334.059,   z = 9.1805 },   type = 5},
    [31] = {name = 'Chumash Bunker',                  coords = {x = -3157.599,   y = 1376.695,   z = 15.866 },   type = 5}
}

-- Bunker group
function bunker_info_function()
        if native.is_invoker_ready() and stats.exists(string.smart_joaat('MPPLY_LAST_MP_CHAR')) then
        local bunker_hash = string.smart_joaat('MP'..stats.get_character_index()..'_FACTORYSLOT5')
        local bunker_supp_hash = string.smart_joaat('MP'..stats.get_character_index()..'_MATTOTALFORFACTORY5')
        local bunker_stock_hash = string.smart_joaat('MP'..stats.get_character_index()..'_PRODTOTALFORFACTORY5')
        local bunker_research_hash = string.smart_joaat('MP'..stats.get_character_index()..'_RESEARCHTOTALFORFACTORY5')
        if not stats.exists(bunker_hash) or not stats.exists(bunker_supp_hash) or not stats.exists(bunker_stock_hash) or not stats.exists(bunker_research_hash) then
            return 'Bunker not found\nSupplies: 0 / 103\nStock: 0 / 100\nResearch: 0 / 100'
        else
            local bunker_stat = stats.get_u32(bunker_hash)
            local bunker_supp_stat = stats.get_u32(bunker_supp_hash)
            local bunker_stock_stat = stats.get_u32(bunker_stock_hash)
            local bunker_research_stat = stats.get_u32(bunker_research_hash)
            return bunkers_data[bunker_stat].name..'\nSupplies: '..bunker_supp_stat..' / 103\nStock: '..bunker_stock_stat..' / 100\nResearch: '..bunker_research_stat..' / 100'
        end
    else
        return ''
    end
end

function tp_to_bunker_function()
    local bunker_hash = string.smart_joaat('MP'..stats.get_character_index()..'_FACTORYSLOT5')
    local bunker_stat = stats.get_u32(bunker_hash)
    if stats.exists(bunker_hash) and stats.get_u32(bunker_hash) ~= 0 then
        local bunker_info = bunkers_data[bunker_stat]
        utils.teleport_self(bunker_info.coords.x, bunker_info.coords.y, bunker_info.coords.z)
        ui.popup('GOD SYSTEM', 'Teleported to '..bunker_info.name, Icons.CHECKMARK_SUCCESS, PopupType.BOX)
    else
        ui.popup('GOD SYSTEM', 'Bunker not found', Icons.CANCEL2, PopupType.BOX)
    end
end

function resupsly_bunker_function()
    local bunker_supp_hash = string.smart_joaat('MP'..stats.get_character_index()..'_MATTOTALFORFACTORY5')
    local bunker_hash = string.smart_joaat('MP'..stats.get_character_index()..'_FACTORYSLOT5')
    if stats.get_u32(bunker_supp_hash) >= 100 or stats.get_u32(bunker_hash) == 0 then
        ui.popup('GOD SYSTEM', 'Error: your bunker is already full of supplies', Icons.CANCEL2, PopupType.BOX)
    else
        script.get_global(1667995 + 6):write_u32(1)
        ui.popup('GOD SYSTEM', 'Done', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
    end
end

-- Hangar group
function hangar_instant_sell_function()
    local delivered_amount = script.get_local('gb_smuggler', 1985 + 1078):read_u32()
    script.get_local('gb_smuggler', 1985 + 1035):write_u32(delivered_amount)
    tunables.set_float('SMUG_SELL_RONS_CUT', 0.0)
    ui.popup('GOD SYSTEM', 'Done', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
end

-- Clubhouse group
function ch_resupply_all_function()
    for i = 1, 5 do
        script.get_global(1667995 + i):write_u32(1)
    end
    ui.popup('GOD SYSTEM', 'Done', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
end

function ch_resupply_cash_function()
    script.get_global(1667995 + 3):write_u32(1)
    ui.popup('GOD SYSTEM', 'Done', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
end

function ch_resupply_coke_function()
    script.get_global(1667995 + 5):write_u32(1)
    ui.popup('GOD SYSTEM', 'Done', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
end

function ch_resupply_weed_function()
    script.get_global(1667995 + 2):write_u32(1)
    ui.popup('GOD SYSTEM', 'Done', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
end

function ch_resupply_meth_function()
    script.get_global(1667995 + 4):write_u32(1)
    ui.popup('GOD SYSTEM', 'Done', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
end

function ch_resupply_docs_function()
    script.get_global(1667995 + 1):write_u32(1)
    ui.popup('GOD SYSTEM', 'Done', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
end

-- Acid group
function acid_resupply_function()
    script.get_global(1667995 + 7):write_u32(1)
    ui.popup('GOD SYSTEM', 'Done', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
end
