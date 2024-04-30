--- Настройка ограбления --------------------------------------------

Cayo = Submenu.add_static_submenu('Cayo-Perico', 'HC_Cayo')
Heists:add_sub_option('Cayo-Perico', 'HC_Cayo', Cayo)

CayoSettings = Submenu.add_static_submenu('Heist settings', 'HC_CayoSettings')
Cayo:add_sub_option('Heist settings', 'HC_CayoSettings', CayoSettings)

CayoSettings:add_choose_option('Difficulty', 'HC_CayoSettings_Difficulty', false, CayoDiff_name, function (pos)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H4_PROGRESS'), CayoDiff_val[pos])
    script_local:new('heist_island_planning', 1544):set_int64(2)
    notify.success('Cayo', 'Done')
end)

CayoSettings:add_choose_option('Target', 'HC_CayoSettings_Main', false, CayoMain_name, function (pos)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H4CNF_TARGET'), CayoMain_val[pos])
    script_local:new('heist_island_planning', 1544):set_int64(2)
    notify.success('Cayo', 'Done')
end)

CayoSettings:add_choose_option('Island and compound', 'HC_CayoSettings_Second', false, CayoSec_name,
function (pos)
    if pos == 1 then
        clear('PAINT', 'COKE', 'WEED', 'CASH')
        stats.set_u32(string.smart_joaat('MP'..mp()..'_H4LOOT_GOLD_C'), 255)
        stats.set_u32(string.smart_joaat('MP'..mp()..'_H4LOOT_GOLD_C_SCOPED'), 255)
        stats.set_u32(string.smart_joaat('MP'..mp()..'_H4LOOT_GOLD_I'), -1)
        stats.set_u32(string.smart_joaat('MP'..mp()..'_H4LOOT_GOLD_I_SCOPED'), -1)
        stats.set_u32(string.smart_joaat('MP'..mp()..'_H4LOOT_GOLD_V'), 330350)
    elseif pos == 2 then
        clear('GOLD', 'COKE', 'WEED', 'CASH')
        stats.set_u32(string.smart_joaat('MP'..mp()..'_H4LOOT_PAINT'), -1)
        stats.set_u32(string.smart_joaat('MP'..mp()..'_H4LOOT_PAINT_SCOPED'), -1)
        stats.set_u32(string.smart_joaat('MP'..mp()..'_H4LOOT_PAINT_V'), 403500)
    elseif pos == 3 then
        clear('PAINT', 'GOLD', 'WEED', 'CASH')
        stats.set_u32(string.smart_joaat('MP'..mp()..'_H4LOOT_COKE_C'), -1)
        stats.set_u32(string.smart_joaat('MP'..mp()..'_H4LOOT_COKE_C_SCOPED'), -1)
        stats.set_u32(string.smart_joaat('MP'..mp()..'_H4LOOT_COKE_I'), -1)
        stats.set_u32(string.smart_joaat('MP'..mp()..'_H4LOOT_COKE_I_SCOPED'), -1)
        stats.set_u32(string.smart_joaat('MP'..mp()..'_H4LOOT_COKE_V'), 330350)
    elseif pos == 4 then
        clear( 'PAINT', 'GOLD', 'COKE', 'CASH')
        stats.set_u32(string.smart_joaat('MP'..mp()..'_H4LOOT_WEED_C'), -1)
        stats.set_u32(string.smart_joaat('MP'..mp()..'_H4LOOT_WEED_C_SCOPED'), -1)
        stats.set_u32(string.smart_joaat('MP'..mp()..'_H4LOOT_WEED_I'), -1)
        stats.set_u32(string.smart_joaat('MP'..mp()..'_H4LOOT_WEED_I_SCOPED'), -1)
        stats.set_u32(string.smart_joaat('MP'..mp()..'_H4LOOT_WEED_V'), 330350)
    elseif pos == 5 then
        clear( 'PAINT', 'GOLD', 'COKE', 'WEED')
        stats.set_u32(string.smart_joaat('MP'..mp()..'_H4LOOT_CASH_C'), -1)
        stats.set_u32(string.smart_joaat('MP'..mp()..'_H4LOOT_CASH_C_SCOPED'), -1)
        stats.set_u32(string.smart_joaat('MP'..mp()..'_H4LOOT_CASH_I'), -1)
        stats.set_u32(string.smart_joaat('MP'..mp()..'_H4LOOT_CASH_I_SCOPED'), -1)
        stats.set_u32(string.smart_joaat('MP'..mp()..'_H4LOOT_CASH_V'), 330350)
    end
    script_local:new('heist_island_planning', 1544):set_int64(2)
    notify.success('Cayo', 'Done')
end)

CayoSettings:add_choose_option('Guns', 'HC_CayoSettings_Guns', false, CayoGuns_name,
function (pos)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H4CNF_WEAPONS'), CayoGuns_val[pos])
    script_local:new('heist_island_planning', 1544):set_int64(2)
    notify.success('Cayo', 'Done')
end)

CayoSettings:add_click_option('Complete preps', 'HC_CayoSettings_Preps', function()
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H4_MISSIONS'), 65535)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H4CNF_UNIFORM'), -1)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H4CNF_TROJAN'), 5)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H4CNF_ARM_DISRP'), 3)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H4CNF_WEP_DISRP'), 3)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H4CNF_HEL_DISRP'), 3)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H4CNF_GRAPPEL'), -1)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H4CNF_BS_GEN'), -1)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H4CNF_BS_ENTR'), 63)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H4CNF_APPROACH'), -1)
    script_local:new('heist_island_planning', 1544):set_int64(2)
    notify.success('Cayo', 'Done')
end)

--- Быстрая настройка ограбления ------------------------------------

Cayo:add_click_option('Fast preset', 'HC_CayoFast', function()
    clear('PAINT', 'COKE', 'WEED', 'CASH')
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H4_PROGRESS'), 131055)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H4CNF_TARGET'), 5)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H4LOOT_GOLD_C'), 255)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H4LOOT_GOLD_C_SCOPED'), 255)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H4LOOT_GOLD_I'), -1)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H4LOOT_GOLD_I_SCOPED'), -1)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H4LOOT_GOLD_V'), 330350)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H4_MISSIONS'), 65535)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H4CNF_WEAPONS'), 2)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H4CNF_UNIFORM'), -1)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H4CNF_TROJAN'), 5)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H4CNF_ARM_DISRP'), 3)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H4CNF_WEP_DISRP'), 3)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H4CNF_HEL_DISRP'), 3)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H4CNF_GRAPPEL'), -1)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H4CNF_BS_GEN'), -1)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H4CNF_BS_ENTR'), 63)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H4CNF_APPROACH'), -1)
    script_local:new('heist_island_planning', 1544):set_int64(2)
    notify.success('Cayo', 'Done')
end)

--- Удалить долю ----------------------------------------------------

Cayo:add_click_option('Remove cuts of Pavel and team', 'HC_CayoCut', function()
    script_global:new(262145):at(30268):set_int64(0)
    script_global:new(262145):at(30269):set_int64(0)
    script_local:new('heist_island_planning', 1544):set_int64(2)
    notify.success('Cayo', 'Done')
end):setHint('Activate after heist starts.')

--- Мгновенный скип -------------------------------------------------

Cayo:add_click_option('Instant finish', 'HC_CayoInsta', function()
    if script.exists('fm_mission_controller_2020') then
        script_local:new('fm_mission_controller_2020', 48513):set_int64(9)
        script_local:new('fm_mission_controller_2020', 48513 + 1765 + 1):set_int64(50)
        script_local:new('heist_island_planning', 1544):set_int64(2)
        notify.success('Cayo', 'Done')
    else
        notify.warning('Cayo', 'Error: heist has not started')
    end
end)

--- Сброс ограбления ------------------------------------------------

Cayo:add_click_option('Reset heist', 'HC_CayoReset', function()
    clear('PAINT', 'COKE', 'WEED', 'CASH')
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H4_PROGRESS'), 0)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H4CNF_TARGET'), 0)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H4LOOT_GOLD_C'), 0)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H4LOOT_GOLD_C_SCOPED'), 0)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H4LOOT_GOLD_I'), 0)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H4LOOT_GOLD_I_SCOPED'), 0)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H4LOOT_GOLD_V'), 0)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H4_MISSIONS'), 0)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H4CNF_WEAPONS'), 0)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H4CNF_UNIFORM'), 0)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H4CNF_TROJAN'), 0)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H4CNF_ARM_DISRP'), 0)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H4CNF_WEP_DISRP'), 0)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H4CNF_HEL_DISRP'), 0)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H4CNF_GRAPPEL'), 0)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H4CNF_BS_GEN'), 0)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H4CNF_BS_ENTR'), 0)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H4CNF_APPROACH'), 0)
    script_local:new('heist_island_planning', 1544):set_int64(2)
    notify.success('Cayo', 'Done')
end)

--- Сброс кд --------------------------------------------------------

Cayo:add_choose_option('Reset cooldown', 'HC_CayoCd', false, {'After solo', 'After with other players'}, function(pos)
    if pos == 1 then
        stats.set_u32(string.smart_joaat('MP'..mp()..'_H4_TARGET_POSIX'), 1659643454)
    else
        stats.set_u32(string.smart_joaat('MP'..mp()..'_H4_TARGET_POSIX'), 1659429119)
    end
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H4_COOLDOWN'), 0)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_H4_COOLDOWN_HARD'), 0)
    notify.success('Cayo', 'Done')
end):setHint('After activation, reconnect to the online.')
