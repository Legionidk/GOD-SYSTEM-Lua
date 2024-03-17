--- Пополнение сырья ------------------------------------------------

Mc = Submenu.add_static_submenu('Мотоклуб', 'HC_Mc')
Bus:add_sub_option('Мотоклуб', 'HC_Mc', Mc)

Mc:add_choose_option('Пополнить сырье', 'HC_Mc_Supp', false, McSupp_name, function (pos)
    script_global:new(1662873):at(pos):set_int64(1)
    notify.success('HC_Mc', 'Успешно')
end)

Mc:add_click_option('Пополнить все сырье', 'HC_Mc_SuppAll', function ()
    for i = 1, 5 do
        script_global:new(1662873):at(i):set_int64(1)
    end
    notify.success('HC_Mc', 'Успешно')
end)