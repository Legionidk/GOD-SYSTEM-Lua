--- Необходимые функции ---------------------------------------------

local function stats_set(stat, value)
    hash = string.smart_joaat(''..stat..'')
    stats.set_u32(hash, value)
end

--- Скип побочек ----------------------------------------------------

Dre = Submenu.add_static_submenu('Агенство', 'HC_Agency')
Heists:add_sub_option('Агенство', 'HC_Agency', Dre)

Dre:add_click_option('Пропустить побочные миссии', 'HC_Dre', function()
    player_index = script_global:new(1574915):get_int64()
    stats_set('MP'..player_index..'_FIXER_STORY_BS', 4092) -- Скип миссий
    stats_set('MP'..player_index..'_FIXER_STORY_STRAND', -1) -- Скип миссий
    notify.success('Dr Dre', 'Миссия успешно открыта')
end):setHint('Пропускает побочные миссии, открывая последнюю («Не шутите с доктором Дре»).')

Dre:add_click_option('Выставить максимальную выплату (2.5кк)', 'HC_Dre_MaxPayout', function()
    script_global:new(262145):at(32071):set_int64(2500000)
    notify.success('Dr Dre', 'Выплата успешно установлена')
end):setHint('Активировать после запуска миссии.')
