Trash = Submenu.add_static_submenu('Другое', 'HC_Stuff_Trash')
HOME_SUBMENU:add_sub_option('Другое', 'HC_Stuff_Trash', Trash)

--- Вызвать хренча --------------------------------------------------

Trash:add_click_option('Вызвать Хренча', 'HC_Stuff_Trash_Gooch', function ()
    script_global:new(2698947):at(3 + 1):set_int64(171)
    script_global:new(2698947):at(2):set_int64(6)
    notify.success('Stuff', 'Хренч вызван')
end)

--- Премиальные транспорт -------------------------------------------

Trash:add_click_option('Получить премиальный транспорт', 'HC_Stuff_TDMasks', function ()
    stats.set_bool(string.smart_joaat('MP'..mp()..'_CARMEET_PV_CHLLGE_CMPLT'), true)
    stats.set_bool(string.smart_joaat('MP'..mp()..'_CARMEET_PV_CLMED'), false)
    notify.success('Stuff', 'Транспорт получен')
end):setHint('Транспорт за испытание в автоклубе ЛС.')

--- Телепортироваться к оружейному фургону --------------------------

Trash:add_click_option('Телепортироваться к оружейному фургону', 'HC_Stuff_GV', function ()
    location = script_global:new(2652572 + 2650 + 1):get_int64()
    utils.teleport(Gunvan_coords[script_global:new(2652572 + 2650 + 1):get_int64()][1],
                    Gunvan_coords[script_global:new(2652572 + 2650 + 1):get_int64()][2],
                    Gunvan_coords[script_global:new(2652572 + 2650 + 1):get_int64()][3])
    notify.success('Stuff', 'Телепортирован')
end)