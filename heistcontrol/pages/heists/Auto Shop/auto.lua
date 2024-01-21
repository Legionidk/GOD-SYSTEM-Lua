--- Выбор миссии ----------------------------------------------------

Auto = Submenu.add_static_submenu('Автомастерская', 'HC_Auto')
Heists:add_sub_option('Автомастерская', 'HC_Auto', Auto)

Auto:add_choose_option('Выбрать заказ', 'HC_Auto_MissionSelect', false, {'Федеральное хранилище', 'Дело "Супердоллары"', 'Налет на банк', 'Захват ЭБУ', 'Налет на тюрьму', 'Налет на ЦУР', 'Налет на "Пропащих"', 'Похищение данных'}, function (pos)
    pos_name = {
        [1] = 'Налет на федеральное хранилище',
        [2] = 'Дело "Супердоллары"',
        [3] = 'Налет на банк',
        [4] = 'Захват ЭБУ',
        [5] = 'Налет на тюрьму',
        [6] = 'Налет на ЦУР',
        [7] = 'Налет на "Пропащих"',
        [8] = 'Похищение данных'
    }
    pos_val = {
        [1] = 0,
        [2] = 1,
        [3] = 2,
        [4] = 3,
        [5] = 4,
        [6] = 5,
        [7] = 6,
        [8] = 7
    }
    stats_set('MP'..mp()..'_TUNER_CURRENT', pos_val[pos])
    notify.success('Auto', 'Успешно выбрано: ' ..pos_name[pos])
end):setHint('Изменяет уже выбранный заказ на доске.')

--- Скип подготовительных -------------------------------------------

Auto:add_click_option('Выполнить подготовительные', 'HC_Auto_SkipPreps', function ()
    hash = string.smart_joaat('MP'..mp()..'_TUNER_CURRENT')
    if stats.get_u32(hash) == 1 then
        stats_set('MP'..mp()..'_TUNER_GEN_BS', 4351)
    else
        stats_set('MP'..mp()..'_TUNER_GEN_BS', 12543)
    end
    notify.success('Auto', 'Подготовительные выполнены')
end)

--- Максимальная выплата --------------------------------------------

-- автор скрипта SilentHy6
-- https://www.unknowncheats.me/forum/grand-theft-auto-v/604599-silent-night.html
Auto:add_click_option('Установить максимальную выплату (2кк)', 'HC_Auto_MaxPayout', function ()
    globals_set_ints(31323 + 1, 31323 + 8, 1, 2000000)
    notify.success('Auto', 'Выплата установлена')
end):setHint('Активировать после начала заказа.')

--- Мгновенный скип -------------------------------------------------

Auto:add_click_option('Мгновенно завершить', 'HC_Auto_Insta', function ()
    if script.exists('fm_mission_controller_2020') then
        script_local:new('fm_mission_controller_2020', 48513 + 1):set_int64(51338977)
        script_local:new('fm_mission_controller_2020', 48513 + 1765 + 1):set_int64(101)
        notify.success('Auto', 'Заказ завершен')
    else
        notify.warning('Auto', 'Ошибка, попробуйте еще раз')
    end
end)
