---- /godmode
-- Data
mods_folder = {}
spawned_handles = {}
spawned_names = {}

-- Spawn from 'mods' folder group
function mods_checker()
    local game_folders_temp = {}
    local mod_folders_temp = {}
    for mod_folder in io.popen('dir \"'..fs.get_dir_game()..'\\mods\\update\\x64\\dlcpacks'..'\" /a /b', 'r'):lines() do
        table.insert(mod_folders_temp, mod_folder)
    end
    for game_folder in io.popen('dir \"'..fs.get_dir_game()..'\\update\\x64\\dlcpacks'..'\" /a /b', 'r'):lines() do
        table.insert(game_folders_temp, game_folder)
    end
    for game_folder = 1, #game_folders_temp do
        for mod_folder = 1, #mod_folders_temp do
            if game_folders_temp[game_folder] == mod_folders_temp[mod_folder] then
                table.remove(mod_folders_temp, v)
            end
        end
    end
    mods_folder = mod_folders_temp
    print('Mods folder checked')
end

-- Spawn by name group
function spawn_function()
    if name_input:get() == '' then
        ui.popup('GOD SYSTEM', "Can't spawn nothing!", Icons.CANCEL2, PopupType.BOX)
    else
        vehicle.spawn(name_input:get(), function (veh)
            ui.popup('GOD SYSTEM', 'Spawned successfully: '..name_input:get(), Icons.CHECKMARK_SUCCESS, PopupType.BOX)
            table.insert(spawned_handles, 1, veh)
            table.insert(spawned_names, 1, name_input:get())
        end)
    end
end

-- Spawned vehicles group
function delete_all_function()
    for i = 1, #spawned_names do
        entity.delete(spawned_handles[i])
    end
    ui.popup('GOD SYSTEM', 'Deleted successfully: '..#spawned_names, Icons.CHECKMARK_SUCCESS, PopupType.BOX)
    for i = 1, #spawned_names do
        spawned_names[i], spawned_handles[i] = nil, nil
    end
end

-- On load
mods_checker()
