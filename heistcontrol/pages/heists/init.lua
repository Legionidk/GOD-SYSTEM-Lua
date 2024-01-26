Heists = Submenu.add_static_submenu('Ограбления', 'HC_Heists')
HOME_SUBMENU:add_sub_option('Ограбления', 'HC_Heists', Heists)

require('heistcontrol/pages/heists/Cayo/cayo.lua')
require('heistcontrol/pages/heists/Casino/casino.lua')
require('heistcontrol/pages/heists/Auto Shop/auto.lua')
require('heistcontrol/pages/heists/Salvage/salvage.lua')
require('heistcontrol/pages/heists/Dr. Dre/dre.lua')