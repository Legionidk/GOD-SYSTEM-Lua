Heists = Submenu.add_static_submenu('Heist control', 'HC_Heists')
HOME_SUBMENU:add_sub_option('Heist control', 'HC_Heists', Heists)

require('godsystem/pages/heists/cayo.lua')
require('godsystem/pages/heists/casino.lua')
require('godsystem/pages/heists/doomsday.lua')
require('godsystem/pages/heists/auto.lua')
require('godsystem/pages/heists/salvage.lua')
require('godsystem/pages/heists/dre.lua')