Trash = Submenu.add_static_submenu('Мусор', 'HC_Stuff_Trash')
HOME_SUBMENU:add_sub_option('Мусор', 'HC_Stuff_Trash', Trash):setHint('Юзлесс хуета для прикола.')

--- Вызвать хренча --------------------------------------------------

Trash:add_click_option('Вызвать Хренча', 'HC_Stuff_Trash_Gooch', function ()
    script_global:new(2698947):at(3 + 1):set_int64(171)
    script_global:new(2698947):at(2):set_int64(6)
    notify.success('Stuff', 'Хренч вызван')
end)