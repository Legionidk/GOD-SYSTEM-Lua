utils.loop_fiber(function()
    -- region Bunker stock loop
    if STOCK_LOOP_CHECKBOX:get() then
        local totalStock = stats.get_u32(string.smart_joaat("MP" .. stats.get_character_index() ..
            "_PRODTOTALFORFACTORY5"))
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

    -- region Bunker info group update loop
    local bunkerStockHash = string.smart_joaat("MP" .. stats.get_character_index() .. "_PRODTOTALFORFACTORY5")
    local bunkerResearchHash = string.smart_joaat("MP" .. stats.get_character_index() .. "_RESEARCHTOTALFORFACTORY5")
    local bunkerSuppliesHash = string.smart_joaat("MP" .. stats.get_character_index() .. "_MATTOTALFORFACTORY5")

    STOCK_INFO_SLIDER:set(stats.get_u32(bunkerStockHash))
    RESEARCH_INFO_SLIDER:set(stats.get_u32(bunkerResearchHash))
    SUPPLIES_INFO_SLIDER:set(stats.get_u32(bunkerSuppliesHash))
    -- endregion

    -- region Warehouse info group update loop
    local totalCrates = 0

    for i = 0, 4 do
        local cratesHash = string.smart_joaat('MP'..stats.get_character_index()..'_CONTOTALFORWHOUSE'..i)

        if i == SELECTED_WAREHOUSE_SLOT then
            SELECTED_CRATES_SLIDER:set(stats.get_u32(cratesHash))
        end

        totalCrates = totalCrates + stats.get_u32(cratesHash)
    end

    TOTAL_CRATES_SLIDER:set(totalCrates)
    -- endregion
end)

print("[GOD SYSTEM] Fiber ready to loop.")
