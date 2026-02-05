local bunkerSubpage = BUSINESSES_PAGE:new_subpage("Bunker")

local bunkerSuppliesGroup = bunkerSubpage:new_group("Supplies", 1)
local bunkerProductionGroup = bunkerSubpage:new_group("Stock", 1)
local bunkerSellGroup = bunkerSubpage:new_group("Missions", 2)
local bunkerMiscGroup = bunkerSubpage:new_group("Misc", 2)

-- TODO: reorganize all functions between groups

-- region bunkerSuppliesGroup
bunkerSuppliesGroup:new_button("Get supplies", function()
    script.get_global(1673814 + 5 + 1):write_u32(1)
    ui.popup("GOD SYSTEM", "Supplies should be arrived to your bunker.", Icons.CHECKMARK_SUCCESS, PopupType.BOX)
end)
-- endregion

-- region bunkerProductionGroup
STOCK_LOOP_CHECKBOX = bunkerProductionGroup:new_checkbox("Stock production loop")

bunkerProductionGroup:new_button("Trigger stock production", function()
    script.get_global(2708925 + 1 + 5 * 2):write_u32(1)
    script.get_global(2708925 + 1 + 5 * 2 + 1):write_bool(true)
    ui.popup("GOD SYSTEM", "Stock roduction triggered.", Icons.CHECKMARK_SUCCESS, PopupType.BOX)
end)

bunkerProductionGroup:new_button("Maximize stock price", function()
    local totalProdValue = stats.get_u32(string.smart_joaat("MP" .. stats.get_character_index() .. "_PRODTOTALFORFACTORY5"))
    local valueToSet = math.floor((2500000 / 1.5) / totalProdValue)
    tunables.set_int("GR_MANU_PRODUCT_VALUE", valueToSet)
    ui.popup("GOD SYSTEM", "Stock prize successfully maximized.", Icons.CHECKMARK_SUCCESS, PopupType.BOX)
end)

-- TODO: test that shi
bunkerProductionGroup:new_button("Reset stock price", function()
    tunables.set_int("GR_MANU_PRODUCT_VALUE", 5000)
    ui.popup("GOD SYSTEM", "Stock prize successfully reseted.", Icons.CHECKMARK_SUCCESS, PopupType.BOX)
end)
-- endregion

-- region bunkerSellGroup
bunkerSellGroup:new_button("Instant sell", function()
    -- TODO: test that shi (should give player exp on instant sell)
    tunables.set_float("XP_MULTIPLIER", 1.0)
    script.get_local("gb_gunrunning", 1268 + 774):write_u32(0)
    ui.popup("GOD SYSTEM", "Sell mission should have been finished.", Icons.CHECKMARK_SUCCESS, PopupType.BOX)
end)
-- endregion

-- region bunkerMiscGroup
bunkerMiscGroup:new_button("Teleport to your bunker", function ()
    -- TODO: create teleport to bunker blip using native.invoke(NativeReturnType.VECTOR3, 0x586AFE3FF72D996E)
    -- code below should return coordinates of bunker blip
    local x, y, z = native.invoke(NativeReturnType.VECTOR3, 0x586AFE3FF72D996E, 557)
    --                            ^ return type of          ^ hash id of        ^ bunker blip
    --                            native function           native function     sprite id
    --                                                      to invoke
    
    print(x)
    print(y)
    print(z)
end)

bunkerMiscGroup:new_button("Teleport to your bunker laptop", function ()
    -- TODO: create teleport to bunker laptop blip using native.invoke(NativeReturnType.VECTOR3, 0x586AFE3FF72D996E)
end)

-- TODO: test that shi
bunkerMiscGroup:new_button("Open bunker laptop", function ()
    if script.is_running("appbunkerbusiness") then
        ui.popup("GOD SYSTEM", "Laptop already opened.", Icons.CANCEL2, PopupType.BOX)
        return
    end

    script.start("appbunkerbusiness", 4592)
    ui.popup("GOD SYSTEM", "Bunker laptop successfully opened.", Icons.CHECKMARK_SUCCESS, PopupType.BOX)
end)
-- endregion

-- TODO: maybe add section with bunker stats editor?
