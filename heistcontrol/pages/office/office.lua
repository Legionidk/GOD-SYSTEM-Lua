--- Луп ящиков -------------------------------------------------

Office:add_looped_option('Афк фарм ящиков', 'HC_Office_Afk', 1, function ()
    stat = 'MP'..local_player()..'_FIXERPSTAT_BOOL1'
    hash = string.smart_joaat(stat)
    for i = 12, 16 do
        stats.set_masked_int(hash, 1, i, local_player())
    end
end, function ()
    notify.success('HC_Office', 'Фарм выключен')
end)

--- Моментальная покупка --------------------------------------------

Office:add_click_option('Моментально завершить покупку', 'HC_Office_InstBuy', function ()
    script_local:new('gb_contraband_buy', 601 + 5):set_int64(1)
    script_local:new('gb_contraband_buy', 601 + 191):set_int64(6)
    script_local:new('gb_contraband_buy', 601 + 192):set_int64(4)
    notify.success('HC_Office', 'Покупка завершена')
end):setHint('Активировать после начала задания.')

--- Моментальная продажа --------------------------------------------

Office:add_click_option('Моментально завершить продажу', 'HC_Office_InstSell', function ()
    script_local:new('gb_contraband_sell', 543 + 1):set_int64(99999)
    notify.success('HC_Office', 'Продажа завершена')
end):setHint('Активировать после начала задания.')

--- Удалить кд покупки ----------------------------------------------

Office:add_click_option('Удалить кд покупки', 'HC_Office_CdReset', function ()
    script_global:new(262145):at(15756):set_int64(0)
    notify.success('HC_Office', 'Кд удалено')
end)

--- Удалить кд продажи ----------------------------------------------

Office:add_click_option('Удалить кд продажи', 'HC_Office_SellCdReset', function ()
    script_global:new(262145):at(15757):set_int64(0)
    notify.success('HC_Office', 'Кд удалено')
end)