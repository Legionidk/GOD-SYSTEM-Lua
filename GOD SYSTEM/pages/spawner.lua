---- /godmode
-- Creating subpage
local subpage = main_page:new_subpage('SPAWNER')

-- Creating groups
local spawn_from_group = subpage:new_group("Spawn from 'mods' folder", GroupRect.TITLE):set_collapsed(true)
local spawn_by_group = subpage:new_group('Spawn by name', GroupRect.TITLE):set_collapsed(true)
local spawned_group = subpage:new_group('Spawned vehicles', GroupRect.BODY):set_collapsed(true)

-- Loading functions
require(fs.get_dir_script()..'GOD SYSTEM\\functions\\spawner_functions.lua')

---- Creating functions
-- Spawn from 'mods' folder group
local spawn_from_folder_list = spawn_from_group:new_table_list("Spawn from 'mods' folder", mods_folder)
spawn_from_folder_list:set_click_callback(function (item)
    vehicle.spawn(mods_folder[item], function (veh)
        ui.popup('GOD SYSTEM', 'Spawned successfully: '..mods_folder[item], Icons.CHECKMARK_SUCCESS, PopupType.BOX)
        table.insert(spawned_handles, mods_folder[item])
    end)
end)

-- Spawn by name group
name_input = spawn_by_group:new_input('Model name')
local spawn_button = spawn_by_group:new_button('Spawn', spawn_function)

-- Spawned vehicles group
local spawned_list = spawned_group:new_table_list('Spawned vehicles', spawned_names)
spawned_list:set_click_callback(function (item)
    entity.delete(spawned_handles[item], function ()
        ui.popup('GOD SYSTEM', 'Failed to delete', Icons.CANCEL2, PopupType.BOX)
    end, function ()
        ui.popup('GOD SYSTEM', 'Deleted successfully', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
    end)
    spawned_names[item], spawned_handles[item] = nil, nil
end)
local delete_all_button = spawned_group:new_button('Delete all', delete_all_function)


-- Popup on load
print('Spawner page loaded succesfully')
