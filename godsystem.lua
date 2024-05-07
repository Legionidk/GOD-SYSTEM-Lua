--- /godmode --------------------------

LGN = '2.6.1'
GTA = '1.68'

--- Инициализация -------------------------------------------------------------

require('godsystem/system/on_tick.lua')
require('godsystem/util/DrawUI.lua')
filesys = require('godsystem/util/file_system')
features = require('godsystem/rage/features')
gui = require('godsystem/globals/gui')

listener.register('BS_Init', GET_EVENTS_LIST().OnInit, function ()
    log.init(string.format('[GOD SYSTEM] Release -> [v%s]', LGN))
    task.executeAsScript('Init_LoadPages', function ()
        local path = filesys.getInitScriptPath() .. '\\godsystem\\pages'
        path = path:gsub('\\\\lua', '\\lua')
        for line in io.popen('dir \"' .. path .. '\" /a /b', 'r'):lines() do
            if filesys.doesFileExist(path .. '\\' .. line .. '\\' .. 'init.lua') then
                require('godsystem/pages/' .. line .. '/' .. 'init')
            end
        end

        Configs.loadSilentConfig()
        notify.default2('Howdy', 'Howdy, ', social.get_username())

        if fs.directory_exists(fs.get_dir_game()..'\\mods\\update\\x64\\dlcpacks') then
            addon_checker()
        else
            table.insert(Checked_addons, 'folder not found')
        end

        http.get('https://raw.githubusercontent.com/Legionidk/GOD-SYSTEM-Lua/main/README.md', function (code, header, content)
            if native.invoke(4, 0xFCA9373EF340AC0A) ~= GTA then
                notify.warning('notupd', 'Lua is not updated!')
                console.log(14, '[GOD SYSTEM] Lua is not updated for this game version!\n')
            else
                if string.len(LGN) >= 4 then
                    if string.sub(content, 51, 55) ~= LGN then
                        notify.warning('newver', 'New version available!')
                        console.log(14, '[GOD SYSTEM] New version available!\n')
                    else
                        log.init('[GOD SYSTEM] Latest version installed')
                    end
                else
                    if string.sub(content, 51, 53) ~= LGN then
                        notify.warning('newver', 'New version available!')
                        console.log(14, '[GOD SYSTEM] New version available!\n')
                    else
                        log.init('[GOD SYSTEM] Latest version installed')
                    end
                end
            end
        end)
    end)
end)
