Heists = Submenu.add_static_submenu('Ограбления', 'HC_Heists')
HOME_SUBMENU:add_sub_option('Ограбления', 'HC_Heists', Heists)

require('heistcontrol/pages/heists/cayo.lua')
require('heistcontrol/pages/heists/casino.lua')
require('heistcontrol/pages/heists/doomsday.lua')
require('heistcontrol/pages/heists/auto.lua')
require('heistcontrol/pages/heists/salvage.lua')
require('heistcontrol/pages/heists/dre.lua')