--- Настройка ограбления --------------------------------------------

Casino = Submenu.add_static_submenu('Казино', 'HC_Casino')
Heists:add_sub_option('Казино', 'HC_Casino', Casino)

CasinoSettings = Submenu.add_static_submenu('Настройка ограбления', 'HC_CasinoSettings')
Casino:add_sub_option('Настройка ограбления', 'HC_CasinoSettings', CasinoSettings)

CasinoSettings:add_choose_option('Подход', 'HC_CasinoSettings_Approach', false, CasApproach_name, function (pos)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H3_LAST_APPROACH'), CasApproach_val[pos])
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_APPROACH'), pos)
    notify.success('Casino', 'Успешно')
end)

CasinoSettings:add_choose_option('Главная цель', 'HC_CasinoSettings_Main', false, CasMain_name, function (pos)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_TARGET'), CasMain_val[pos])
    notify.success('Casino', 'Успешно')
end)

CasinoSettings:add_choose_option('Стрелок', 'HC_CasinoSettings_Gunman', false, CasGunman_name, function (pos)
    if pos == 6 then
        stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_CREWWEAP'), 0)
    else
        stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_CREWWEAP'), pos)
    end
    notify.success('Casino', 'Успешно')
end)

CasinoSettings:add_choose_option('Водитель', 'HC_CasinoSettings_Driver', false, CasDriver_name, function (pos)
    if pos == 6 then
        stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_CREWDRIVER'), 0)
    else
        stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_CREWDRIVER'), pos)
    end
    notify.success('Casino', 'Успешно')
end)

CasinoSettings:add_choose_option('Хакер', 'HC_CasinoSettings_Hacker', false, CasHacker_name, function (pos)
    if pos == 6 then
        stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_CREWHACKER'), 0)
    else
        stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_CREWHACKER'), pos)
    end
    notify.success('Casino', 'Успешно')
end)

CasinoSettings:add_click_option('Выполнить подготовительные', 'HC_CasinoSettings_SkipPreps', function ()
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_DISRUPTSHIP'), 3)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_KEYLEVELS'), 2)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_VEHS'), 3)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_WEAPS'), 0)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_BITSET0'), -1)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_BITSET1'), -1)
    notify.success('Casino', 'Успешно')
end)

CasinoSettings:add_click_option('Открыть все входы', 'HC_CasinoSettings_OpenPoi', function ()
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_POI'), -1)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_ACCESSPOINTS'), -1)
    notify.success('Casino', 'Успешно')
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
    notify.success('Casino', 'Успешно')
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
    notify.success('Casino', 'Успешно')
end)
