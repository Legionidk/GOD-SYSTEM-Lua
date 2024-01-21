--- Настройка ограбления --------------------------------------------

Casino = Submenu.add_static_submenu('Казино', 'HC_Casino')
Heists:add_sub_option('Казино', 'HC_Casino', Casino)

CasinoSettings = Submenu.add_static_submenu('Настройка ограбления', 'HC_CasinoSettings')
Casino:add_sub_option('Настройка ограбления', 'HC_CasinoSettings', CasinoSettings)

CasinoSettings:add_choose_option('Подход', 'HC_CasinoSettings_Approach', false, {'Скрытность', 'Обман', 'Штурм'}, function (pos)
    main_position = {
        [1] = 'Скрытность',
        [2] = 'Обман',
        [3] = 'Штурм'
    }
    last_approach = {
        [1] = 3,
        [2] = 3,
        [3] = 1
    }
    stats_set('MP'..mp()..'_H3_LAST_APPROACH', last_approach[pos])
    stats_set('MP'..mp()..'_H3OPT_APPROACH', pos)
    notify.success('Casino', 'Успешно выбрано: ' ..main_position[pos])
end)

CasinoSettings:add_choose_option('Главная цель', 'HC_CasinoSettings_Main', false, {'Деньги', 'Золото', 'Картины', 'Алмазы'}, function (pos)
    main_position = {
        [1] = 'Деньги',
        [2] = 'Золото',
        [3] = 'Картины',
        [4] = 'Алмазы'
    }
    main_numbers = {
        [1] = 0,
        [2] = 1,
        [3] = 2,
        [4] = 3
    }
    stats_set('MP'..mp()..'_H3OPT_TARGET', main_numbers[pos])
    notify.success('Casino', 'Успешно выбрано: ' ..main_position[pos])
end)

CasinoSettings:add_choose_option('Стрелок', 'HC_CasinoSettings_Gunnman', false, {'Карл Аболаджи', 'Густаво Мота', 'Чарли Рид', 'Честер Маккой', 'Патрик Макрири', 'Не выбран'}, function (pos)
    main_position = {
        [1] = 'Карл Аболаджи',
        [2] = 'Густаво Мота',
        [3] = 'Чарли Рид',
        [4] = 'Честер Маккой',
        [5] = 'Патрик Макрири',
        [6] = 'Стрелок удален'
    }
    if pos == 6 then
        stats_set('MP'..mp()..'_H3OPT_CREWWEAP', 0)
    else
        stats_set('MP'..mp()..'_H3OPT_CREWWEAP', pos)
    end
    notify.success('Casino', 'Успешно выбрано: ' ..main_position[pos])
end)

CasinoSettings:add_choose_option('Водитель', 'HC_CasinoSettings_Driver', false, {'Карим Денц', 'Талиана Мартинес', 'Эдди Тоу', 'Зак Нельсон', 'Честер Маккой', 'Не выбран'}, function (pos)
    main_position = {
        [1] = 'Карим Денц',
        [2] = 'Талиана Мартинес',
        [3] = 'Эдди Тоу',
        [4] = 'Зак Нельсон',
        [5] = 'Честер Маккой',
        [6] = 'Водитель удален'
    }
    if pos == 6 then
        stats_set('MP'..mp()..'_H3OPT_CREWDRIVER', 0)
    else
        stats_set('MP'..mp()..'_H3OPT_CREWDRIVER', pos)
    end
    notify.success('Casino', 'Успешно выбрано: ' ..main_position[pos])
end)

CasinoSettings:add_choose_option('Хакер', 'HC_CasinoSettings_Hacker', false, {'Рикки Люкенс', 'Кристиан Фелти', 'Йохан Блэр', 'Ави Шварцман', 'Пейдж Харрис', 'Не выбран'}, function (pos)
    main_position = {
        [1] = 'Рикки Люкенс',
        [2] = 'Кристиан Фелти',
        [3] = 'Йохан Блэр',
        [4] = 'Ави Шварцман',
        [5] = 'Пейдж Харрис',
        [6] = 'Хакер удален'
    }
    if pos == 6 then
        stats_set('MP'..mp()..'_H3OPT_CREWHACKER', 0)
    else
        stats_set('MP'..mp()..'_H3OPT_CREWHACKER', pos)
    end
    notify.success('Casino', 'Успешно выбрано: ' ..main_position[pos])
end)

CasinoSettings:add_click_option('Выполнить подготовительные', 'HC_CasinoSettings_SkipPreps', function ()
    stats_set('MP'..mp()..'_H3OPT_DISRUPTSHIP', 3)
    stats_set('MP'..mp()..'_H3OPT_KEYLEVELS', 2)
    stats_set('MP'..mp()..'_H3OPT_VEHS', 3)
    stats_set('MP'..mp()..'_H3OPT_WEAPS', 0)
    stats_set('MP'..mp()..'_H3OPT_BITSET0', -1)
    stats_set('MP'..mp()..'_H3OPT_BITSET1', -1)
    notify.success('Casino', 'Подготовительные выполнены')
end)

CasinoSettings:add_click_option('Открыть все входы', 'HC_CasinoSettings_OpenPoi', function ()
    stats_set('MP'..mp()..'_H3OPT_POI', -1)
    stats_set('MP'..mp()..'_H3OPT_ACCESSPOINTS', -1)
    notify.success('Casino', 'Входы открыты')
end)

--- Удалить долю ----------------------------------------------------

-- Main:add_click_option('Удалить долю лестера и банды', 'HC_CasinoSettings_DelCut', function ()
--     player_index = script_global:new(1574915):get_int64()
--     script_global:new(262145):at(29094):set_int64(0)
--     script_global:new(262145):at(29108):set_int64(0)
--     script_global:new(262145):at(28744):set_int64(0)
--     script_global:new(262145):at(29095):set_int64(0)
--     script_global:new(262145):at(29096):set_int64(0)
--     script_global:new(262145):at(29097):set_int64(0)
--     script_global:new(262145):at(29098):set_int64(0)
--     script_global:new(262145):at(29099):set_int64(0)
--     script_global:new(262145):at(29100):set_int64(0)
--     script_global:new(262145):at(29101):set_int64(0)
--     script_global:new(262145):at(29102):set_int64(0)
--     script_global:new(262145):at(29103):set_int64(0)
--     script_global:new(262145):at(29104):set_int64(0)
--     script_global:new(262145):at(29105):set_int64(0)
--     script_global:new(262145):at(29106):set_int64(0)
--     script_global:new(262145):at(29107):set_int64(0)
--     notify.success('Casino', 'Доли удалены')
-- end)

--- Быстрая настройка ограбления ------------------------------------

Casino:add_click_option('Быстрая настройка ограбления', 'HC_CasinoFast', function ()
    stats_set('MP'..mp()..'_H3_LAST_APPROACH', 3) -- Обман
    stats_set('MP'..mp()..'_H3OPT_APPROACH', 2) -- Обман
    stats_set('MP'..mp()..'_H3OPT_TARGET', 3) -- Алмазы 
    stats_set('MP'..mp()..'_H3OPT_CREWWEAP', 1) -- Стрелок Карл Аболаджи (5%)
    stats_set('MP'..mp()..'_H3OPT_CREWDRIVER', 1) -- Водитель Карим Денц (5%)
    stats_set('MP'..mp()..'_H3OPT_CREWHACKER', 1) -- Хакер Рикки Люкенс (3%)
    stats_set('MP'..mp()..'_H3OPT_DISRUPTSHIP', 3) -- Подготовительные
    stats_set('MP'..mp()..'_H3OPT_KEYLEVELS', 2) -- Подготовительные
    stats_set('MP'..mp()..'_H3OPT_VEHS', 3) -- Подготовительные
    stats_set('MP'..mp()..'_H3OPT_WEAPS', 0) -- Подготовительные
    stats_set('MP'..mp()..'_H3OPT_BITSET0', -1) -- Подготовительные
    stats_set('MP'..mp()..'_H3OPT_BITSET1', -1) -- Подготовительные
    stats_set('MP'..mp()..'_H3OPT_POI', -1) -- Входы
    stats_set('MP'..mp()..'_H3OPT_ACCESSPOINTS', -1) -- Входы
    notify.success('Casino', 'Ограбление настроено')
end):setHint('Автоматически выставляет обман, алмазы и самых низких по доле подельников.')

--- Сброс кд --------------------------------------------------------

-- Main:add_click_option('Сбросить кд ограбления', 'HC_CasinoSettings_ResetCd', function ()
--     player_index = script_global:new(1574915):get_int64()
--     stats_set('MP'..player_index..'_H3_COMPLETEDPOSIX', -1)
--     stats_set('MPPLY_H3_COOLDOWN', -1)
--     notify.success('Casino', 'Кд успешно сброшено')
-- end):setHint('Возможно потребуется перезайти в онлайн.')

--- Ресет ограбы ----------------------------------------------------

Casino:add_click_option('Сбросить ограбление', 'HC_CasinoSettings_Reset', function ()
    stats_set('MP'..mp()..'_H3_LAST_APPROACH', 0)
    stats_set('MP'..mp()..'_H3_HARD_APPROACH', 0)
    stats_set('MP'..mp()..'_H3OPT_APPROACH', 0)
    stats_set('MP'..mp()..'_H3OPT_TARGET', 0)
    stats_set('MP'..mp()..'_H3OPT_CREWWEAP', 0)
    stats_set('MP'..mp()..'_H3OPT_CREWDRIVER', 0)
    stats_set('MP'..mp()..'_H3OPT_CREWHACKER', 0)
    stats_set('MP'..mp()..'_H3OPT_DISRUPTSHIP', 0)
    stats_set('MP'..mp()..'_H3OPT_KEYLEVELS', 0)
    stats_set('MP'..mp()..'_H3OPT_VEHS', 0)
    stats_set('MP'..mp()..'_H3OPT_WEAPS', 0)
    stats_set('MP'..mp()..'_H3OPT_BITSET0', 0)
    stats_set('MP'..mp()..'_H3OPT_BITSET1', 0)
    stats_set('MP'..mp()..'_H3OPT_POI', 0)
    stats_set('MP'..mp()..'_H3OPT_ACCESSPOINTS', 0)
    notify.success('Casino', 'Ограбление сброшено')
end)
