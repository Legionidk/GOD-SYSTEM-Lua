--- Афк фарм --------------------------------------------------------

Hangar = Submenu.add_static_submenu('Ангар', 'HC_Hangar')
Bus:add_sub_option('Ангар', 'HC_Hangar', Hangar)

Hangar:add_looped_option('Афк фарм ящиков', 'HC_Hangar_Loop', 1, function ()
    stats.set_masked_int(string.smart_joaat('MP'..mp()..'_DLC22022PSTAT_BOOL3'), 1, 9, mp())
end, function ()
    notify.success('text', 'Фарм выключен')
end)

--- Моментально завершить -------------------------------------------

Hangar:add_choose_option('Моментально завершить продажу', 'HC_Hangar_InstaFlySell', false, {'1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16'}, function (pos)
    if script.exists('gb_smuggler') then
        script_global:new(262145):at(23003):set_float(0)
        script_local:new('gb_smuggler', 1932 + 1078):set_int64(pos)
        script_local:new('gb_smuggler', 2700):set_int64(-1)
        notify.warning('HC_Hangar', 'Успешно')
    else
        notify.warning('HC_Hangar', 'Ошибка: миссия не запущена')
    end
end):setHint('Работает только для миссий по воздуху. Перед активацией необходимо выбрать количество транспорта в миссии доставки.')