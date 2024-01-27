--- Офис ------------------------------------------------------------

Office = Submenu.add_static_submenu('Офис', 'HC_Office')
HOME_SUBMENU:add_sub_option('Офис', 'HC_Office', Office)

Office:add_state_bar('Ваш офис', 'HC_Office_Name', function ()
    return Apartments[stats.get_u32(string.smart_joaat('MP'..mp()..'_PROP_OFFICE'))].name
end)

--- Тп к офису ------------------------------------------------------

Office:add_click_option('Телепортироваться к офису', 'HC_Office_Tp', function ()
    if Apartments[stats.get_u32(string.smart_joaat('MP'..mp()..'_PROP_OFFICE'))].name == 'Офис не найден' then
        notify.fatal('HC_Office', Apartments[stats.get_u32(string.smart_joaat('MP'..mp()..'_PROP_OFFICE'))].name)
    else
        utils.teleport(Apartments[stats.get_u32(string.smart_joaat('MP'..mp()..'_PROP_OFFICE'))].coords.x,
                        Apartments[stats.get_u32(string.smart_joaat('MP'..mp()..'_PROP_OFFICE'))].coords.y,
                        Apartments[stats.get_u32(string.smart_joaat('MP'..mp()..'_PROP_OFFICE'))].coords.z)
    end
end)

--- Склады ----------------------------------------------------------

WAREHOUSE = Submenu.add_static_submenu('Склады', 'HC_Office_WAREHOUSE')
Office:add_sub_option('Склады', 'HC_Office_WAREHOUSE', WAREHOUSE)

WAREHOUSE:add_state_bar('Всего доступно', 'HC_Office_TAvailable', function ()
    total = 0
    for i = 0, 4 do
        total = total + stats.get_u32(string.smart_joaat('MP'..mp()..'_CONTOTALFORWHOUSE'..i))
    end
    total_owned = 0
    for j = 0, 4 do
        total_owned = total_owned + Warehouse[stats.get_u32(string.smart_joaat('MP'..mp()..'_PROP_WHOUSE_SLOT'..j))].capacity
    end
    return total..' / '..total_owned
end)

--- Склады вкладки --------------------------------------------------

for j = 0, 4 do
    name = Warehouse[stats.get_u32(string.smart_joaat('MP'..mp()..'_PROP_WHOUSE_SLOT'..j))].name
    WH = Submenu.add_static_submenu(name, 'HC_Office_WH'..j)
    WAREHOUSE:add_sub_option(name, 'HC_Office_WH'..j, WH):setHint('Если название склада "Склад не найден", перезагрузи луа.')

    WH:add_state_bar('Доступно', 'HC_Office_WH'..j..'Available', function ()
        return stats.get_u32(string.smart_joaat('MP'..mp()..'_CONTOTALFORWHOUSE'..j))..' / '..Warehouse[stats.get_u32(string.smart_joaat('MP'..mp()..'_PROP_WHOUSE_SLOT'..j))].capacity
    end)
    WH:add_click_option('Телепортироваться к складу', 'HC_Office_WH'..j..'TP', function ()
        if Warehouse[stats.get_u32(string.smart_joaat('MP'..mp()..'_PROP_WHOUSE_SLOT'..j))].name == 'Склад не найден' then
            notify.fatal('HC_Office', Warehouse[stats.get_u32(string.smart_joaat('MP'..mp()..'_PROP_WHOUSE_SLOT'..j))].name)
        else
            utils.teleport(Warehouse[stats.get_u32(string.smart_joaat('MP'..mp()..'_PROP_WHOUSE_SLOT'..j))].coords.x, 
                            Warehouse[stats.get_u32(string.smart_joaat('MP'..mp()..'_PROP_WHOUSE_SLOT'..j))].coords.y, 
                            Warehouse[stats.get_u32(string.smart_joaat('MP'..mp()..'_PROP_WHOUSE_SLOT'..j))].coords.z)
        end
    end)
end

--- Афк фарм --------------------------------------------------------

WAREHOUSE:add_separator('Функции', 'HC_Office_WAREHOUSE_Sep')

WAREHOUSE:add_looped_option('Афк фарм ящиков', 'HC_Office_Afk', 1, function ()
    for i = 12, 16 do
        stats.set_masked_int(string.smart_joaat('MP'..mp()..'_FIXERPSTAT_BOOL1'), 1, i, mp())
    end
end, function ()
    notify.success('HC_Office', 'Фарм выключен')
end)

--- Моментальная покупка / продажа ----------------------------------

WAREHOUSE:add_choose_option('Моментально завершить', 'HC_Office_Insta', false, {'Покупку', 'Продажу'}, function (pos)
    if pos == 1 then
        if script.exists('gb_contraband_buy') then
            script_local:new('gb_contraband_buy', 601 + 5):set_int64(1)
            script_local:new('gb_contraband_buy', 601 + 191):set_int64(6)
            script_local:new('gb_contraband_buy', 601 + 192):set_int64(4)
            notify.success('HC_Office', 'Покупка завершена')
        else
            notify.fatal('HC_Office', 'Ошибка, попробуйте еще раз')
        end
    else
        if script.exists('gb_contraband_sell') then
            script_local:new('gb_contraband_sell', 543 + 1):set_int64(99999)
            notify.success('HC_Office', 'Продажа завершена')
        else
            notify.fatal('HC_Office', 'Ошибка, попробуйте еще раз')
        end
    end
end)

--- Удалить кд покупки / продажи ------------------------------------

WAREHOUSE:add_choose_option('Удалить кд', 'HC_Office_Cd', false, {'Покупки', 'Продажи'}, function (pos)
    if pos == 1 then
        script_global:new(262145):at(15756):set_int64(0)
        notify.success('HC_Office', 'Кд удалено')
    else
        script_global:new(262145):at(15757):set_int64(0)
        notify.success('HC_Office', 'Кд удалено')
    end
end)