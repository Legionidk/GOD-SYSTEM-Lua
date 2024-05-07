Addons = Submenu.add_static_submenu('Mods', 'HC_Addons')
HOME_SUBMENU:add_sub_option('Mods', 'HC_Addons', Addons)

--- Спавн -----------------------------------------------------------

Addons:add_choose_option('Spawn from "mods" folder', 'HC_Addons_Spawn', false, Checked_addons, function (pos)
    if Checked_addons[pos] == 'folder not found' then
        notify.warning('mods_error', "Error: 'mods' folde not found")
    else
        notify.default2('tryspawn', 'Trying spawn: ', Checked_addons[pos])
        entity.spawn_veh(string.smart_joaat(Checked_addons[pos]), function (entity)
            table.insert(Spawned_addons, 1, entity)
            notify.default2('spawned', 'Spawned: ', Checked_addons[pos])
        end)
    end
end)

--- Спавн по названию -----------------------------------------------

Addons:add_text_input('Spawn by name', 'HC_Addons_SpawnByName', function (name)
    notify.default2('tryspawn', 'Trying spawn: ', name)
    entity.spawn_veh(string.smart_joaat(name), function (entity)
        table.insert(Spawned_addons, 1, entity)
        notify.default2('spawned', 'Spawned: ', name)
    end)
end)

--- Удаление --------------------------------------------------------

Addons:add_click_option('Delete all spawned vehicles', 'HC_Addons_DelAll', function ()
    for c = 1, #Spawned_addons do
        entity.delete(Spawned_addons[c])
    end
    notify.default2('trydel', 'Successfully deleted: ', #Spawned_addons)
    for c = 1, #Spawned_addons do
        Spawned_addons[c] = nil
    end
end)