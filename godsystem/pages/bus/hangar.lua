--- Афк фарм --------------------------------------------------------

Hangar = Submenu.add_static_submenu('Hangar', 'HC_Hangar')
Bus:add_sub_option('Hangar', 'HC_Hangar', Hangar)

Hangar:add_looped_option('Cargo loop', 'HC_Hangar_Loop', 1, function ()
    stats.set_masked_int(string.smart_joaat('MP'..mp()..'_DLC22022PSTAT_BOOL3'), 1, 9, mp())
end, function ()
    notify.success('farm', 'Loop off', '')
end)

--- Моментально завершить -------------------------------------------

Hangar:add_choose_option('Instant sell', 'HC_Hangar_InstaFlySell', false, {'1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16'}, function (pos)
    if script.exists('gb_smuggler') then
        script_global:new(262145):at(23003):set_float(0)
        script_local:new('gb_smuggler', 1932 + 1078):set_int64(pos)
        script_local:new('gb_smuggler', 2700):set_int64(-1)
        notify.warning('Done', 'Done')
    else
        notify.warning('mission_error', 'Error: mission has not started')
    end
end):setHint('Instantly completes the air mission. Before activation, you must select the number of vehicles in the mission.', 'hangar_insta')