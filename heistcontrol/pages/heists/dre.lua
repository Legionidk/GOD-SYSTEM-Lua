--- Скип побочек ----------------------------------------------------

Dre = Submenu.add_static_submenu('Агенство', 'HC_Agency')
Heists:add_sub_option('Агенство', 'HC_Agency', Dre)

Dre:add_click_option('Выполнить подготовительные', 'HC_Dre', function()
    stats.set_u32(string.smart_joaat('MP'..mp()..'_FIXER_STORY_BS'), 4092)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_FIXER_STORY_STRAND'), -1)
    notify.success('Dr Dre', 'Подготовительные выполнены')
end)

--- Макс выплата ----------------------------------------------------

Dre:add_click_option('Установить максимальную выплату (2.5кк)', 'HC_Dre_MaxPayout', function()
    script_global:new(262145):at(32071):set_int64(2500000)
    notify.success('Dr Dre', 'Выплата успешно установлена')
end):setHint('Активировать после запуска задания.')
