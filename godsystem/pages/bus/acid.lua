--- Вызовы ----------------------------------------------------------

Acid = Submenu.add_static_submenu('Acid Lab', 'HC_AcidLab')
Bus:add_sub_option('Acid Lab', 'HC_AcidLab', Acid)

Acid:add_choose_option('Request', 'HC_Acid_Req', false, {'Acid Lab', 'Delivery Bike'}, function (pos)
    if pos == 1 then
        script_global:new(2738587):at(944):set_int64(1)
        notify.success('Done', 'Done', '')
    else
        script_global:new(2738587):at(994):set_int64(1)
        notify.success('Done', 'Done', '')
    end
end)

--- Пополнение сырья ------------------------------------------------

Acid:add_click_option('Get supplies', 'HC_Acid_InstResupply', function ()
    script_global:new(1662873):at(7):set_int64(1)
    notify.success('Done', 'Done', '')
end)