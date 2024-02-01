--- Бункер ----------------------------------------------------------

Bunker = Submenu.add_static_submenu('Бункер', 'HC_Bunker')
Bus:add_sub_option('Бункер', 'HC_Bunker', Bunker)

Bunker:add_state_bar('Ваш бункер', 'HC_Bunker_Name', function ()
    return Bunkers_name[stats.get_u32(string.smart_joaat('MP'..mp()..'_FACTORYSLOT5'))].name
end)

Bunker:add_click_option('Телепортировться к бункеру', 'HC_Bunker_TP', function ()
    utils.teleport(Bunkers_name[stats.get_u32(string.smart_joaat('MP'..mp()..'_FACTORYSLOT5'))].coords.x,
                    Bunkers_name[stats.get_u32(string.smart_joaat('MP'..mp()..'_FACTORYSLOT5'))].coords.y,
                    Bunkers_name[stats.get_u32(string.smart_joaat('MP'..mp()..'_FACTORYSLOT5'))].coords.z)
end)

--- Сырье -------------------------------------------------------------

Mat = Submenu.add_static_submenu('Сырье', 'HC_Bunker_Mat')
Bunker:add_sub_option('Сырье', 'HC_Bunker_Mat', Mat)

Mat:add_state_bar('Сырье', 'HC_Bunker_Mat', function ()
    return stats.get_u32(string.smart_joaat('MP'..mp()..'_MATTOTALFORFACTORY5'))..' / 101'
end)

Mat:add_click_option('Пополнить сырье', 'HC_Bunker_Restock', function ()
    script_global:new(2707225):set_int64(121)
    notify.success('HC_Bunker', 'Сырье пополнено')
end)

--- Товар -----------------------------------------------------------

Prod = Submenu.add_static_submenu('Товар', 'HC_Bunker_Prod')
Bunker:add_sub_option('Товар', 'HC_Bunker_Prod', Prod)

Prod:add_state_bar('Товар', 'HC_Bunker_Prod', function ()
    return stats.get_u32(string.smart_joaat('MP'..mp()..'_PRODTOTALFORFACTORY5'))..' / 100'
end)

Prod:add_click_option('Моментально завершить продажу', 'HC_Bunker_InstaSell', function ()
    if script.exists('gb_gunrunning') then
        script_local:new('gb_gunrunning', 1209):set_int64(15)
        script_local:new('gb_gunrunning', 1209 + 774):set_int64(0)
    else
        notify.fatal('HC_Bunker', 'Ошибка, попробуйте еще раз')
    end
end):setHint('После нажатия игра скажет что миссия провалена, но деньги и продажу засчитают.')

--- Разработка -------------------------------------------------------

Research = Submenu.add_static_submenu('Разработка', 'HC_Bunker_Research')
Bunker:add_sub_option('Разработка', 'HC_Bunker_Research', Research)

Research:add_state_bar('Разработка', 'HC_Bunker_Research', function ()
    return stats.get_u32(string.smart_joaat('MP'..mp()..'_RESEARCHTOTALFORFACTORY5'))..' / 100'
end)
