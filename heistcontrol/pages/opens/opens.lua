--- Маски -----------------------------------------------------------

Opens:add_click_option('ЫЫЫ А ГИДЕ ТТЫ ТАКИЕ МАСКИ ВЗЯЛ', 'HC_Opens_TDMasks', function ()
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

--- Премиальные транспорт -------------------------------------------

Opens:add_click_option('Получить премиальный транспорт', 'HC_Opens_TDMasks', function ()
    player_index = script_global:new(1574915):get_int64()
    stat1 = 'MP'..player_index..'_CARMEET_PV_CHLLGE_CMPLT'
    stat2 = 'MP'..player_index..'_CARMEET_PV_CLMED'
    hash1 = string.smart_joaat(stat1)
    hash2 = string.smart_joaat(stat2)
    stats.set_bool(hash1, true)
    stats.set_bool(hash2, false)
    notify.success('Stuff', 'Машина получена')
end):setHint('Транспорт за испытание в автоклубе ЛС.')