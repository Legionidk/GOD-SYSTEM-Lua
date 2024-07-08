-- on_script_tick event for loops
events.on_script_tick(function ()
    if LOOPS_GROUP_NC:get() then
        script.get_global(NC_LOOP_GLOBAL1):write_u32(300000) -- NIGHTCLUBINCOMEUPTOPOP5
        script.get_global(NC_LOOP_GLOBAL2):write_u32(300000) -- NIGHTCLUBINCOMEUPTOPOP100
        script.get_global(NC_LOOP_GLOBAL3):write_u32(300000) -- NIGHTCLUBMAXSAFEVALUE
        stats.set_u32(string.smart_joaat('MP'..stats.get_character_index()..'_CLUB_PAY_TIME_LEFT'), -1)
        utils.sleep(2000)
    end
    if LOOPS_GROUP_DEATH:get() then
        Loop(0x610F9AB4, 50000)
        utils.sleep(1000)
    end
    if LOOPS_GROUP_CHIPS:get() then
        script.get_global(CHIPS_LOOP_GLOBAL):write_u32(2147483646)
        utils.sleep(3000)
    end
    if OFFICE_CRATESBUY_GROUP_CRATESLOOP:get() then
        if GetTotalAvailable() >= GetTotalCapacity() then
            OFFICE_CRATESBUY_GROUP_CRATESLOOP:set(false)
            ui.popup('GOD SYSTEM', 'Crates farm disabled as warehouses are full.', Icons.CANCEL2, PopupType.BOX)
        else
            for i = 12, 16 do
                stats.set_masked_int(string.smart_joaat('MP'..stats.get_character_index()..'_FIXERPSTAT_BOOL1'), 1, i, stats.get_character_index())
            end
        end
    end
    if BUS_HANGAR_GROUP_CRATESLOOP:get() then
        stats.set_masked_int(string.smart_joaat('MP'..stats.get_character_index()..'_DLC22022PSTAT_BOOL3'), 1, 9, stats.get_character_index())
    end
    utils.yield()
end)