Bus = Submenu.add_static_submenu('Бизнесы', 'HC_Bus')
HOME_SUBMENU:add_sub_option('Бизнесы', 'HC_Bus', Bus)

require('heistcontrol/pages/bus/office/office.lua')
require('heistcontrol/pages/bus/bunker/bunker.lua')
require('heistcontrol/pages/bus/mc/mc.lua')
require('heistcontrol/pages/bus/acid/acid.lua')
