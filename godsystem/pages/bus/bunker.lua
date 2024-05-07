--- Бункер ----------------------------------------------------------

Bunker = Submenu.add_static_submenu('Bunker', 'HC_Bunker')
Bus:add_sub_option('Bunker', 'HC_Bunker', Bunker)

Bunker:add_state_bar('Your bunker', 'HC_Bunker_Name', function ()
    return Bunkers_name[stats.get_u32(string.smart_joaat('MP'..mp()..'_FACTORYSLOT5'))].name
end)

Bunker:add_click_option('TP to bunker', 'HC_Bunker_TP', function ()
    if stats.get_u32(string.smart_joaat('MP'..mp()..'_FACTORYSLOT5')) == 0 then
        notify.warning('Bunker not found', 'Bunker not found')
    else
        utils.teleport(Bunkers_name[stats.get_u32(string.smart_joaat('MP'..mp()..'_FACTORYSLOT5'))].coords.x,
                        Bunkers_name[stats.get_u32(string.smart_joaat('MP'..mp()..'_FACTORYSLOT5'))].coords.y,
                        Bunkers_name[stats.get_u32(string.smart_joaat('MP'..mp()..'_FACTORYSLOT5'))].coords.z)
    end
end)

--- Сырье -----------------------------------------------------------

Mat = Submenu.add_static_submenu('Supplies', 'HC_Bunker_Mat')
Bunker:add_sub_option('Supplies', 'HC_Bunker_Mat', Mat)

Mat:add_state_bar('Supplies', 'HC_Bunker_Mat_Statebar', function ()
    return stats.get_u32(string.smart_joaat('MP'..mp()..'_MATTOTALFORFACTORY5'))..' / 103'
end)

Mat:add_click_option('Get supplies', 'HC_Bunker_Restock', function ()
    if stats.get_u32(string.smart_joaat('MP'..mp()..'_MATTOTALFORFACTORY5')) == 100
    or stats.get_u32(string.smart_joaat('MP'..mp()..'_MATTOTALFORFACTORY5')) == 101
    or stats.get_u32(string.smart_joaat('MP'..mp()..'_MATTOTALFORFACTORY5')) == 102
    or stats.get_u32(string.smart_joaat('MP'..mp()..'_MATTOTALFORFACTORY5')) == 103 then
        notify.warning('bunker_supp_error', 'Error: your bunker is already full of supplies')
    else
        script_global:new(2707225):set_int64(121)
        notify.success('Done', 'Done')
    end
end)

--- Товар -----------------------------------------------------------

Prod = Submenu.add_static_submenu('Stock', 'HC_Bunker_Prod')
Bunker:add_sub_option('Stock', 'HC_Bunker_Prod', Prod)

Prod:add_state_bar('Stock', 'HC_Bunker_Prod_Statebar', function ()
    return stats.get_u32(string.smart_joaat('MP'..mp()..'_PRODTOTALFORFACTORY5'))..' / 100'
end)

Prod:add_click_option('Instant sell', 'HC_Bunker_InstaSell', function ()
    if script.exists('gb_gunrunning') then
        script_local:new('gb_gunrunning', 1209):set_int64(15)
        script_local:new('gb_gunrunning', 1209 + 774):set_int64(0)
        notify.success('Done', 'Done', '')
    else
        notify.warning('mission_error', 'Error: mission has not started')
    end
end)

--- Разработка ------------------------------------------------------

Research = Submenu.add_static_submenu('Research', 'HC_Bunker_Research')
Bunker:add_sub_option('Research', 'HC_Bunker_Research', Research)

Research:add_state_bar('Research', 'HC_Bunker_Research_Statebar', function ()
    return stats.get_u32(string.smart_joaat('MP'..mp()..'_RESEARCHTOTALFORFACTORY5'))..' / 100'
end)