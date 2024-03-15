--- Удалить стоимость подготовки ------------------------------------

Salvage = Submenu.add_static_submenu('Утиль. цех', 'HC_Salvage')
Heists:add_sub_option('Утиль. цех', 'HC_Salvage', Salvage)

Salvage:add_click_option('Удалить стоимость подготовки', 'HC_Salvage_DelCost', function ()
    script_global:new(262145):at(36063):set_int64(0)
    notify.success('HC_Salvage', 'Стоимость удалена')
end)

--- Подготовительные ------------------------------------------------

Salvage:add_choose_option('Подготовительные', 'HC_Salvage_Preps', false, {'Выполнить', 'Сбросить'}, function (pos)
    if pos == 1 then
        stats.set_u32(string.smart_joaat('MP'..mp()..'_SALV23_GEN_BS'), -1)
        stats.set_u32(string.smart_joaat('MP'..mp()..'_SALV23_SCOPE_BS'), -1)
        stats.set_u32(string.smart_joaat('MP'..mp()..'_SALV23_FM_PROG'), -1)
        stats.set_u32(string.smart_joaat('MP'..mp()..'_SALV23_INST_PROG'), -1)
        notify.success('HC_Salvage', 'Подготовительные выполнены')
    else
        stats.set_u32(string.smart_joaat('MP'..mp()..'_SALV23_GEN_BS'), -1)
        stats.set_u32(string.smart_joaat('MP'..mp()..'_SALV23_SCOPE_BS'), 6)
        stats.set_u32(string.smart_joaat('MP'..mp()..'_SALV23_FM_PROG'), 0)
        stats.set_u32(string.smart_joaat('MP'..mp()..'_SALV23_INST_PROG'), 0)
        notify.success('HC_Salvage', 'Подготовительные сброшены')
    end
end)