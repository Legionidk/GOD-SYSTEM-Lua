--- Афк фарм --------------------------------------------------------

Hangar = Submenu.add_static_submenu('Ангар', 'HC_Hangar')
Bus:add_sub_option('Ангар', 'HC_Hangar', Hangar)

Hangar:add_looped_option('Афк фарм ящиков', 'HC_Hangar_Loop', 1, function ()
    stats.set_masked_int(string.smart_joaat('MP'..mp()..'_DLC22022PSTAT_BOOL3'), 1, 9, mp())
end)

--- Моментально завершить -------------------------------------------

Hangar:add_choose_option('Моментально завершить продажу', 'HC_Hangar_InstaFlySell', false, {'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''}, function (pos)
    script_global:new(262145):at(23003):set_float(0)
    script_local:new('gb_smuggler', 1932 + 1078):set_int64(pos)
    script_local:new('gb_smuggler', 2700):set_int64(-1)
end):setHint('Работает только для миссий по воздуху. Перед активацией выбрать количество транспорта в миссии доставки.')
