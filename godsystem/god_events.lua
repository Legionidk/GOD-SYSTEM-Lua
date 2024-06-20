-- on_script_tick for loops event
events.on_script_tick(function ()
    if Loops_group_nc_loop:get() then
        script.get_global(262145):at(24234):write_u32(300000)
        script.get_global(262145):at(24253):write_u32(300000)
        script.get_global(262145):at(24257):write_u32(300000)
        stats.set_u32(string.smart_joaat('MP'..stats.get_character_index()..'_CLUB_PAY_TIME_LEFT'), -1)
        utils.sleep(2000)
    end
    if Loops_group_death_loop:get() then
        Loop(0x610F9AB4, 50000)
        utils.sleep(1000)
    end
    if Loops_group_chips_loop:get() then
        script.get_global(1963515):at(24234):write_u32(2147483646)
        utils.sleep(3000)
    end
    if Office_crates_group_afkfarm:get() then
        if GetTotalAvailable() >= GetTotalCapacity() then
            Office_crates_group_afkfarm:set(false)
            ui.popup('GOD SYSTEM', 'Crates farm disabled as warehouses are full.', Icons.CANCEL2, PopupType.BOX)
        else
            for i = 12, 16 do
                stats.set_masked_int(string.smart_joaat('MP'..stats.get_character_index()..'_FIXERPSTAT_BOOL1'), 1, i, stats.get_character_index())
            end
        end
    end
    if Bus_hangar_group_cargoloop:get() then
        stats.set_masked_int(string.smart_joaat('MP'..stats.get_character_index()..'_DLC22022PSTAT_BOOL3'), 1, 9, stats.get_character_index())
    end
    utils.yield()
end)