--- Heist Control by lgn v1.3.3 (1.68, 3095) -------------------------"

LGN = '1.3.3'

--- Гуи ------------------------------------------------------------

require('heistcontrol/system/on_tick.lua')
require('heistcontrol/util/DrawUI.lua')
filesys = require('heistcontrol/util/file_system')
features = require('heistcontrol/rage/features')
gui = require('heistcontrol/globals/gui')

listener.register('BS_Init', GET_EVENTS_LIST().OnInit, function ()
    log.init('[Heist Control by lgn] Загрузка скрипта')
    log.init(string.format('[Heist Control by lgn] Версия -> [%s]', LGN))
    task.executeAsScript('Init_LoadPages', function ()
        log.init('[Heist Control by lgn] Загрузка меню')
        local path = filesys.getInitScriptPath() .. '\\heistcontrol\\pages'
        path = path:gsub('\\\\lua', '\\lua')
        for line in io.popen('dir \"' .. path .. '\" /a /b', 'r'):lines() do
            if filesys.doesFileExist(path .. '\\' .. line .. '\\' .. 'init.lua') then
                log.init(string.format('[Heist Control by lgn] Инициализация страницы \'%s\'', line))
                require('heistcontrol/pages/' .. line .. '/' .. 'init')
            end
        end
        Configs.loadConfig()
        HotkeyService.loadHotkeys()
    end)
end)