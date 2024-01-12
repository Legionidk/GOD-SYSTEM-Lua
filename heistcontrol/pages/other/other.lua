---------------------------------------------------------------------

local function stats_set(stat, value)
    hash = string.smart_joaat(''..stat..'')
    stats.set_u32(hash, value)
end

--- Кислотная лаборатория -------------------------------------------

Acid = Submenu.add_static_submenu('Кислотная лаборатория', 'HC_Stuff_Acid')
Other:add_sub_option('Кислотная лаборатория', 'HC_Stuff_Acid', Acid)

Acid:add_click_option('Вызвать лабораторию', 'HC_Stuff_Acid_Req', function ()
    script_global:new(2738587):at(944):set_int64(1)
    notify.success('Acid', 'Вызвано')
end)

Acid:add_click_option('Вызвать мотоцикл', 'HC_Stuff_Acid_Req', function ()
    script_global:new(2738587):at(994):set_int64(1)
    notify.success('Acid', 'Вызвано')
end)

Acid:add_click_option('Пополнить сырье', 'HC_Stuff_Acid_InstResupply', function ()
    script_global:new(1662873):at(7):set_int64(1)
    notify.success('Acid', 'Сырье пополнено')
end):setHint('Бесплатно.')

--- Казино ---------------------------------------------

Casino = Submenu.add_static_submenu('Фишки', 'HC_Stuff_Casino')
Other:add_sub_option('Фишки', 'HC_Stuff_Casino', Casino)

-- Casino:add_choose_option('Дроп в колесе удачи', 'HC_Stuff_LW', false, {'Машина', 'Тайный предмет', 'Одежда', 'Фишки', 'Деньги', 'РП', 'Скидка'}, function(pos)
--     drop_name = {
--         [1] = 'Машина',
--         [2] = 'Тайный предмет',
--         [3] = 'Одежда',
--         [4] = 'Фишки',
--         [5] = 'Деньги',
--         [6] = 'РП',
--         [7] = 'Скидка'
--     }
--     drop_id = {
--         [1] = 18,
--         [2] = 11,
--         [3] = 16,
--         [4] = 15,
--         [5] = 19,
--         [6] = 17,
--         [7] = 4
--     }
--     script_local:new('casino_lucky_wheel', 278 + 14):set_int64(drop_id[pos])
--     notify.success('Stuff', 'Успешно выбрано: '..drop_name[pos])
-- end)

Casino:add_num_option('Лимит покупки фишек', 'HC_Stuff_ChipsLim', 100000, 2000000, 100000, function(val)
    script_global:new(262145):at(27238):set_int64(val)
end)

Casino:add_click_option('Сброс кд покупки фишек', 'HC_Stuff_ResetCdChips', function()
    stats_set('MPPLY_CASINO_CHIPS_PUR_GD', 0)
    stats_set('MPPLY_CASINO_CHIPS_PURTIM', 0)
    notify.success('Stuff', 'Кд сброшено')
end)
