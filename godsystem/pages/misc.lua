-- Misc page
local misc = Main_page:new_subpage('MISC')
local misc_group = misc:new_group('Misc', GroupRect.TITLE)

-- Unlocks
local misc_group_unlock169vehs = misc_group:new_button('Unlock locked vehicles from 1.69', function ()
    script.get_global(2707347):write_u32(1)
    for i = 1, #Vehs_169 do
        script.get_global(262145):at(Vehs_169[i]):write_u32(1)
    end
end)

local misc_group_unlockdelvehs = misc_group:new_button('Unlock deleted vehicles', function ()
    for i = 1, #Removed_veh do
        script.get_global(262145):at(Removed_veh[i]):write_u32(1)
    end
    ui.popup('GOD SYSTEM', 'Vehicles unlocked.', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
end):set_hint('Unlocks 197 units of previously removed vehicles from stores.')

local misc_group_unlocklscarmeet = misc_group:new_button('Unlock LS Car Meet podium prize', function ()
    stats.set_bool(string.smart_joaat('MP'..stats.get_character_index()..'_CARMEET_PV_CHLLGE_CMPLT'), true)
    stats.set_bool(string.smart_joaat('MP'..stats.get_character_index()..'_CARMEET_PV_CLMED'), false)
    ui.popup('GOD SYSTEM', 'Prize unlocked.', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
end)

local misc_group_tptogv = misc_group:new_button('TP to gunvan', function ()
    local gunvan = script.get_global(2652592):at(2671 + 1):read_u32()
    if Check_table(gunvan, Gunvan_coords) then
        local coords = Gunvan_coords[gunvan]
        utils.teleport_self(coords[1], coords[2], coords[3])
        ui.popup('GOD SYSTEM', 'Teleported.', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
    else
        ui.popup('GOD SYSTEM', "Error: couldn't find gun van.", Icons.CANCEL2, PopupType.BOX)
    end
end)

misc_group_unlockdelvehs:set_enabled(false)
