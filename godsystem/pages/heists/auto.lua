--- Выбор миссии ----------------------------------------------------

Auto = Submenu.add_static_submenu('Автомастерская', 'HC_Auto')
Heists:add_sub_option('Автомастерская', 'HC_Auto', Auto)

Auto:add_choose_option('Выбрать заказ', 'HC_Auto_MissionSelect', false, Auto_name, function (pos)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_TUNER_CURRENT'), Auto_val[pos])
    notify.success('Auto', 'Успешно')
end):setHint('Изменяет уже выбранный заказ на доске.')

--- Скип подготовительных -------------------------------------------

Auto:add_click_option('Выполнить подготовительные', 'HC_Auto_SkipPreps', function ()
    if stats.get_u32(string.smart_joaat('MP'..mp()..'_TUNER_CURRENT')) == 1 then
        stats.set_u32(string.smart_joaat('MP'..mp()..'_TUNER_GEN_BS'), 4351)
    else
        stats.set_u32(string.smart_joaat('MP'..mp()..'_TUNER_GEN_BS'), 12543)
    end
    notify.success('Auto', 'Успешно')
end)

--- Максимальная выплата --------------------------------------------

-- автор скрипта SilentHy6
-- https://www.unknowncheats.me/forum/grand-theft-auto-v/604599-silent-night.html
Auto:add_click_option('Установить максимальную выплату (2кк)', 'HC_Auto_MaxPayout', function ()
    script_global:new(262145):at(31319):set_float(0)
    globals_set_ints(31323 + 1, 31323 + 8, 1, 2000000)
    notify.success('Auto', 'Успешно')
end):setHint('Активировать после начала заказа.')

--- Мгновенный скип -------------------------------------------------

Auto:add_click_option('Мгновенно завершить', 'HC_Auto_Insta', function ()
    if script.exists('fm_mission_controller_2020') then
        script_local:new('fm_mission_controller_2020', 48513 + 1):set_int64(51338977)
        script_local:new('fm_mission_controller_2020', 48513 + 1765 + 1):set_int64(101)
        notify.success('Auto', 'Успешно')
    else
        notify.warning('Auto', 'Ошибка: миссия не запущена')
    end
end)
