-- Businesses page
local bus = Main_page:new_subpage('BUSINESSES')

local bus_bunker_group = bus:new_group('Bunker', GroupRect.TITLE)
local bus_hangar_group = bus:new_group('Hangar', GroupRect.BODY)
local bus_ch_group = bus:new_group('Clubhouse', GroupRect.TITLE)
local bus_acid_group = bus:new_group('Acid lab', GroupRect.BODY)

-- Bunker
local bus_bunker_group_info = bus_bunker_group:new_text(function ()
    if native.is_invoker_ready() then
        local bunker_name_hash = string.smart_joaat('MP'..stats.get_character_index()..'_FACTORYSLOT5')
        local bunker_supp_hash = string.smart_joaat('MP'..stats.get_character_index()..'_MATTOTALFORFACTORY5')
        local bunker_stat_hash = string.smart_joaat('MP'..stats.get_character_index()..'_PRODTOTALFORFACTORY5')
        local bunker_research_hash = string.smart_joaat('MP'..stats.get_character_index()..'_RESEARCHTOTALFORFACTORY5')
        if not stats.exists(bunker_name_hash) or not stats.exists(bunker_supp_hash) or not stats.exists(bunker_stat_hash) or not stats.exists(bunker_research_hash) then
            return Bunkers_name[0].name..'\nSupplies: 0     Stock: 0     Research: 0'
        else
            local bunker_name = stats.get_u32(bunker_name_hash)
            local supp_name = stats.get_u32(bunker_supp_hash)
            local stock_name = stats.get_u32(bunker_stat_hash)
            local research_name = stats.get_u32(bunker_research_hash)
            return Bunkers_name[bunker_name].name..'\nSupplies: '..supp_name..'     Stock: '..stock_name..'     Research: '..research_name
        end
    else
        return Bunkers_name[0].name..'\nSupplies: 0     Stock: 0     Research: 0'
    end
end)

local bus_bunker_group_supp = bus_bunker_group:new_button('Get supplies', function ()
    local supp_hash = string.smart_joaat('MP'..stats.get_character_index()..'_MATTOTALFORFACTORY5')
    if stats.exists(supp_hash) then
        local supp = stats.get_u32(supp_hash)
        if supp >= 100 then
            ui.popup('GOD SYSTEM', 'Error: your bunker is already full of supplies.', Icons.CANCEL2, PopupType.BOX)
        else
            script.get_global(2707225):write_u32(121)
            ui.popup('GOD SYSTEM', 'Done.', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
        end
    end
end)

local bus_bunker_group_tptobunker = bus_bunker_group:new_button('TP to bunker', function ()
    local bunker_hash = string.smart_joaat('MP'..stats.get_character_index()..'_FACTORYSLOT5')
    if stats.exists(bunker_hash) and stats.get_u32(bunker_hash) ~= 0 then
        local bunker = stats.get_u32(bunker_stat)
        local coords = Bunkers_name[bunker].coords
        utils.teleport_self(coords.x, coords.y, coords.z)
        ui.popup('GOD SYSTEM', 'Teleported.', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
    else
        ui.popup('GOD SYSTEM', 'Bunker not found.', Icons.CANCEL2, PopupType.BOX)
    end
end)

-- Hangar
local bus_hangar_group_instantsellcargo_number = bus_hangar_group:new_slider('Number of vehicles', 1, 16)

local bus_hangar_group_instantsellcargo = bus_hangar_group:new_button('Instant cargo sell', function ()
    if script.is_running('gb_smuggler') then
        script.get_global(262145):at(23003):write_float(0)
        script.get_local('gb_smuggler', 1932 + 1078):write_u32(bus_hangar_group_instantsellcargo_number:get())
        script.get_local('gb_smuggler', 2700):write_u32(-1)
        ui.popup('GOD SYSTEM', 'Done.', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
    else
        ui.popup('GOD SYSTEM', 'Error: mission has not started.', Icons.CANCEL2, PopupType.BOX)
    end
end):set_hint('Instantly completes the air mission. Before activation, you must select the number of vehicles in the mission.')

Bus_hangar_group_cargoloop = bus_hangar_group:new_checkbox('Cargo loop', false)

-- Clubhouse
local bus_ch_group_allsupp = bus_ch_group:new_button('Get all supplies', function ()
    for i = 1, 5 do
        script.get_global(1662873):at(i):write_u32(1)
    end
    ui.popup('GOD SYSTEM', 'Done.', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
end)

local bus_ch_group_cocsupp = bus_ch_group:new_button('Get supplies for cocaine', function ()
    script.get_global(1662873):at(1):write_u32(1)
    ui.popup('GOD SYSTEM', 'Done.', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
end)

local bus_ch_group_methsupp = bus_ch_group:new_button('Get supplies for meth', function ()
    script.get_global(1662873):at(2):write_u32(1)
    ui.popup('GOD SYSTEM', 'Done.', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
end)

local bus_ch_group_cashsupp = bus_ch_group:new_button('Get supplies for cash', function ()
    script.get_global(1662873):at(3):write_u32(1)
    ui.popup('GOD SYSTEM', 'Done.', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
end)

local bus_ch_group_weedsupp = bus_ch_group:new_button('Get supplies for weed', function ()
    script.get_global(1662873):at(4):write_u32(1)
    ui.popup('GOD SYSTEM', 'Done.', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
end)

local bus_ch_group_docssupp = bus_ch_group:new_button('Get supplies for documents', function ()
    script.get_global(1662873):at(5):write_u32(1)
    ui.popup('GOD SYSTEM', 'Done.', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
end)

-- Acid lab
local bus_acid_group_supp = bus_acid_group:new_button('Get supplies', function ()
    script.get_global(1662873):at(7):write_u32(1)
    ui.popup('GOD SYSTEM', 'Done.', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
end)

local bus_acid_group_reqbike = bus_acid_group:new_button('Request lab', function ()
    script.get_global(2738587):at(944):write_u32(1)
    ui.popup('GOD SYSTEM', 'Requested.', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
end)

local bus_acid_group_reqbike = bus_acid_group:new_button('Request delivery bike', function ()
    script.get_global(2738587):at(994):write_u32(1)
    ui.popup('GOD SYSTEM', 'Requested.', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
end)
