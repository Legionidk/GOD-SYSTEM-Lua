--- Настройка ограбления --------------------------------------------

Cayo = Submenu.add_static_submenu('Кайо-Перико', 'HC_Cayo')
Heists:add_sub_option('Кайо-Перико', 'HC_Cayo', Cayo)

CayoSettings = Submenu.add_static_submenu('Настройка ограбления', 'HC_CayoSettings')
Cayo:add_sub_option('Настройка ограбления', 'HC_CayoSettings', CayoSettings)

CayoSettings:add_choose_option('Сложность', 'HC_CayoSettings_Difficulty', false, CayoDiff_name,
function (pos)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H4_PROGRESS'), CayoDiff_val[pos])
    notify.success('Cayo', 'Успешно')
end)

CayoSettings:add_choose_option('Главная цель', 'HC_CayoSettings_Main', false, CayoMain_name,
function (pos)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H4CNF_TARGET'), CayoMain_val[pos])
    notify.success('Cayo', 'Успешно')
end)

CayoSettings:add_choose_option('Второстепенная цель', 'HC_CayoSettings_Second', false, CayoSec_name,
function (pos)
    if pos == 1 then
        clear('PAINT', 'COKE', 'WEED', 'CASH')
        stats.set_u32(string.smart_joaat('MP'..mp()..'_H4LOOT_GOLD_C'), 255)
        stats.set_u32(string.smart_joaat('MP'..mp()..'_H4LOOT_GOLD_C_SCOPED'), 255)
        stats.set_u32(string.smart_joaat('MP'..mp()..'_H4LOOT_GOLD_I'), -1)
        stats.set_u32(string.smart_joaat('MP'..mp()..'_H4LOOT_GOLD_I_SCOPED'), -1)
        stats.set_u32(string.smart_joaat('MP'..mp()..'_H4LOOT_GOLD_V'), 330350)
    elseif pos == 2 then
        clear('GOLD', 'COKE', 'WEED', 'CASH')
        stats.set_u32(string.smart_joaat('MP'..mp()..'_H4LOOT_PAINT'), -1)
        stats.set_u32(string.smart_joaat('MP'..mp()..'_H4LOOT_PAINT_SCOPED'), -1)
        stats.set_u32(string.smart_joaat('MP'..mp()..'_H4LOOT_PAINT_V'), 403500)
    elseif pos == 3 then
        clear('PAINT', 'GOLD', 'WEED', 'CASH')
        stats.set_u32(string.smart_joaat('MP'..mp()..'_H4LOOT_COKE_C'), -1)
        stats.set_u32(string.smart_joaat('MP'..mp()..'_H4LOOT_COKE_C_SCOPED'), -1)
        stats.set_u32(string.smart_joaat('MP'..mp()..'_H4LOOT_COKE_I'), -1)
        stats.set_u32(string.smart_joaat('MP'..mp()..'_H4LOOT_COKE_I_SCOPED'), -1)
        stats.set_u32(string.smart_joaat('MP'..mp()..'_H4LOOT_COKE_V'), 330350)
    elseif pos == 4 then
        clear( 'PAINT', 'GOLD', 'COKE', 'CASH')
        stats.set_u32(string.smart_joaat('MP'..mp()..'_H4LOOT_WEED_C'), -1)
        stats.set_u32(string.smart_joaat('MP'..mp()..'_H4LOOT_WEED_C_SCOPED'), -1)
        stats.set_u32(string.smart_joaat('MP'..mp()..'_H4LOOT_WEED_I'), -1)
        stats.set_u32(string.smart_joaat('MP'..mp()..'_H4LOOT_WEED_I_SCOPED'), -1)
        stats.set_u32(string.smart_joaat('MP'..mp()..'_H4LOOT_WEED_V'), 330350)
    elseif pos == 5 then
        clear( 'PAINT', 'GOLD', 'COKE', 'WEED')
        stats.set_u32(string.smart_joaat('MP'..mp()..'_H4LOOT_CASH_C'), -1)
        stats.set_u32(string.smart_joaat('MP'..mp()..'_H4LOOT_CASH_C_SCOPED'), -1)
        stats.set_u32(string.smart_joaat('MP'..mp()..'_H4LOOT_CASH_I'), -1)
        stats.set_u32(string.smart_joaat('MP'..mp()..'_H4LOOT_CASH_I_SCOPED'), -1)
        stats.set_u32(string.smart_joaat('MP'..mp()..'_H4LOOT_CASH_V'), 330350)
    end
    notify.success('Cayo', 'Успешно')
end)

CayoSettings:add_choose_option('Оружие', 'HC_CayoSettings_Guns', false, CayoGuns_name,
function (pos)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H4CNF_WEAPONS'), CayoGuns_val[pos])
    notify.success('Cayo', 'Успешно')
end)

CayoSettings:add_click_option('Выполнить подготовительные', 'HC_CayoSettings_Preps', function()
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H4CNF_UNIFORM'), -1)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H4CNF_TROJAN'), 5)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H4CNF_ARM_DISRP'), 3)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H4CNF_WEP_DISRP'), 3)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H4CNF_HEL_DISRP'), 3)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H4CNF_GRAPPEL'), -1)
    notify.success('Cayo', 'Успешно')
end)

CayoSettings:add_click_option('Открыть все выходы', 'HC_CayoSettings_Exits', function()
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H4CNF_BS_GEN'), -1)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H4CNF_BS_ENTR'), 63)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H4CNF_APPROACH'), -1)
    notify.success('Cayo', 'Успешно')
end)

--- Быстрая настройка ограбления ------------------------------------

Cayo:add_click_option('Быстрая настройка ограбления', 'HC_CayoFast', function()
    clear('PAINT', 'COKE', 'WEED', 'CASH')
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H4_PROGRESS'), 131055)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H4CNF_TARGET'), 5)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H4LOOT_GOLD_C'), 255)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H4LOOT_GOLD_C_SCOPED'), 255)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H4LOOT_GOLD_I'), -1)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H4LOOT_GOLD_I_SCOPED'), -1)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H4LOOT_GOLD_V'), 330350)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H4_MISSIONS'), 65535)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H4CNF_WEAPONS'), 2)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H4CNF_UNIFORM'), -1)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H4CNF_TROJAN'), 5)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H4CNF_ARM_DISRP'), 3)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H4CNF_WEP_DISRP'), 3)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H4CNF_HEL_DISRP'), 3)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H4CNF_GRAPPEL'), -1)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H4CNF_BS_GEN'), -1)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H4CNF_BS_ENTR'), 63)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H4CNF_APPROACH'), -1)
    notify.success('Cayo', 'Успешно')
end):setHint('Автоматически выставляет высокий уровень сложности, статую пантеры и золото.')

--- Удалить долю ----------------------------------------------------

Cayo:add_click_option('Удалить долю Павла и команды', 'HC_CayoCut', function()
    script_global:new(262145):at(30268):set_int64(0)
    script_global:new(262145):at(30269):set_int64(0)
    notify.success('Cayo', 'Успешно')
end):setHint('Активировать после начала ограбления.')

--- Мгновенный скип -------------------------------------------------

Cayo:add_click_option('Мгновенно завершить', 'HC_CayoInsta', function()
    if script.exists('fm_mission_controller_2020') then
        script_local:new('fm_mission_controller_2020', 48513):set_int64(9)
        script_local:new('fm_mission_controller_2020', 48513 + 1765 + 1):set_int64(50)
        notify.success('Cayo', 'Успешно')
    else
        notify.warning('Cayo', 'Ошибка: миссия не запущена')
    end
end)

--- Сброс кд --------------------------------------------------------

Cayo:add_choose_option('Сбросить кд ограбления', 'HC_CayoCd', false, {'Соло', 'Мульти'}, function(pos)
    if pos == 1 then
        stats.set_u32(string.smart_joaat('MP'..mp()..'_H4_TARGET_POSIX'), 1659643454)
    else
        stats.set_u32(string.smart_joaat('MP'..mp()..'_H4_TARGET_POSIX'), 1659429119)
    end
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H4_COOLDOWN'), 0)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H4_COOLDOWN_HARD'), 0)
    notify.success('Cayo', 'Успешно')
end):setHint('После активации необходимо перезайти в онлайн.')
