local bunkerSubpage = BUSINESSES_PAGE:new_subpage("Bunker")

local bunkerStockPriceGroup = bunkerSubpage:new_group("Stock price", 1)
local bunkerStockSellGroup = bunkerSubpage:new_group("Sell stock", 1)
local bunkerStockProductionGroup = bunkerSubpage:new_group("Stock production", 2)
local bunkerSuppliesGroup = bunkerSubpage:new_group("Supplies", 2)

-- region bunkerStockPriceGroup
local productionMultiplierSlider = bunkerStockPriceGroup:new_slider("Stock price multiplier", 1, 5)

bunkerStockPriceGroup:new_button("Multiply stock price", function()
    tunables.set_int("GR_MANU_PRODUCT_VALUE", math.floor(5000 * productionMultiplierSlider:get()))
    ui.popup("GOD SYSTEM", "Stock price successfully multiplied by "..productionMultiplierSlider:get()..".", Icons.CHECKMARK_SUCCESS, PopupType.BOX)
end)

bunkerStockPriceGroup:new_button("Reset stock price", function()
    tunables.set_int("GR_MANU_PRODUCT_VALUE", 5000)
    ui.popup("GOD SYSTEM", "Stock price successfully reseted.", Icons.CHECKMARK_SUCCESS, PopupType.BOX)
end)
-- endregion

-- region bunkerStockSellGroup
bunkerStockSellGroup:new_button("Instant sell", function()
    if not script.is_running("gb_gunrunning") then
        ui.popup("GOD SYSTEM", "Sell mission not started.", Icons.CANCEL2, PopupType.BOX)
        return
    end

    script.get_local("gb_gunrunning", 1268 + 774):write_u32(0)
    ui.popup("GOD SYSTEM", "Sell mission should have been finished.", Icons.CHECKMARK_SUCCESS, PopupType.BOX)
end)
-- endregion

-- region bunkerStockProductionGroup
STOCK_LOOP_CHECKBOX = bunkerStockProductionGroup:new_checkbox("Stock production loop")

bunkerStockProductionGroup:new_button("Trigger stock production", function()
    script.get_global(2708925 + 1 + 5 * 2):write_u32(1)
    script.get_global(2708925 + 1 + 5 * 2 + 1):write_bool(true)
    ui.popup("GOD SYSTEM", "Stock roduction triggered.", Icons.CHECKMARK_SUCCESS, PopupType.BOX)
end)
-- endregion

-- region bunkerSuppliesGroup
bunkerSuppliesGroup:new_button("Get supplies", function()
    script.get_global(1673814 + 5 + 1):write_u32(1)
    ui.popup("GOD SYSTEM", "Supplies should be arrived to your bunker.", Icons.CHECKMARK_SUCCESS, PopupType.BOX)
end)
-- endregion

-- TODO: maybe add section with bunker stats editor?
