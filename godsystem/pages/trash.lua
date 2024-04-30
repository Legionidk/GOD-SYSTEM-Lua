Trash = Submenu.add_static_submenu('Other', 'HC_Stuff_Trash')
HOME_SUBMENU:add_sub_option('Other', 'HC_Stuff_Trash', Trash)

--- Удаленный транспорт ---------------------------------------------

Trash:add_click_option('Unlock deleted vehicles', 'HC_Stuff_ResDelVeh', function ()
    for i = 1, 197 do
        script_global:new(262145):at(Removed_veh[i]):set_int64(1)
    end
    notify.success('Stuff', 'Done')
end):setHint('Unlocks 197 units of previously removed vehicles from stores.')

--- Премиальные транспорт -------------------------------------------

Trash:add_click_option('Unlock LS Car Meet podium prize', 'HC_Stuff_TDMasks', function ()
    stats.set_bool(string.smart_joaat('MP'..mp()..'_CARMEET_PV_CHLLGE_CMPLT'), true)
    stats.set_bool(string.smart_joaat('MP'..mp()..'_CARMEET_PV_CLMED'), false)
    notify.success('Stuff', 'Done')
end)

--- Телепортироваться к оружейному фургону --------------------------

Trash:add_click_option('TP to gun van', 'HC_Stuff_GV', function ()
    utils.teleport(Gunvan_coords[script_global:new(2652572 + 2650 + 1):get_int64()][1],
                    Gunvan_coords[script_global:new(2652572 + 2650 + 1):get_int64()][2],
                    Gunvan_coords[script_global:new(2652572 + 2650 + 1):get_int64()][3])
end)