--- Настройка ограбления --------------------------------------------

Casino = Submenu.add_static_submenu('Casino', 'HC_Casino')
Heists:add_sub_option('Casino', 'HC_Casino', Casino)

CasinoSettings = Submenu.add_static_submenu('Heist settings', 'HC_CasinoSettings')
Casino:add_sub_option('Heist settings', 'HC_CasinoSettings', CasinoSettings)

CasinoSettings:add_choose_option('Approach', 'HC_CasinoSettings_Approach', false, CasApproach_name, function (pos)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H3_LAST_APPROACH'), CasApproach_val[pos])
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_APPROACH'), pos)
    notify.success('Casino', 'Done')
end)

CasinoSettings:add_choose_option('Target', 'HC_CasinoSettings_Main', false, CasMain_name, function (pos)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_TARGET'), CasMain_val[pos])
    notify.success('Casino', 'Done')
end)

CasinoSettings:add_choose_option('Gunman', 'HC_CasinoSettings_Gunman', false, CasGunman_name, function (pos)
    if pos == 6 then
        stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_CREWWEAP'), 0)
    else
        stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_CREWWEAP'), pos)
    end
    notify.success('Casino', 'Done')
end)

CasinoSettings:add_choose_option('Driver', 'HC_CasinoSettings_Driver', false, CasDriver_name, function (pos)
    if pos == 6 then
        stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_CREWDRIVER'), 0)
    else
        stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_CREWDRIVER'), pos)
    end
    notify.success('Casino', 'Done')
end)

CasinoSettings:add_choose_option('Hacker', 'HC_CasinoSettings_Hacker', false, CasHacker_name, function (pos)
    if pos == 6 then
        stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_CREWHACKER'), 0)
    else
        stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_CREWHACKER'), pos)
    end
    notify.success('Casino', 'Done')
end)

CasinoSettings:add_click_option('Complete preps', 'HC_CasinoSettings_SkipPreps', function ()
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_DISRUPTSHIP'), 3)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_KEYLEVELS'), 2)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_VEHS'), 3)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_WEAPS'), 0)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_BITSET0'), -1)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_BITSET1'), -1)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_POI'), -1)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_ACCESSPOINTS'), -1)
    notify.success('Casino', 'Done')
end)

--- Быстрая настройка ограбления ------------------------------------

Casino:add_click_option('Fast preset', 'HC_CasinoFast', function ()
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H3_LAST_APPROACH'), 3)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_APPROACH'), 2)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_TARGET'), 3)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_CREWWEAP'), 1)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_CREWDRIVER'), 1)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_CREWHACKER'), 1)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_DISRUPTSHIP'), 3)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_KEYLEVELS'), 2)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_VEHS'), 3)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_WEAPS'), 0)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_BITSET0'), -1)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_BITSET1'), -1)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_POI'), -1)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_ACCESSPOINTS'), -1)
    notify.success('Casino', 'Done')
end)

--- Ресет ограбы ----------------------------------------------------

Casino:add_click_option('Reset heist', 'HC_CasinoSettings_Reset', function ()
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H3_LAST_APPROACH'), 0)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H3_HARD_APPROACH'), 0)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_APPROACH'), 0)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_TARGET'), 0)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_CREWWEAP'), 0)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_CREWDRIVER'), 0)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_CREWHACKER'), 0)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_DISRUPTSHIP'), 0)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_KEYLEVELS'), 0)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_VEHS'), 0)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_WEAPS'), 0)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_BITSET0'), 0)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_BITSET1'), 0)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_POI'), 0)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H3OPT_ACCESSPOINTS'), 0)
    notify.success('Casino', 'Done')
end)
