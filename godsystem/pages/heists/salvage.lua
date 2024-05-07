--- Удалить стоимость подготовки ------------------------------------

Salvage = Submenu.add_static_submenu('Salvage', 'HC_Salvage')
Heists:add_sub_option('Salvage', 'HC_Salvage', Salvage)

Salvage:add_click_option('Free setup', 'HC_Salvage_DelCost', function ()
    script_global:new(262145):at(36063):set_int64(0)
    notify.success('Done', 'Done', '')
end)

--- Подготовительные ------------------------------------------------

Salvage:add_choose_option('Preps', 'HC_Salvage_Preps', false, {'Complete', 'Reset'}, function (pos)
    if pos == 1 then
        stats.set_u32(string.smart_joaat('MP'..mp()..'_SALV23_GEN_BS'), -1)
        stats.set_u32(string.smart_joaat('MP'..mp()..'_SALV23_SCOPE_BS'), -1)
        stats.set_u32(string.smart_joaat('MP'..mp()..'_SALV23_FM_PROG'), -1)
        stats.set_u32(string.smart_joaat('MP'..mp()..'_SALV23_INST_PROG'), -1)
    else
        stats.set_u32(string.smart_joaat('MP'..mp()..'_SALV23_GEN_BS'), -1)
        stats.set_u32(string.smart_joaat('MP'..mp()..'_SALV23_SCOPE_BS'), 6)
        stats.set_u32(string.smart_joaat('MP'..mp()..'_SALV23_FM_PROG'), 0)
        stats.set_u32(string.smart_joaat('MP'..mp()..'_SALV23_INST_PROG'), 0)
    end
    notify.success('Done', 'Done', '')
end)