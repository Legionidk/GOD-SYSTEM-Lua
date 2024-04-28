Trash = Submenu.add_static_submenu('Другое', 'HC_Stuff_Trash')
HOME_SUBMENU:add_sub_option('Другое', 'HC_Stuff_Trash', Trash)

--- 1кк -------------------------------------------------------------

Trash:add_looped_option('Накрутка по 1кк/5с', 'HC_Stuff_Loop', 5, function ()
    script_global:new(4537212):at(1):set_long(2147483646)
	script_global:new(4537212):at(7):set_long(2147483647)
	script_global:new(4537212):at(6):set_long(0)
	script_global:new(4537212):at(5):set_long(0)
	script_global:new(4537212):at(3):set_long(0x615762F1)
	script_global:new(4537212):at(2):set_long(1000000)
	script_global:new(4537212):set_long(2)
end, function ()
    script_global:new(4537212):at(1):set_long(2147483647)
	script_global:new(4537212):at(7):set_long(2147483647)
	script_global:new(4537212):at(6):set_long(0)
	script_global:new(4537212):at(5):set_long(0)
	script_global:new(4537212):at(3):set_long(0)
	script_global:new(4537212):at(2):set_long(0)
	script_global:new(4537212):set_long(16)
    notify.success('HC_Stuff_Loop', 'Накрутка выключена')
end)

--- Удаленный транспорт ---------------------------------------------

Trash:add_click_option('Разблокировать удаленный транспорт', 'HC_Stuff_ResDelVeh', function ()
    for i = 1, 197 do
        script_global:new(262145):at(Removed_veh[i]):set_int64(1)
    end
    notify.success('Stuff', 'Успешно')
end):setHint('Разблокирует 197 штук ранее удленного из магазинов транспорта.')

--- Премиальные транспорт -------------------------------------------

Trash:add_click_option('Получить премиальный транспорт', 'HC_Stuff_TDMasks', function ()
    stats.set_bool(string.smart_joaat('MP'..mp()..'_CARMEET_PV_CHLLGE_CMPLT'), true)
    stats.set_bool(string.smart_joaat('MP'..mp()..'_CARMEET_PV_CLMED'), false)
    notify.success('Stuff', 'Успешно')
end):setHint('Транспорт за испытание в автоклубе ЛС.')

--- Телепортироваться к оружейному фургону --------------------------

Trash:add_click_option('Телепортироваться к оружейному фургону', 'HC_Stuff_GV', function ()
    utils.teleport(Gunvan_coords[script_global:new(2652572 + 2650 + 1):get_int64()][1],
                    Gunvan_coords[script_global:new(2652572 + 2650 + 1):get_int64()][2],
                    Gunvan_coords[script_global:new(2652572 + 2650 + 1):get_int64()][3])
end)