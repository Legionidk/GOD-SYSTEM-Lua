-- SPAWNER
local SPAWNER = Main_page:new_subpage('SPAWNER')

local SPAWNER_MODS = SPAWNER:new_group("Spawn from 'mods' folder", GroupRect.TITLE)
local SPAWNER_SPAWNED = SPAWNER:new_group('Spawned vehicles', GroupRect.BODY)
local SPAWNER_NAME = SPAWNER:new_group('Spawn by name', GroupRect.TITLE)

-- Spawn by name
SPAWNER_NAME_INPUT = SPAWNER_NAME:new_input('Model name')

SPAWNER_NAME_BUTTON = SPAWNER_NAME:new_button('Spawn', function ()
    if SPAWNER_NAME_INPUT:get() == '' then
        ui.popup('GOD SYSTEM', "Can't spawn nothing!", Icons.CANCEL2, PopupType.BOX)
    else
        vehicle.spawn(SPAWNER_NAME_INPUT:get(), function (veh)
            ui.popup('GOD SYSTEM', 'Spawned successfully: '..SPAWNER_NAME_INPUT:get()..'.', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
            table.insert(SPAWNED_HANDLE, 1, veh)
            table.insert(SPAWNED, 1, SPAWNER_NAME_INPUT:get())
        end)
    end
end)

-- Spawn from 'mods' folder
SPAWNER_MODS_LIST = SPAWNER_MODS:new_table_list("'mods' folder", MODS)

SPAWNER_MODS_LIST:set_click_callback(function (item)
    vehicle.spawn(MODS[item], function (veh)
        ui.popup('GOD SYSTEM', 'Spawned successfully: '..MODS[item]..'.', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
        table.insert(SPAWNED_HANDLE, 1, veh)
        table.insert(SPAWNED, 1, MODS[item])
    end)
end)

-- Spawned vehicles
SPAWNER_SPAWNED_LIST = SPAWNER_SPAWNED:new_table_list('Spawned vehicles', SPAWNED)

SPAWNER_SPAWNED_LIST:set_click_callback(function (item)
    entity.delete(SPAWNED_HANDLE[item], function ()
        ui.popup('GOD SYSTEM', 'Failed to delete.', Icons.CANCEL2, PopupType.BOX)
    end, function ()
        ui.popup('GOD SYSTEM', 'Deleted successfully.', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
    end)
    SPAWNED[item], SPAWNED_HANDLE[item] = nil, nil
end)

SPAWNER_SPAWNED_DEL = SPAWNER_SPAWNED:new_button('Delete all', function ()
    for i = 1, #SPAWNED do
        entity.delete(SPAWNED_HANDLE[i])
    end
    ui.popup('GOD SYSTEM', 'Deleted successfully: '..#SPAWNED..'.', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
    for i = 1, #SPAWNED do
        SPAWNED[i], SPAWNED_HANDLE[i] = nil, nil
    end
end)
