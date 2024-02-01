--- Акты ------------------------------------------------------------

Doomsday = Submenu.add_static_submenu('Судный день', 'HC_DD')
Heists:add_sub_option('Судный день', 'HC_Heists_DD', Doomsday)

Doomsday:add_choose_option('Выбрать акт', 'HC_DD_Act', false, {'Утечка данных', 'Операция "Богдан"', 'Сценарий "Судного дня"'}, function (pos)
    if pos == 1 then
        stats.set_u32(string.smart_joaat('MP'..mp()..'_GANGOPS_FLOW_MISSION_PROG'), 503)
        stats.set_u32(string.smart_joaat('MP'..mp()..'_GANGOPS_HEIST_STATUS'), 229383)
        stats.set_u32(string.smart_joaat('MP'..mp()..'_GANGOPS_FLOW_NOTIFICATIONS'), 1557)
        notify.success('HC_DD', 'Успешно выбрано: '..DDAct_name[pos])
    elseif pos == 2 then
        stats.set_u32(string.smart_joaat('MP'..mp()..'_GANGOPS_FLOW_MISSION_PROG'), 240)
        stats.set_u32(string.smart_joaat('MP'..mp()..'_GANGOPS_HEIST_STATUS'), 229378)
        stats.set_u32(string.smart_joaat('MP'..mp()..'_GANGOPS_FLOW_NOTIFICATIONS'), 1557)
        notify.success('HC_DD', 'Успешно выбрано: '..DDAct_name[pos])
    else
        stats.set_u32(string.smart_joaat('MP'..mp()..'_GANGOPS_FLOW_MISSION_PROG'), 16368)
        stats.set_u32(string.smart_joaat('MP'..mp()..'_GANGOPS_HEIST_STATUS'), 229380)
        stats.set_u32(string.smart_joaat('MP'..mp()..'_GANGOPS_FLOW_NOTIFICATIONS'), 1557)
        notify.success('HC_DD', 'Успешно выбрано: '..DDAct_name[pos])
    end
end)

--- Препы -----------------------------------------------------------

Doomsday:add_click_option('Выполнить подготовительные', 'HC_DD_Preps', function ()
    stats.set_u32(string.smart_joaat('MP'..mp()..'_GANGOPS_FM_MISSION_PROG'), -1)
    notify.success('HC_DD', 'Подготовительные выполнены')
end)

Doomsday:add_click_option('Сбросить сценарий', 'HC_DD_Preps', function ()
    stats.set_u32(string.smart_joaat('MP'..mp()..'_GANGOPS_FLOW_MISSION_PROG'), 240)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_GANGOPS_HEIST_STATUS'), 0)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_GANGOPS_FLOW_NOTIFICATIONS'), 1557)
    notify.success('HC_DD', 'Сценарий сброшен')
end)

--- Инста -----------------------------------------------------------

-- Doomsday:add_click_option('Моментально завершить', 'HC_DD_Insta', function ()
--     if script.exists('fm_mission_controller') then
--         script_local:new('fm_mission_controller', 19728 + 12):set_int64(12)
--         script_local:new('fm_mission_controller', 19728 + 2686):set_int64(10000000)
--         script_local:new('fm_mission_controller', 28347 + 1):set_int64(99999)
--         script_local:new('fm_mission_controller', 31603 + 69):set_int64(99999)
--         notify.success('HC_DD', 'Ограбление завершено')
--     else
--         notify.fatal('HC_DD', 'Ошибка, попробуйте еще раз')
--     end
-- end)
