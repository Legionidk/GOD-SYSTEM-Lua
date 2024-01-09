---------------------------------------------------------------------

local function stats_set(stat, value)
    hash = string.smart_joaat(''..stat..'')
    stats.set_u32(hash, value)
end

--- Кислотная лаборатория -------------------------------------------

Acid = Submenu.add_static_submenu('Кислотная лаборатория', 'HC_Stuff_Acid')
HOME_SUBMENU:add_sub_option('Кислотная лаборатория', 'HC_Stuff_Acid', Acid)

Acid:add_click_option('Вызвать лабораторию', 'HC_Stuff_Acid_Req', function ()
    script_global:new(2738587):at(944):set_int64(1)
    notify.success('Acid', 'Вызвано')
end)

Acid:add_click_option('Вызвать мотоцикл', 'HC_Stuff_Acid_Req', function ()
    script_global:new(2738587):at(994):set_int64(1)
    notify.success('Acid', 'Вызвано')
end)

Acid:add_click_option('Пополнить сырье', 'HC_Stuff_Acid_InstResupply', function ()
    script_global:new(1662873):at(7):set_int64(1)
    notify.success('Acid', 'Сырье пополнено')
end):setHint('Бесплатно.')

--- Фишки ---------------------------------------------

Casino = Submenu.add_static_submenu('Казино', 'HC_Stuff_Casino')
HOME_SUBMENU:add_sub_option('Казино', 'HC_Stuff_Casino', Casino)

Casino:add_choose_option('Дроп в колесе удачи', 'HC_Stuff_LW', false, {'Машина', 'Тайный предмет', 'Одежда', 'Фишки', 'Деньги', 'РП', 'Скидка'}, function(pos)
    drop_name = {
        [1] = 'Машина',
        [2] = 'Тайный предмет',
        [3] = 'Одежда',
        [4] = 'Фишки',
        [5] = 'Деньги',
        [6] = 'РП',
        [7] = 'Скидка'
    }
    drop_id = {
        [1] = 18,
        [2] = 11,
        [3] = 16,
        [4] = 15,
        [5] = 19,
        [6] = 17,
        [7] = 4
    }
    script_local:new('casino_lucky_wheel', 278 + 14):set_int64(drop_id[pos])
    notify.success('Stuff', 'Успешно выбрано: '..drop_name[pos])
end)

Casino:add_num_option('Лимит покупки фишек', 'HC_Stuff_ChipsLim', 100000, 2000000, 100000, function(val)
    script_global:new(262145):at(27238):set_int64(val)
end)

Casino:add_click_option('Сброс кд покупки фишек', 'HC_Stuff_ResetCdChips', function()
    stats_set('MPPLY_CASINO_CHIPS_PUR_GD', 0)
    stats_set('MPPLY_CASINO_CHIPS_PURTIM', 0)
    notify.success('Stuff', 'Кд сброшено')
end)

--- Открытия --------------------------------------------------------

Opens = Submenu.add_static_submenu('Открытия', 'HC_Stuff_Opens')
HOME_SUBMENU:add_sub_option('Открытия', 'HC_Stuff_Opens', Opens)

Opens:add_click_option('ЫЫЫ А ГИДЕ ТТЫ ТАКИЕ МАСКИ ВЗЯЛ', 'HC_Stuff_TDMasks', function ()
    script_global:new(262145):at(33177):set_int64(-1285035231)
    script_global:new(262145):at(33178):set_int64(-328409810)
    script_global:new(262145):at(33179):set_int64(-97748819)
    script_global:new(262145):at(33180):set_int64(-2003724935)
    script_global:new(262145):at(33181):set_int64(-1768410746)
    script_global:new(262145):at(33182):set_int64(854092324)
    script_global:new(262145):at(33183):set_int64(154146484)
    script_global:new(262145):at(33184):set_int64(-837082997)
    script_global:new(262145):at(33185):set_int64(628936525)
    script_global:new(262145):at(33186):set_int64(-408117914)
    script_global:new(262145):at(33187):set_int64(292286692)
    script_global:new(262145):at(33188):set_int64(53892217)
    script_global:new(262145):at(33189):set_int64(171303540)
    script_global:new(262145):at(33190):set_int64(-52410423)
    script_global:new(262145):at(33191):set_int64(1172363725)
    script_global:new(262145):at(33192):set_int64(934165864)
    script_global:new(262145):at(33193):set_int64(1666028710)
    script_global:new(262145):at(33194):set_int64(1440971218)
    script_global:new(262145):at(33195):set_int64(2128104379)
    script_global:new(262145):at(33196):set_int64(-2101809220)
    script_global:new(262145):at(33197):set_int64(-67771852)
    script_global:new(262145):at(33198):set_int64(-835778905)
    script_global:new(262145):at(33199):set_int64(936696309)
    script_global:new(262145):at(33200):set_int64(1224703050)
    script_global:new(262145):at(33201):set_int64(-1021546366)
    script_global:new(262145):at(33202):set_int64(-1792568167)
    notify.success('Stuff', 'Маски открыты')
end):setHint('Открывает маски технодемонов.')

Opens:add_click_option('Получить премиальный транспорт', 'HC_Stuff_TDMasks', function ()
    player_index = script_global:new(1574915):get_int64()
    stat1 = 'MP'..player_index..'_CARMEET_PV_CHLLGE_CMPLT'
    stat2 = 'MP'..player_index..'_CARMEET_PV_CLMED'
    hash1 = string.smart_joaat(stat1)
    hash2 = string.smart_joaat(stat2)
    stats.set_bool(hash1, true)
    stats.set_bool(hash2, false)
    notify.success('Stuff', 'Машина получена')
end):setHint('Транспорт за испытание в автоклубе ЛС.')

--- Крупный транспорт -----------------------------------------------

Requests = Submenu.add_static_submenu('Крупный транспорт', 'Requests')
HOME_SUBMENU:add_sub_option('Крупный транспорт', 'Requests', Requests)

Requests:add_click_option('Вызвать ПКП', 'HC_Stuff_PKP', function ()
    script_global:new(2738587):at(930):set_int64(1)
    notify.success('Stuff', 'Вызвано')
end)

Requests:add_click_option('Вызвать Avenger', 'HC_Stuff_Avenger', function ()
    script_global:new(2738587):at(938):set_int64(1)
    notify.success('Stuff', 'Вызвано')
end)

Requests:add_click_option('Вызвать TerrorByte', 'HC_Stuff_TerrorByte', function ()
    script_global:new(2738587):at(943):set_int64(1)
    notify.success('Stuff', 'Вызвано')
end)

Requests:add_click_option('Вызвать Косатку', 'HC_Stuff_Kosatka', function ()
    script_global:new(2738587):at(960):set_int64(1)
    notify.success('Stuff', 'Вызвано')
end)

Requests:add_click_option('Вызвать кислотную лабораторию', 'HC_Stuff_AcidReq', function ()
    script_global:new(2738587):at(944):set_int64(1)
    notify.success('Stuff', 'Вызвано')
end)

Requests:add_click_option('Вызвать мотоцикл кислотной лаборатории', 'HC_Stuff_AcidMotoReq', function ()
    script_global:new(2738587):at(994):set_int64(1)
    notify.success('Stuff', 'Вызвано')
end)

--- Мусор -----------------------------------------------------------

Trash = Submenu.add_static_submenu('Мусор', 'HC_Stuff_Trash')
HOME_SUBMENU:add_sub_option('Мусор', 'HC_Stuff_Trash', Trash):setHint('Юзлесс хуета для прикола.')

Trash:add_click_option('Вызвать Хренча', 'HC_Stuff_Trash_Gooch', function ()
    script_global:new(2698947):at(3 + 1):set_int64(171)
    script_global:new(2698947):at(2):set_int64(6)
    notify.success('Stuff', 'Хренч вызван')
end)