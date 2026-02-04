local bunkerSubpage = BUSINESSES_PAGE:new_subpage("Bunker")

local bunkerSuppliesGroup = bunkerSubpage:new_group("Supplies", 1)
local bunkerProductionGroup = bunkerSubpage:new_group("Stock", 1)
local bunkerSellGroup = bunkerSubpage:new_group("Missions", 2)
local bunkerMiscGroup = bunkerSubpage:new_group("Misc", 2)

--region bunkerSuppliesGroup

bunkerSuppliesGroup:new_button("Get supplies", function()
    script.get_global(1673814 + 5 + 1):write_u32(1)
    ui.popup('GOD SYSTEM', 'Supplies should be arrived to your bunker.', Icons.PORTAL, PopupType.BOX)
end)

--endregion

--region bunkerProductionGroup

STOCK_LOOP_CHECKBOX = bunkerProductionGroup:new_checkbox("Stock production loop")

bunkerProductionGroup:new_button("Trigger stock production", function()
    script.get_global(2708925 + 1 + 5 * 2):write_u32(1)
    script.get_global(2708925 + 1 + 5 * 2 + 1):write_bool(true)

    ui.popup('GOD SYSTEM', 'Stock roduction triggered.', Icons.PORTAL, PopupType.BOX)
end)

bunkerProductionGroup:new_button("Maximize stock price", function()
    tunables.set_int("GR_MANU_PRODUCT_VALUE",
        math.floor((2500000 / 1.5) /
        stats.get_u32(string.smart_joaat("MP" .. stats.get_character_index() .. "_PRODTOTALFORFACTORY5"))))
end)

--endregion

--region bunkerSellGroup

bunkerSellGroup:new_button("Instant sell", function()
    script.get_local("gb_gunrunning", 1268 + 774):write_u32(0)
    ui.popup('GOD SYSTEM', 'Sell mission should have been finished.', Icons.PORTAL, PopupType.BOX)
end)

--endregion
