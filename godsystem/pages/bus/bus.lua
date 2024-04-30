Bus = Submenu.add_static_submenu('Businesses', 'HC_Bus')
HOME_SUBMENU:add_sub_option('Businesses', 'HC_Bus', Bus)

require('godsystem/pages/bus/office.lua')
require('godsystem/pages/bus/bunker.lua')
require('godsystem/pages/bus/hangar.lua')
require('godsystem/pages/bus/mc.lua')
require('godsystem/pages/bus/acid.lua')