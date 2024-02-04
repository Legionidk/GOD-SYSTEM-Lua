Bus = Submenu.add_static_submenu('Бизнесы', 'HC_Bus')
HOME_SUBMENU:add_sub_option('Бизнесы', 'HC_Bus', Bus)

require('heistcontrol/pages/bus/office.lua')
require('heistcontrol/pages/bus/bunker.lua')
require('heistcontrol/pages/bus/hangar.lua')
require('heistcontrol/pages/bus/mc.lua')
require('heistcontrol/pages/bus/acid.lua')