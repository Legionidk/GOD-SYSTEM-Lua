Acid = Submenu.add_static_submenu('Кислотная лаборатория', 'HC_AcidLab')
HOME_SUBMENU:add_sub_option('Кислотная лаборатория', 'HC_AcidLab', Acid)

--- Пополнение сырья ------------------------------------------------

Acid:add_click_option('Пополнить сырье', 'HC_Acid_InstResupply', function ()
    script_global:new(1662873):at(7):set_int64(1)
    notify.success('Acid', 'Сырье пополнено')
end):setHint('Бесплатно.')
