--- /godmode --------------------------

LGN = '2.5'
GTA = '1.68'

--- Инициализация -------------------------------------------------------------

require('godsystem/system/on_tick.lua')
require('godsystem/util/DrawUI.lua')
filesys = require('godsystem/util/file_system')
features = require('godsystem/rage/features')
gui = require('godsystem/globals/gui')

listener.register('BS_Init', GET_EVENTS_LIST().OnInit, function ()
    log.init('[GOD SYSTEM] Загрузка скрипта')
    log.init(string.format('[GOD SYSTEM] Версия -> [%s]', LGN))
    task.executeAsScript('Init_LoadPages', function ()
        local path = filesys.getInitScriptPath() .. '\\godsystem\\pages'
        path = path:gsub('\\\\lua', '\\lua')
        for line in io.popen('dir \"' .. path .. '\" /a /b', 'r'):lines() do
            if filesys.doesFileExist(path .. '\\' .. line .. '\\' .. 'init.lua') then
                require('godsystem/pages/' .. line .. '/' .. 'init')
            end
        end

        Configs.loadSilentConfig()

        if os.date('%H') == '4' or os.date('%H') == '5' or os.date('%H') == '6' or os.date('%H') == '7' or os.date('%H') == '8' or os.date('%H') == '9' or os.date('%H') == '10' or os.date('%H') == '11' then
            notify.success('test', 'Доброе утро, '..social.get_username())
        elseif os.date('%H') == '12' or os.date('%H') == '13' or os.date('%H') == '14' or os.date('%H') == '15' or os.date('%H') == '16' or os.date('%H') == '17' then
            notify.success('test', 'Добрый день, '..social.get_username())
        elseif os.date('%H') == '18' or os.date('%H') == '19' or os.date('%H') == '20' or os.date('%H') == '21' or os.date('%H') == '22' or os.date('%H') == '23' then
            notify.success('test', 'Добрый вечер, '..social.get_username())
        else
            notify.success('test', 'Доброй ночи, '..social.get_username())
        end

        if os.date('%m/%d') == '12/31' or os.date('%m/%d') == '01/01' then
            notify.important('Holidays', 'С Новым Годом!')
        elseif os.date('%m/%d') == '01/07' then
            notify.important('Holidays', 'С Рождеством!')
        elseif os.date('%m/%d') == '02/23' then
            notify.important('Holidays', 'С Днем защитника Отечества!')
        elseif os.date('%m/%d') == '03/08' then
            notify.important('Holidays', 'С Международным женским днем!')
        elseif os.date('%m/%d') == '03/18' then
            notify.important('Holidays', 'С Днем присоединения Крыма к Российской Федерации!')
        elseif os.date('%m/%d') == '03/27' then
            notify.important('Holidays', 'С Днем Войск Национальной Гвардии Российской Федерации!')
        elseif os.date('%m/%d') == '04/01' then
            notify.important('Holidays', 'Ты лох')
        elseif os.date('%m/%d') == '04/16' then
            notify.important('Holidays', 'Христос воскрес!')
        elseif os.date('%m/%d') == '05/09' then
            notify.important('Holidays', 'С Днем Победы!')
        elseif os.date('%m/%d') == '06/12' then
            notify.important('Holidays', 'С Днем России!')
        elseif os.date('%m/%d') == '08/22' then
            notify.important('Holidays', 'С Днем Государственного Флага Российской Федерации!')
        elseif os.date('%m/%d') == '09/01' then
            notify.important('Holidays', 'Почему ты не в школе?')
        elseif os.date('%m/%d') == '11/04' then
            notify.important('Holidays', 'С Днем народного единства!')
        end

        if fs.directory_exists(fs.get_dir_game()..'\\mods\\update\\x64\\dlcpacks') then
            addon_checker()
        else
            table.insert(Checked_addons, 'папка не найдена')
        end

        http.get('https://raw.githubusercontent.com/Legionidk/GOD-SYSTEM-Lua/main/README.md', function (code, header, content)
            if native.invoke(4, 0xFCA9373EF340AC0A) ~= GTA then
                notify.warning('[GOD SYSTEM]', 'Луа не обновлена под эту версию игры!')
                console.log(14, '[GOD SYSTEM] Луа не обновлена под эту версию игры!\n')
            else
                if string.len(LGN) >= 4 then
                    if string.sub(content, 51, 55) ~= LGN then
                        notify.warning('[GOD SYSTEM]', 'Обнаружена новая версия!')
                        console.log(14, '[GOD SYSTEM] Обнаружена новая версия!\n')
                    else
                        log.init('[GOD SYSTEM] Установлена последняя версия')
                    end
                else
                    if string.sub(content, 51, 53) ~= LGN then
                        notify.warning('[GOD SYSTEM]', 'Обнаружена новая версия!')
                        console.log(14, '[GOD SYSTEM] Обнаружена новая версия!\n')
                    else
                        log.init('[GOD SYSTEM] Установлена последняя версия')
                    end
                end
            end
        end)
    end)
end)
