--- Настройка ограбления --------------------------------------------

Casino = Submenu.add_static_submenu('Казино', 'HC_Casino')
Heists:add_sub_option('Казино', 'HC_Casino', Casino)

CasinoSettings = Submenu.add_static_submenu('Настройка ограбления', 'HC_CasinoSettings')
Casino:add_sub_option('Настройка ограбления', 'HC_CasinoSettings', CasinoSettings)

CasinoSettings:add_choose_option('Подход', 'HC_CasinoSettings_Approach', false, {'Скрытность', 'Обман', 'Штурм'}, function (pos)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H3_LAST_APPROACH'), CasApproach_val[pos])
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_APPROACH'), pos)
    notify.success('Casino', 'Успешно выбрано: ' ..CasApproach_name[pos])
end)

CasinoSettings:add_choose_option('Главная цель', 'HC_CasinoSettings_Main', false, {'Деньги', 'Золото', 'Картины', 'Алмазы'}, function (pos)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_TARGET'), CasMain_val[pos])
    notify.success('Casino', 'Успешно выбрано: ' ..CasMain_name[pos])
end)

CasinoSettings:add_choose_option('Стрелок', 'HC_CasinoSettings_Gunman', false, {'Карл Аболаджи', 'Густаво Мота', 'Чарли Рид', 'Честер Маккой', 'Патрик Макрири', 'Не выбран'}, function (pos)
    if pos == 6 then
        stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_CREWWEAP'), 0)
    else
        stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_CREWWEAP'), pos)
    end
    notify.success('Casino', 'Успешно выбрано: ' ..CasGunman_name[pos])
end)

CasinoSettings:add_choose_option('Водитель', 'HC_CasinoSettings_Driver', false, {'Карим Денц', 'Талиана Мартинес', 'Эдди Тоу', 'Зак Нельсон', 'Честер Маккой', 'Не выбран'}, function (pos)
    if pos == 6 then
        stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_CREWDRIVER'), 0)
    else
        stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_CREWDRIVER'), pos)
    end
    notify.success('Casino', 'Успешно выбрано: ' ..CasDriver_name[pos])
end)

CasinoSettings:add_choose_option('Хакер', 'HC_CasinoSettings_Hacker', false, {'Рикки Люкенс', 'Кристиан Фелти', 'Йохан Блэр', 'Ави Шварцман', 'Пейдж Харрис', 'Не выбран'}, function (pos)
    if pos == 6 then
        stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_CREWHACKER'), 0)
    else
        stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_CREWHACKER'), pos)
    end
    notify.success('Casino', 'Успешно выбрано: ' ..CasHacker_name[pos])
end)

CasinoSettings:add_click_option('Выполнить подготовительные', 'HC_CasinoSettings_SkipPreps', function ()
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_DISRUPTSHIP'), 3)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_KEYLEVELS'), 2)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_VEHS'), 3)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_WEAPS'), 0)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_BITSET0'), -1)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_BITSET1'), -1)
    notify.success('Casino', 'Подготовительные выполнены')
end)

CasinoSettings:add_click_option('Открыть все входы', 'HC_CasinoSettings_OpenPoi', function ()
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_POI'), -1)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_ACCESSPOINTS'), -1)
    notify.success('Casino', 'Входы открыты')
end)

--- Быстрая настройка ограбления ------------------------------------

Casino:add_click_option('Быстрая настройка ограбления', 'HC_CasinoFast', function ()
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H3_LAST_APPROACH'), 3) -- Обман
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_APPROACH'), 2) -- Обман
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_TARGET'), 3) -- Алмазы 
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_CREWWEAP'), 1) -- Стрелок Карл Аболаджи (5%)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_CREWDRIVER'), 1) -- Водитель Карим Денц (5%)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_CREWHACKER'), 1) -- Хакер Рикки Люкенс (3%)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_DISRUPTSHIP'), 3) -- Подготовительные
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_KEYLEVELS'), 2) -- Подготовительные
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_VEHS'), 3) -- Подготовительные
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_WEAPS'), 0) -- Подготовительные
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_BITSET0'), -1) -- Подготовительные
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_BITSET1'), -1) -- Подготовительные
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_POI'), -1) -- Входы
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_ACCESSPOINTS'), -1) -- Входы
    notify.success('Casino', 'Ограбление настроено')
end):setHint('Автоматически выставляет обман, алмазы и самых низких по доле подельников.')

--- Ресет ограбы ----------------------------------------------------

Casino:add_click_option('Сбросить ограбление', 'HC_CasinoSettings_Reset', function ()
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H3_LAST_APPROACH'), 0)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H3_HARD_APPROACH'), 0)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_APPROACH'), 0)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_TARGET'), 0)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_CREWWEAP'), 0)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_CREWDRIVER'), 0)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_CREWHACKER'), 0)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_DISRUPTSHIP'), 0)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_KEYLEVELS'), 0)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_VEHS'), 0)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_WEAPS'), 0)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_BITSET0'), 0)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_BITSET1'), 0)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_POI'), 0)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_ACCESSPOINTS'), 0)
    notify.success('Casino', 'Ограбление сброшено')
end)
