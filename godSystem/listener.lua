utils.loop_fiber(function()
    -- region Bunker stock loop
    if STOCK_LOOP_CHECKBOX:get() then
        local totalStock = stats.get_u32(string.smart_joaat("MP"..stats.get_character_index().."_PRODTOTALFORFACTORY5"))
        if totalStock == 100 then
            STOCK_LOOP_CHECKBOX:set(false)
            ui.popup('GOD SYSTEM', 'Stock production loop turned off - your stock is full.', Icons.PORTAL, PopupType.BOX)
            return
        end

        local totalSupplies = stats.get_u32(string.smart_joaat("MP" ..
        stats.get_character_index() .. "_MATTOTALFORFACTORY5"))
        if totalSupplies == 0 then
            script.get_global(1673814 + 5 + 1):write_u32(1)
        end

        script.get_global(2708925 + 1 + 5 * 2):write_u32(1)
        script.get_global(2708925 + 1 + 5 * 2 + 1):write_bool(true)
    end
    -- endregion
end)

print("[GOD SYSTEM] Listener ready to listen!")
