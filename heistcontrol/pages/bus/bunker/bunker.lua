--- Бункер ----------------------------------------------------------

Bunker = Submenu.add_static_submenu('Бункер', 'HC_Bunker')
Bus:add_sub_option('Бункер', 'HC_Bunker', Bunker)

Bunker:add_state_bar('Ваш бункер', 'HC_Bunker_Name', function ()
    return Bunkers_name[stats.get_u32(string.smart_joaat('MP'..mp()..'_FACTORYSLOT5'))].name
end)

--- Сырье / товар / разработка --------------------------------------

choice, choice_name = 0, 'Сырье'

Bunker:add_choose_option('Отображать', 'HC_Bunker_StateBar_Choice', true, {'Сырье', 'Товар', 'Разработку'}, function (pos)
    if pos == 1 then
        choice = 0
    elseif pos == 2 then
        choice = 1
    else
        choice = 2
    end
end)

Bunker:add_state_bar('', 'HC_Bunker_StateBar', function ()
    if choice == 0 then
        return stats.get_u32(string.smart_joaat('MP'..mp()..'_MATTOTALFORFACTORY5'))..' / 100'
    elseif choice == 1 then
        return stats.get_u32(string.smart_joaat('MP'..mp()..'_PRODTOTALFORFACTORY5'))..' / 100'
    else
        return stats.get_u32(string.smart_joaat('MP'..mp()..'_RESEARCHTOTALFORFACTORY5'))..' / 100'
    end
end)

--- Функции ---------------------------------------------------------

Bunker:add_click_option('Телепортироваться к бункеру', 'HC_Bunker_TP', function ()
    utils.teleport(Bunkers_name[stats.get_u32(string.smart_joaat('MP'..mp()..'_FACTORYSLOT5'))].coords.x,
                    Bunkers_name[stats.get_u32(string.smart_joaat('MP'..mp()..'_FACTORYSLOT5'))].coords.y,
                    Bunkers_name[stats.get_u32(string.smart_joaat('MP'..mp()..'_FACTORYSLOT5'))].coords.z)
end)

Bunker:add_click_option('Пополнить сырье', 'HC_Bunker_Restock', function ()
    if stats.get_u32(string.smart_joaat('MP'..mp()..'_MATTOTALFORFACTORY5')) == 100 then
        notify.fatal('HC_Bunker', 'У вас уже есть сырье!')
    else
        script_global:new(2707225):set_int64(121)
        notify.success('HC_Bunker', 'Сырье пополнено')
    end
end)

Bunker:add_click_option('Моментально завершить продажу', 'HC_Bunker_InstaSell', function ()
    if script.exists('gb_gunrunning') then
        script_local:new('gb_gunrunning', 1209):set_int64(15)
        script_local:new('gb_gunrunning', 1209 + 774):set_int64(0)
    else
        notify.fatal('HC_Bunker', 'Ошибка, попробуйте еще раз')
    end
end):setHint('После нажатия игра скажет что миссия провалена, но деньги и продажу засчитают.')