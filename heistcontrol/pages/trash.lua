Trash = Submenu.add_static_submenu('Другое', 'HC_Stuff_Trash')
HOME_SUBMENU:add_sub_option('Другое', 'HC_Stuff_Trash', Trash)

--- Аддоны ----------------------------------------------------------

Trash:add_choose_option('Спавн аддона', 'HC_Addons_Spawn', false, Checked_addons, function (pos)
    entity.spawn_veh(string.smart_joaat(Checked_addons[pos]))
    table.insert(Spawned_addons, 1, string.smart_joaat(Checked_addons[pos]))
    notify.success('test', 'Попытка спавна: '..Checked_addons[pos])
end):setHint('Если при нажатии ничего не происходит - вы спавните не машину/название модели отличается от названия папки.')

--- Удаленный транспорт ---------------------------------------------

Trash:add_click_option('Разблокировать удаленный транспорт', 'HC_Stuff_ResDelVeh', function ()
    for i = 1, 197 do
        script_global:new(262145):at(Removed_veh[i]):set_int64(1)
    end
    notify.success('Stuff', 'Транспорт разблокирован')
end):setHint('Разблокирует 197 штук ранее удленного из магазинов транспорта.')

--- Премиальные транспорт -------------------------------------------

Trash:add_click_option('Получить премиальный транспорт', 'HC_Stuff_TDMasks', function ()
    stats.set_bool(string.smart_joaat('MP'..mp()..'_CARMEET_PV_CHLLGE_CMPLT'), true)
    stats.set_bool(string.smart_joaat('MP'..mp()..'_CARMEET_PV_CLMED'), false)
    notify.success('Stuff', 'Транспорт получен')
end):setHint('Транспорт за испытание в автоклубе ЛС.')

--- Телепортироваться к оружейному фургону --------------------------

Trash:add_click_option('Телепортироваться к оружейному фургону', 'HC_Stuff_GV', function ()
    utils.teleport(Gunvan_coords[script_global:new(2652572 + 2650 + 1):get_int64()][1],
                    Gunvan_coords[script_global:new(2652572 + 2650 + 1):get_int64()][2],
                    Gunvan_coords[script_global:new(2652572 + 2650 + 1):get_int64()][3])
    notify.success('Stuff', 'Телепортирован')
end)

--- Вызвать хренча --------------------------------------------------

Trash:add_click_option('Вызвать Хренча', 'HC_Stuff_Trash_Gooch', function ()
    script_global:new(2698947):at(3 + 1):set_int64(171)
    script_global:new(2698947):at(2):set_int64(6)
    notify.success('Stuff', 'Хренч вызван')
end)