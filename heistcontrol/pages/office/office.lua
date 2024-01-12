---------------------------------------------------------------------

local function stats_set_packed(stat, value, slot)
    hash = string.smart_joaat(stat)
    stats.set_packed_stat_bool(hash, value, slot)
end

---------------------------------------------------------------------

Office:add_click_option('Моментально завершить покупку', 'HC_Office_InstBuy', function ()
    script_local:new('gb_contraband_buy', 601 + 5):set_int64(1)
    script_local:new('gb_contraband_buy', 601 + 191):set_int64(6)
    script_local:new('gb_contraband_buy', 601 + 192):set_int64(4)
    notify.success('HC_Office', 'Завершено')
end):setHint('Активировать после начала миссии.')

Office:add_click_option('Моментально завершить продажу', 'HC_Office_InstSell', function ()
    script_local:new('gb_contraband_sell', 543 + 1):set_int64(99999)
    notify.success('HC_Office', 'Завершено')
end):setHint('Активировать после начала миссии.')

Office:add_click_option('Сбросить кд покупки груза', 'HC_Office_CdReset', function ()
    script_global:new(262145):at(15756):set_int64(0)
    notify.success('HC_Office', 'Кд сброшено')
end)

Office:add_click_option('Сбросить кд продажи груза', 'HC_Office_SellCdReset', function ()
    script_global:new(262145):at(15757):set_int64(0)
    notify.success('HC_Office', 'Кд сброшено')
end)
