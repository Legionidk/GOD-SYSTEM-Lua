-- Spawner page
local spawner = Main_page:new_subpage('SPAWNER')

local spawner_spawnfrommods = spawner:new_group("Spawn from 'mods' folder", GroupRect.TITLE)
local spawner_spawnedvehs = spawner:new_group('Spawned vehicles', GroupRect.BODY)
local spawner_spawnbyname = spawner:new_group('Spawn by name', GroupRect.TITLE)

-- Spawn by name
local spawner_spawnbyname_input = spawner_spawnbyname:new_input('Model name')
local spawner_spawnbyname_spawn = spawner_spawnbyname:new_button('Spawn', function ()
    if spawner_spawnbyname_input:get() == '' then
        ui.popup('GOD SYSTEM', "Can't spawn nothing!", Icons.CANCEL2, PopupType.BOX)
    else
        vehicle.spawn(spawner_spawnbyname_input:get(), function (veh)
            ui.popup('GOD SYSTEM', 'Spawned successfully: '..spawner_spawnbyname_input:get()..'.', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
            table.insert(Spawned_veh_handle, 1, veh)
            table.insert(Spawned_veh, 1, spawner_spawnbyname_input:get())
        end)
    end
end)

-- Spawn from 'mods' folder
local spawner_spawnfrommods_list = spawner_spawnfrommods:new_table_list("'mods' folder", Mods_list)
spawner_spawnfrommods_list:set_click_callback(function (item)
    vehicle.spawn(Mods_list[item], function (veh)
        ui.popup('GOD SYSTEM', 'Spawned successfully: '..Mods_list[item]..'.', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
        table.insert(Spawned_veh_handle, 1, veh)
        table.insert(Spawned_veh, 1, Mods_list[item])
    end)
end)

-- Spawned vehicles
local spawner_spawnedvehs_list = spawner_spawnedvehs:new_table_list('Spawned vehicles', Spawned_veh)
spawner_spawnedvehs_list:set_click_callback(function (item)
    entity.delete(Spawned_veh_handle[item], function ()
        ui.popup('GOD SYSTEM', 'Failed to delete.', Icons.CANCEL2, PopupType.BOX)
    end, function ()
        ui.popup('GOD SYSTEM', 'Deleted successfully.', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
    end)
    Spawned_veh[item], Spawned_veh_handle[item] = nil, nil
end)

local spawner_spawnedvehs_deleteall = spawner_spawnedvehs:new_button('Delete all', function ()
    for i = 1, #Spawned_veh do
        entity.delete(Spawned_veh_handle[i])
    end
    ui.popup('GOD SYSTEM', 'Deleted successfully: '..#Spawned_veh..'.', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
    for i = 1, #Spawned_veh do
        Spawned_veh[i], Spawned_veh_handle[i] = nil, nil
    end
end)