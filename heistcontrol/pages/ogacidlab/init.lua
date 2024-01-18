Acid = Submenu.add_static_submenu('Кислотная лаборатория', 'HC_AcidLab')
HOME_SUBMENU:add_sub_option('Кислотная лаборатория', 'HC_AcidLab', Acid)

--- Пополнение сырья ------------------------------------------------

Acid:add_click_option('Пополнить сырье', 'HC_Acid_InstResupply', function ()
    script_global:new(1662873):at(7):set_int64(1)
    notify.success('Acid', 'Сырье пополнено')
end)

--- Кислотка --------------------------------------------------------

Acid:add_click_option('Вызвать кислотную лабораторию', 'HC_Stuff_AcidReq', function ()
    script_global:new(2738587):at(944):set_int64(1)
    notify.success('Stuff', 'Кислотная лаборатория вызвана')
end)

--- Мотоцикл кислотки -----------------------------------------------

Acid:add_click_option('Вызвать мотоцикл кислотной лаборатории', 'HC_Stuff_AcidMotoReq', function ()
    script_global:new(2738587):at(994):set_int64(1)
    notify.success('Stuff', 'Мотоцикл кислотной лаборатории вызван')
end)