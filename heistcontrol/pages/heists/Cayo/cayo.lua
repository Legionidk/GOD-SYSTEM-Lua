--- Настройка ограбления --------------------------------------------

Cayo = Submenu.add_static_submenu('Кайо-Перико', 'HC_Cayo')
Heists:add_sub_option('Кайо-Перико', 'HC_Cayo', Cayo)

CayoSettings = Submenu.add_static_submenu('Настройка ограбления', 'HC_CayoSettings')
Cayo:add_sub_option('Настройка ограбления', 'HC_CayoSettings', CayoSettings)

CayoSettings:add_choose_option('Сложность', 'HC_CayoSettings_Difficulty', false, {'Высокая', 'Нормальная'},
function (pos)
    main_position = {
        [1] = 'Высокая сложность',
        [2] = 'Нормальная сложность'
    }
    main_numbers = {
        [1] = 131055,
        [2] = 126823
    }
    stats_set('MP'..mp()..'_H4_PROGRESS', main_numbers[pos])
    notify.success('Cayo', 'Успешно выбрано: ' ..main_position[pos])
end)

CayoSettings:add_choose_option('Главная цель', 'HC_CayoSettings_Main', false, {'Статуя пантеры', 'Розовый алмаз', 'Облигации', 'Ожерелье', 'Текила "Синсимито"'},
function (pos)
    main_position = {
        [1] = 'Статуя пантеры',
        [2] = 'Розовый алмаз',
        [3] = 'Облигации',
        [4] = 'Ожерелье',
        [5] = 'Текила "Синсимито"'
    }
    main_numbers = {
        [1] = 5,
        [2] = 3,
        [3] = 2,
        [4] = 1,
        [5] = 0
    }
    stats_set('MP'..mp()..'_H4CNF_TARGET', main_numbers[pos])
    notify.success('Cayo', 'Успешно выбрано: ' ..main_position[pos])
end)

CayoSettings:add_choose_option('Второстепенная цель', 'HC_CayoSettings_Second', false, {'Золото', 'Картины', 'Кокаин', 'Марихуана', 'Деньги'},
function (pos)
    main_position = {
        [1] = 'Золото',
        [2] = 'Картины',
        [3] = 'Кокаин',
        [4] = 'Марихуана',
        [5] = 'Деньги'
    }
    if pos == 1 then
        clear('PAINT', 'COKE', 'WEED', 'CASH')
        stats_set('MP'..mp()..'_H4LOOT_GOLD_C', 255)
        stats_set('MP'..mp()..'_H4LOOT_GOLD_C_SCOPED', 255)
        stats_set('MP'..mp()..'_H4LOOT_GOLD_I', -1)
        stats_set('MP'..mp()..'_H4LOOT_GOLD_I_SCOPED', -1)
        stats_set('MP'..mp()..'_H4LOOT_GOLD_V', 330350)
    elseif pos == 2 then
        clear('GOLD', 'COKE', 'WEED', 'CASH')
        stats_set('MP'..mp()..'_H4LOOT_PAINT', -1)
        stats_set('MP'..mp()..'_H4LOOT_PAINT_SCOPED', -1)
        stats_set('MP'..mp()..'_H4LOOT_PAINT_V', 403500)
    elseif pos == 3 then
        clear('PAINT', 'GOLD', 'WEED', 'CASH')
        stats_set('MP'..mp()..'_H4LOOT_COKE_C', -1)
        stats_set('MP'..mp()..'_H4LOOT_COKE_C_SCOPED', -1)
        stats_set('MP'..mp()..'_H4LOOT_COKE_I', -1)
        stats_set('MP'..mp()..'_H4LOOT_COKE_I_SCOPED', -1)
        stats_set('MP'..mp()..'_H4LOOT_COKE_V', 330350)
    elseif pos == 4 then
        clear( 'PAINT', 'GOLD', 'COKE', 'CASH')
        stats_set('MP'..mp()..'_H4LOOT_WEED_C', -1)
        stats_set('MP'..mp()..'_H4LOOT_WEED_C_SCOPED', -1)
        stats_set('MP'..mp()..'_H4LOOT_WEED_I', -1)
        stats_set('MP'..mp()..'_H4LOOT_WEED_I_SCOPED', -1)
        stats_set('MP'..mp()..'_H4LOOT_WEED_V', 330350)
    elseif pos == 5 then
        clear( 'PAINT', 'GOLD', 'COKE', 'WEED')
        stats_set('MP'..mp()..'_H4LOOT_CASH_C', -1)
        stats_set('MP'..mp()..'_H4LOOT_CASH_C_SCOPED', -1)
        stats_set('MP'..mp()..'_H4LOOT_CASH_I', -1)
        stats_set('MP'..mp()..'_H4LOOT_CASH_I_SCOPED', -1)
        stats_set('MP'..mp()..'_H4LOOT_CASH_V', 330350)
    end
    notify.success('Cayo', 'Успешно выбрано: ' ..main_position[pos])
end)

CayoSettings:add_choose_option('Оружие', 'HC_CayoSettings_Guns', false, {'Зачинщик', 'Конспиратор', 'Снайпер', 'Диверсант', 'Марксман'},
function (pos)
    main_position = {
        [1] = 'Зачинщик',
        [2] = 'Конспиратор',
        [3] = 'Снайпер',
        [4] = 'Диверсант',
        [5] = 'Марксман'
    }
    main_numbers = {
        [1] = 1,
        [2] = 2,
        [3] = 3,
        [4] = 4,
        [5] = 5
    }
    stats_set('MP'..mp()..'_H4CNF_WEAPONS', main_numbers[pos])
    notify.success('Cayo', 'Успешно выбрано: ' ..main_position[pos])
end)

CayoSettings:add_click_option('Выполнить подготовительные', 'HC_CayoSettings_Preps', function()
    stats_set('MP'..mp()..'_H4CNF_UNIFORM', -1) -- Подготовительные
    stats_set('MP'..mp()..'_H4CNF_TROJAN', 5) -- Подготовительные
    stats_set('MP'..mp()..'_H4CNF_ARM_DISRP', 3) -- Подготовительные
    stats_set('MP'..mp()..'_H4CNF_WEP_DISRP', 3) -- Подготовительные
    stats_set('MP'..mp()..'_H4CNF_HEL_DISRP', 3) -- Подготовительные
    stats_set('MP'..mp()..'_H4CNF_GRAPPEL', -1) -- Подготовительные
    notify.success('Cayo', 'Подготовительные выполнены')
end)

CayoSettings:add_click_option('Открыть все выходы', 'HC_CayoSettings_Exits', function()
    stats_set('MP'..mp()..'_H4CNF_BS_GEN', -1) -- Входы походу хуй знает
    stats_set('MP'..mp()..'_H4CNF_BS_ENTR', 63) -- Входы походу хуй знает
    stats_set('MP'..mp()..'_H4CNF_APPROACH', -1) -- Входы походу хуй знает
    notify.success('Cayo', 'Выходы открыты')
end)

--- Быстрая настройка ограбления ------------------------------------

Cayo:add_click_option('Быстрая настройка ограбления', 'HC_CayoFast', function()
    clear('PAINT', 'COKE', 'WEED', 'CASH')
    stats_set('MP'..mp()..'_H4_PROGRESS', 131055) -- Сложность (131055 - хард)
    stats_set('MP'..mp()..'_H4CNF_TARGET', 5) -- Главная цель (5 - пантера)
    stats_set('MP'..mp()..'_H4LOOT_GOLD_C', 255) -- Спавн золота
    stats_set('MP'..mp()..'_H4LOOT_GOLD_C_SCOPED', 255) -- Спавн золота
    stats_set('MP'..mp()..'_H4LOOT_GOLD_I', -1) -- Спавн золота (остров)
    stats_set('MP'..mp()..'_H4LOOT_GOLD_I_SCOPED', -1) -- Спавн золота (остров)
    stats_set('MP'..mp()..'_H4LOOT_GOLD_V', 330350) -- Множитель цены золота (330350 - подходит под пантеру и фулл сумку золота)
    stats_set('MP'..mp()..'_H4_MISSIONS', 65535) -- Транспорт (65536 - весь транспорт)
    stats_set('MP'..mp()..'_H4CNF_WEAPONS', 2) -- Оружие (2 - конспиратор)
    stats_set('MP'..mp()..'_H4CNF_UNIFORM', -1) -- Подготовительные
    stats_set('MP'..mp()..'_H4CNF_TROJAN', 5) -- Подготовительные
    stats_set('MP'..mp()..'_H4CNF_ARM_DISRP', 3) -- Подготовительные
    stats_set('MP'..mp()..'_H4CNF_WEP_DISRP', 3) -- Подготовительные
    stats_set('MP'..mp()..'_H4CNF_HEL_DISRP', 3) -- Подготовительные
    stats_set('MP'..mp()..'_H4CNF_GRAPPEL', -1) -- Подготовительные
    stats_set('MP'..mp()..'_H4CNF_BS_GEN', -1) -- Входы походу хуй знает
    stats_set('MP'..mp()..'_H4CNF_BS_ENTR', 63) -- Входы походу хуй знает
    stats_set('MP'..mp()..'_H4CNF_APPROACH', -1) -- Входы походу хуй знает
    notify.success('Cayo', 'Ограбление настроено')
end):setHint('Автоматически выставляет высокий уровень сложности, статую пантеры и золото.')

--- Удалить долю ----------------------------------------------------

Cayo:add_click_option('Удалить долю Павла и команды', 'HC_CayoCut', function()
    script_global:new(262145):at(30268):set_float(0)
    script_global:new(262145):at(30269):set_float(0)
    notify.success('Cayo', 'Доли удалены')
end):setHint('Активировать после начала ограбления.')

--- Мгновенный скип -------------------------------------------------

Cayo:add_click_option('Мгновенно завершить', 'HC_CayoInsta', function()
    if script.exists('fm_mission_controller_2020') then
        script_local:new('fm_mission_controller_2020', 48513 + 1):set_int64(51338752)
        script_local:new('fm_mission_controller_2020', 48513 + 1765 + 1):set_int64(50)
        notify.success('Cayo', 'Ограбление завершено')
    else
        notify.warning('Cayo', 'Ошибка, попробуйте еще раз')
    end
end)

--- Сброс кд --------------------------------------------------------

Cayo:add_choose_option('Сбросить кд ограбления', 'HC_CayoCd', false, {'Соло', 'Мульти'}, function(pos)
    if pos == 1 then
        stats_set('MP'..mp()..'_H4_TARGET_POSIX', 1659643454)
    else
        stats_set('MP'..mp()..'_H4_TARGET_POSIX', 1659429119)
    end
    stats_set('MP'..mp()..'_H4_COOLDOWN', 0)
    stats_set('MP'..mp()..'_H4_COOLDOWN_HARD', 0)
    notify.success('Cayo', 'Кд сброшено, перезайдите в онлайн')
end):setHint('После активации необходимо перезайти в онлайн.')
