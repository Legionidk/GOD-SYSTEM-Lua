--- Выбор миссии ----------------------------------------------------

Auto = Submenu.add_static_submenu('Auto shop', 'HC_Auto')
Heists:add_sub_option('Auto shop', 'HC_Auto', Auto)

Auto:add_choose_option('Choose contracts', 'HC_Auto_MissionSelect', false, Auto_name, function (pos)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_TUNER_CURRENT'), Auto_val[pos])
    notify.success('Done', 'Done', '')
end):setHint('Changes the already selected contract on the board.', 'contract')

--- Скип подготовительных -------------------------------------------

Auto:add_click_option('Complete preps', 'HC_Auto_SkipPreps', function ()
    if stats.get_u32(string.smart_joaat('MP'..mp()..'_TUNER_CURRENT')) == 1 then
        stats.set_u32(string.smart_joaat('MP'..mp()..'_TUNER_GEN_BS'), 4351)
    else
        stats.set_u32(string.smart_joaat('MP'..mp()..'_TUNER_GEN_BS'), 12543)
    end
    notify.success('Done', 'Done', '')
end)

--- Максимальная выплата --------------------------------------------

-- автор скрипта SilentHy6
-- https://www.unknowncheats.me/forum/grand-theft-auto-v/604599-silent-night.html
Auto:add_click_option('Max payout (2m)', 'HC_Auto_MaxPayout', function ()
    script_global:new(262145):at(31319):set_float(0)
    globals_set_ints(31323 + 1, 31323 + 8, 1, 2000000)
    notify.success('Done', 'Done', '')
end):setHint('Activate after contract starts.', 'after_contract_starts')

--- Мгновенный скип -------------------------------------------------

Auto:add_click_option('Instant finish', 'HC_Auto_Insta', function ()
    if script.exists('fm_mission_controller_2020') then
        script_local:new('fm_mission_controller_2020', 48513 + 1):set_int64(51338977)
        script_local:new('fm_mission_controller_2020', 48513 + 1765 + 1):set_int64(101)
        notify.success('Done', 'Done', '')
    else
        notify.warning('mission_error', 'Error: mission has not started')
    end
end)
