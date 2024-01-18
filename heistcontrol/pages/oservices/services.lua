--- ПКП -------------------------------------------------------------

Services:add_click_option('Вызвать ПКП', 'HC_Stuff_PKP', function ()
    script_global:new(2738587):at(930):set_int64(1)
    notify.success('Stuff', 'ПКП вызван')
end)

--- Авенгер ---------------------------------------------------------

Services:add_click_option('Вызвать Avenger', 'HC_Stuff_Avenger', function ()
    script_global:new(2738587):at(938):set_int64(1)
    notify.success('Stuff', 'Avenger вызван')
end)

--- Террорбайт ------------------------------------------------------

Services:add_click_option('Вызвать TerrorByte', 'HC_Stuff_TerrorByte', function ()
    script_global:new(2738587):at(943):set_int64(1)
    notify.success('Stuff', 'TerrorByte вызван')
end)

--- Косатка ---------------------------------------------------------

Services:add_click_option('Вызвать Косатку', 'HC_Stuff_Kosatka', function ()
    script_global:new(2738587):at(960):set_int64(1)
    notify.success('Stuff', 'Косатка вызвана')
end)
