--- Пополнение сырья ------------------------------------------------

Acid = Submenu.add_static_submenu('Кислотная лаборатория', 'HC_AcidLab')
Bus:add_sub_option('Кислотная лаборатория', 'HC_AcidLab', Acid)

Acid:add_click_option('Пополнить сырье', 'HC_Acid_InstResupply', function ()
    script_global:new(1662873):at(7):set_int64(1)
    notify.success('Acid', 'Сырье пополнено')
end)

--- Вызовы --------------------------------------------------------

Acid:add_choose_option('Вызвать', 'HC_Acid_Req', false, {'Кислотную лабораторию', 'Мотоцикл кислотной лаборатории'}, function (pos)
    if pos == 1 then
        script_global:new(2738587):at(944):set_int64(1)
        notify.success('Stuff', 'Кислотная лаборатория вызвана')
    else
        script_global:new(2738587):at(994):set_int64(1)
        notify.success('Stuff', 'Мотоцикл кислотной лаборатории вызван')
    end
end)
