--- Пополнение сырья ------------------------------------------------

Mc = Submenu.add_static_submenu('Clubhouse', 'HC_Mc')
Bus:add_sub_option('Clubhouse', 'HC_Mc', Mc)

Mc:add_choose_option('Get supplies', 'HC_Mc_Supp', false, McSupp_name, function (pos)
    script_global:new(1662873):at(pos):set_int64(1)
    notify.success('HC_Mc', 'Done')
end)

Mc:add_click_option('Get all supplies', 'HC_Mc_SuppAll', function ()
    for i = 1, 5 do
        script_global:new(1662873):at(i):set_int64(1)
    end
    notify.success('HC_Mc', 'Done')
end)