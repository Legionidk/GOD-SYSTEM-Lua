---- /godmode
-- Creating main page
main_page = ui.new_page('GOD SYSTEM', Icons.PORTAL)

-- Loading pages
-- for file_name in io.popen('dir \"'..fs.get_dir_script()..'GOD SYSTEM\\pages'..'\" /a /b', 'r'):lines() do
-- 	require(fs.get_dir_script()..'GOD SYSTEM\\pages\\'..file_name)
-- end
require(fs.get_dir_script()..'GOD SYSTEM\\pages\\office.lua')
require(fs.get_dir_script()..'GOD SYSTEM\\pages\\businesses.lua')
require(fs.get_dir_script()..'GOD SYSTEM\\pages\\spawner.lua')
require(fs.get_dir_script()..'GOD SYSTEM\\pages\\misc.lua')

-- Loading events
require(fs.get_dir_script()..'GOD SYSTEM\\events.lua')

-- Popup on load
print('                                                                              ')
print('             **             **            **        **                        ')
print('            **          **     **        **        **                         ')
print('           **          **      **       ** **     **                          ')
print('          **          **               **   **   **                           ')
print('         **           **  ******      **     ** **                            ')
print('        *******       **    **       **        **   Made by lgn with <3       ')
print('       *******          **          **        **   GOD SYSTEM                 ')
print('                                                                              ')
ui.popup('GOD SYSTEM', 'Loaded succesfully', Icons.PORTAL, PopupType.BOX)
