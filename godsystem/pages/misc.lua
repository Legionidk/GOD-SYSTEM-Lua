-- Misc page
MISC = Main_page:new_subpage('MISC')
MISC_GROUP = MISC:new_group('Misc', GroupRect.TITLE)

-- Unlocks
MISC_GROUP_UNL169 = MISC_GROUP:new_button('Unlock locked vehicles from 1.69', function ()
    for i = 1, #V169 do
        script.get_global(V169[i]):write_u32(1)
    end
    ui.popup('GOD SYSTEM', 'Vehicles unlocked.', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
end)

MISC_GROUP_UNLDEL = MISC_GROUP:new_button('Unlock deleted vehicles', function ()
    for i = 1, #DELETED_VEHICLES do
        script.get_global(DELETED_VEHICLES[i]):write_u32(1)
    end
    ui.popup('GOD SYSTEM', 'Vehicles unlocked.', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
end)

MISC_GROUP_UNLDEL:set_hint('Unlocks 197 units of previously removed vehicles from stores.')

MISC_GROUP_UNLCARMEET = MISC_GROUP:new_button('Unlock LS Car Meet podium prize', function ()
    stats.set_bool(string.smart_joaat('MP'..stats.get_character_index()..'_CARMEET_PV_CHLLGE_CMPLT'), true)
    stats.set_bool(string.smart_joaat('MP'..stats.get_character_index()..'_CARMEET_PV_CLMED'), false)
    ui.popup('GOD SYSTEM', 'Prize unlocked.', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
end)

MISC_GROUP_GV = MISC_GROUP:new_button('TP to gunvan', function ()
    local gunvan = script.get_global(GUNVAN_GLOBAL):read_u32()
    if Check_table(gunvan, GUNVAN_COORDS) then
        local coords = GUNVAN_COORDS[gunvan]
        utils.teleport_self(coords[1], coords[2], coords[3])
        ui.popup('GOD SYSTEM', 'Teleported.', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
    else
        ui.popup('GOD SYSTEM', "Error: couldn't find gun van.", Icons.CANCEL2, PopupType.BOX)
    end
end)
