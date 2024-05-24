--- /godmode --------------------------

LGN = '2.6.3'
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
    end)
end)