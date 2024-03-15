Addons = Submenu.add_static_submenu('Спавнер', 'HC_Addons')
HOME_SUBMENU:add_sub_option('Спавнер', 'HC_Addons', Addons):setHint('Спавнер машин.')

--- Спавн -----------------------------------------------------------

Addons:add_choose_option('Спавн из папки "mods"', 'HC_Addons_Spawn', false, Checked_addons, function (pos)
    notify.success('test', 'Попытка спавна: '..Checked_addons[pos])
    entity.spawn_veh(string.smart_joaat(Checked_addons[pos]), function (entity)
        table.insert(Spawned_addons, 1, entity)
        notify.success('test', 'Успешный спавн')
    end)
end):setHint('Спавн модовой машины из папки "mods".')

--- Спавн по названию -----------------------------------------------

Addons:add_text_input('Спавн по названию', 'HC_Addons_SpawnOnName', function (name)
    notify.success('test', 'Попытка спавна: '..name)
    entity.spawn_veh(string.smart_joaat(name), function (entity)
        table.insert(Spawned_addons, 1, entity)
        notify.success('test', 'Успешный спавн')
    end)
end)

--- Удаление --------------------------------------------------------

Addons:add_click_option('Удалить весь заспавненный транспорт', 'HC_Addons_DelAll', function ()
    for c = 1, #Spawned_addons do
        entity.delete(Spawned_addons[c])
    end
    notify.success('test', 'Успешно удалено: '..#Spawned_addons)
    for c = 1, #Spawned_addons do
        Spawned_addons[c] = nil
    end
end)