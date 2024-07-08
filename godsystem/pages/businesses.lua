-- BUSINESSES
BUS = Main_page:new_subpage('BUSINESSES')

BUS_BUNKER_GROUP = BUS:new_group('Bunker', GroupRect.TITLE)
BUS_HANGAR_GROUP = BUS:new_group('Hangar', GroupRect.TITLE)
BUS_CH_GROUP = BUS:new_group('Clubhouse', GroupRect.BODY)
BUS_ACID_GROUP = BUS:new_group('Acid lab', GroupRect.BODY)

-- Bunker
BUS_BUNKER_GROUP_INFO = BUS_BUNKER_GROUP:new_text(function ()
    if native.is_invoker_ready() and stats.exists(LAST_MP_CHAR_HASH) then
        local bunker_hash = string.smart_joaat('MP'..stats.get_character_index()..'_FACTORYSLOT5')
        local bunker_supp_hash = string.smart_joaat('MP'..stats.get_character_index()..'_MATTOTALFORFACTORY5')
        local bunker_stock_hash = string.smart_joaat('MP'..stats.get_character_index()..'_PRODTOTALFORFACTORY5')
        local bunker_research_hash = string.smart_joaat('MP'..stats.get_character_index()..'_RESEARCHTOTALFORFACTORY5')
        if not stats.exists(bunker_hash) or not stats.exists(bunker_supp_hash) or not stats.exists(bunker_stock_hash) or not stats.exists(bunker_research_hash) then
            return 'Bunker not found\nSupplies: 0 / 103     Stock: 0 / 100     Research: 0 / 100'
        else
            local bunker_stat = stats.get_u32(bunker_hash)
            local bunker_supp_stat = stats.get_u32(bunker_supp_hash)
            local bunker_stock_stat = stats.get_u32(bunker_stock_hash)
            local bunker_research_stat = stats.get_u32(bunker_research_hash)
            return BUNKERS[bunker_stat].name..'\nSupplies: '..bunker_supp_stat..' / 103\nStock: '..bunker_stock_stat..' / 100\nResearch: '..bunker_research_stat..' / 100'
        end
    else
        return ''
    end
end)

BUS_BUNKER_GROUP_SUPP = BUS_BUNKER_GROUP:new_button('Get supplies', function ()
    local bunker_supp_hash = string.smart_joaat('MP'..stats.get_character_index()..'_MATTOTALFORFACTORY5')
    local bunker_hash = string.smart_joaat('MP'..stats.get_character_index()..'_FACTORYSLOT5')
    if stats.get_u32(bunker_supp_hash) >= 100 or stats.get_u32(bunker_hash) == 0 then
        ui.popup('GOD SYSTEM', 'Error: your bunker is already full of supplies.', Icons.CANCEL2, PopupType.BOX)
    else
        script.get_global(BUNKER_GET_SUPP_GLOBAL):write_u32(121)
        ui.popup('GOD SYSTEM', 'Done.', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
    end
end)

BUS_BUNKER_GROUP_SUPP:set_hint('To avoid errors, you will not be able to use the function if the amount of your supplies is greater than or equal to 100.')

BUS_BUNKER_GROUP_TP = BUS_BUNKER_GROUP:new_button('TP to bunker', function ()
    local bunker_hash = string.smart_joaat('MP'..stats.get_character_index()..'_FACTORYSLOT5')
    local bunker_stat = stats.get_u32(bunker_hash)
    if stats.exists(bunker_hash) and stats.get_u32(bunker_hash) ~= 0 then
        local info = BUNKERS[bunker_stat]
        utils.teleport_self(info.coords.x, info.coords.y, info.coords.z)
        ui.popup('GOD SYSTEM', 'Teleported to '..info.name..'.', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
    else
        ui.popup('GOD SYSTEM', 'Error: bunker not found.', Icons.CANCEL2, PopupType.BOX)
    end
end)

-- Hangar
BUS_HANGAR_GROUP_CRATESLOOP = BUS_HANGAR_GROUP:new_checkbox('Crates loop', false)

BUS_HANGAR_GROUP_INSTANTSELL = BUS_HANGAR_GROUP:new_button('Instant sell', function ()
    if script.is_running(HANGAR_INSTANT_SELL_SCRIPT) then
        local to_set = script.get_local(HANGAR_INSTANT_SELL_SCRIPT, HANGAR_INSTANT_SELL_READ_GLOBAL):read_u32()
        script.get_local(HANGAR_INSTANT_SELL_SCRIPT, HANGAR_INSTANT_SELL_WRITE_GLOBAL):write_u32(to_set)
        ui.popup('GOD SYSTEM', 'Done.', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
    else
        ui.popup('GOD SYSTEM', 'Error: mission has not started.', Icons.CANCEL2, PopupType.BOX)
    end
end)

BUS_HANGAR_GROUP_INSTANTSELL:set_hint('Instantly completes the air mission.')

-- Clubhouse
BUS_CH_GROUP_ALLSUPP = BUS_CH_GROUP:new_button('Get all supplies', function ()
    for i = 0, 4 do
        script.get_global(CLUBHOUSE_GET_SUPP_GLOBAL + i):write_u32(1)
    end
    ui.popup('GOD SYSTEM', 'Done.', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
end)

BUS_CH_GROUP_COCSUPP = BUS_CH_GROUP:new_button('Get supplies for cocaine', function ()
    script.get_global(CLUBHOUSE_GET_SUPP_GLOBAL + CLUBHOUSE_GET_COCSUPP_GLOBAL):write_u32(1)
    ui.popup('GOD SYSTEM', 'Done.', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
end)

BUS_CH_GROUP_METHSUPP = BUS_CH_GROUP:new_button('Get supplies for meth', function ()
    script.get_global(CLUBHOUSE_GET_SUPP_GLOBAL + CLUBHOUSE_GET_METHSUPP_GLOBAL):write_u32(1)
    ui.popup('GOD SYSTEM', 'Done.', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
end)

BUS_CH_GROUP_CASHSUPP = BUS_CH_GROUP:new_button('Get supplies for cash', function ()
    script.get_global(CLUBHOUSE_GET_SUPP_GLOBAL + CLUBHOUSE_GET_CASHSUPP_GLOBAL):write_u32(1)
    ui.popup('GOD SYSTEM', 'Done.', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
end)

BUS_CH_GROUP_WEEDSUPP = BUS_CH_GROUP:new_button('Get supplies for weed', function ()
    script.get_global(CLUBHOUSE_GET_SUPP_GLOBAL + CLUBHOUSE_GET_WEEDSUPP_GLOBAL):write_u32(1)
    ui.popup('GOD SYSTEM', 'Done.', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
end)

BUS_CH_GROUP_DOCSSUPP = BUS_CH_GROUP:new_button('Get supplies for documents', function ()
    script.get_global(CLUBHOUSE_GET_SUPP_GLOBAL + CLUBHOUSE_GET_DOCSSUPP_GLOBAL):write_u32(1)
    ui.popup('GOD SYSTEM', 'Done.', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
end)

-- Acid lab
BUS_ACID_GROUP_SUPP = BUS_ACID_GROUP:new_button('Get supplies', function ()
    script.get_global(ACIDLAB_GET_SUPP_GLOBAL):write_u32(1)
    ui.popup('GOD SYSTEM', 'Done.', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
end)
