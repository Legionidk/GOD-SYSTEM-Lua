--- Акты ------------------------------------------------------------

Doomsday = Submenu.add_static_submenu('Doomsday', 'HC_DD')
Heists:add_sub_option('Doomsday', 'HC_Heists_DD', Doomsday)

Doomsday:add_choose_option('Choose act', 'HC_DD_Act', false, DDAct_name, function (pos)
    if pos == 1 then
        stats.set_u32(string.smart_joaat('MP'..mp()..'_GANGOPS_FLOW_MISSION_PROG'), 503)
        stats.set_u32(string.smart_joaat('MP'..mp()..'_GANGOPS_HEIST_STATUS'), 229383)
        stats.set_u32(string.smart_joaat('MP'..mp()..'_GANGOPS_FLOW_NOTIFICATIONS'), 1557)
    elseif pos == 2 then
        stats.set_u32(string.smart_joaat('MP'..mp()..'_GANGOPS_FLOW_MISSION_PROG'), 240)
        stats.set_u32(string.smart_joaat('MP'..mp()..'_GANGOPS_HEIST_STATUS'), 229378)
        stats.set_u32(string.smart_joaat('MP'..mp()..'_GANGOPS_FLOW_NOTIFICATIONS'), 1557)
    else
        stats.set_u32(string.smart_joaat('MP'..mp()..'_GANGOPS_FLOW_MISSION_PROG'), 16368)
        stats.set_u32(string.smart_joaat('MP'..mp()..'_GANGOPS_HEIST_STATUS'), 229380)
        stats.set_u32(string.smart_joaat('MP'..mp()..'_GANGOPS_FLOW_NOTIFICATIONS'), 1557)
    end
    notify.success('Done', 'Done', '')
end)

--- Препы -----------------------------------------------------------

Doomsday:add_choose_option('Preps', 'HC_DD_Preps', false, {'Complete', 'Reset'}, function (pos)
    if pos == 1 then
        stats.set_u32(string.smart_joaat('MP'..mp()..'_GANGOPS_FM_MISSION_PROG'), -1)
    else
        stats.set_u32(string.smart_joaat('MP'..mp()..'_GANGOPS_FLOW_MISSION_PROG'), 240)
        stats.set_u32(string.smart_joaat('MP'..mp()..'_GANGOPS_HEIST_STATUS'), 0)
        stats.set_u32(string.smart_joaat('MP'..mp()..'_GANGOPS_FLOW_NOTIFICATIONS'), 1557)
    end
    notify.success('Done', 'Done', '')
end)