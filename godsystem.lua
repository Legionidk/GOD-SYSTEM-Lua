-- /godmode // GOD SYSTEM
require('godsystem/god_vars.lua')
require('godsystem/god_funcs.lua')
Addon_checker()

-- Main page
Main_page = ui.new_page('GOD SYSTEM v'..VER, Icons.PORTAL)

-- Pages
require('godsystem/pages/office.lua')
require('godsystem/pages/businesses.lua')
require('godsystem/pages/casino.lua')
require('godsystem/pages/loops.lua')
require('godsystem/pages/spawner.lua')
require('godsystem/pages/misc.lua')

-- Events
require('godsystem/god_events.lua')

-- End
ui.popup('GOD SYSTEM v'..VER, 'Loaded successfully.', Icons.PORTAL, PopupType.BOX)