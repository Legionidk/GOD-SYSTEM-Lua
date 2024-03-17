--- Акты ------------------------------------------------------------

Doomsday = Submenu.add_static_submenu('Судный день', 'HC_DD')
Heists:add_sub_option('Судный день', 'HC_Heists_DD', Doomsday)

Doomsday:add_choose_option('Выбрать акт', 'HC_DD_Act', false, DDAct_name, function (pos)
    if pos == 1 then
        stats.set_u32(string.smart_joaat('MP'..mp()..'_GANGOPS_FLOW_MISSION_PROG'), 503)
        stats.set_u32(string.smart_joaat('MP'..mp()..'_GANGOPS_HEIST_STATUS'), 229383)
        stats.set_u32(string.smart_joaat('MP'..mp()..'_GANGOPS_FLOW_NOTIFICATIONS'), 1557)
        notify.success('HC_DD', 'Успешно')
    elseif pos == 2 then
        stats.set_u32(string.smart_joaat('MP'..mp()..'_GANGOPS_FLOW_MISSION_PROG'), 240)
        stats.set_u32(string.smart_joaat('MP'..mp()..'_GANGOPS_HEIST_STATUS'), 229378)
        stats.set_u32(string.smart_joaat('MP'..mp()..'_GANGOPS_FLOW_NOTIFICATIONS'), 1557)
        notify.success('HC_DD', 'Успешно')
    else
        stats.set_u32(string.smart_joaat('MP'..mp()..'_GANGOPS_FLOW_MISSION_PROG'), 16368)
        stats.set_u32(string.smart_joaat('MP'..mp()..'_GANGOPS_HEIST_STATUS'), 229380)
        stats.set_u32(string.smart_joaat('MP'..mp()..'_GANGOPS_FLOW_NOTIFICATIONS'), 1557)
        notify.success('HC_DD', 'Успешно')
    end
end)

--- Препы -----------------------------------------------------------

Doomsday:add_click_option('Выполнить подготовительные', 'HC_DD_Preps', function ()
    stats.set_u32(string.smart_joaat('MP'..mp()..'_GANGOPS_FM_MISSION_PROG'), -1)
    notify.success('HC_DD', 'Успешно')
end)

Doomsday:add_click_option('Сбросить сценарий', 'HC_DD_Preps', function ()
    stats.set_u32(string.smart_joaat('MP'..mp()..'_GANGOPS_FLOW_MISSION_PROG'), 240)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_GANGOPS_HEIST_STATUS'), 0)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_GANGOPS_FLOW_NOTIFICATIONS'), 1557)
    notify.success('HC_DD', 'Успешно')
end)