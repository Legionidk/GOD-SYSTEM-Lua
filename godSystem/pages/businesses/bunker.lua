local bunkerSubpage = BUSINESSES_PAGE:new_subpage("Bunker")

local infoGroup = bunkerSubpage:new_group("Stock, supplies and research info", 1)
local stockPriceGroup = bunkerSubpage:new_group("Stock price", 1)
local stockProductionGroup = bunkerSubpage:new_group("Stock production", 2)
local stockSellGroup = bunkerSubpage:new_group("Sell stock", 2)
local suppliesGroup = bunkerSubpage:new_group("Supplies", 3)

-- region infoGroup
local stockInfoSlider = infoGroup:new_slider("Stock", 0, 100):set_enabled(false)
local researchInfoSlider = infoGroup:new_slider("Research", 0, 100):set_enabled(false)
local suppliesInfoSlider = infoGroup:new_slider("Supplies", 0, 100):set_enabled(false)

function UPDATE_BUNKER_INFO_SLIDERS()
    local bunkerStockHash = string.smart_joaat("MP" .. stats.get_character_index() .. "_PRODTOTALFORFACTORY5")
    local bunkerResearchHash = string.smart_joaat("MP" .. stats.get_character_index() .. "_RESEARCHTOTALFORFACTORY5")
    local bunkerSuppliesHash = string.smart_joaat("MP" .. stats.get_character_index() .. "_MATTOTALFORFACTORY5")

    stockInfoSlider:set(stats.get_u32(bunkerStockHash))
    researchInfoSlider:set(stats.get_u32(bunkerResearchHash))
    suppliesInfoSlider:set(stats.get_u32(bunkerSuppliesHash))
end

infoGroup:new_button("Update", UPDATE_BUNKER_INFO_SLIDERS())
-- endregion

-- region stockPriceGroup
local productionMultiplierSlider = stockPriceGroup:new_slider("Stock price multiplier", 1, 5)

-- TODO: What is the max multiplier can i set before game said that im retarded?
stockPriceGroup:new_button("Multiply stock price", function()
    tunables.set_int("GR_MANU_PRODUCT_VALUE", 5000 * productionMultiplierSlider:get())
    ui.popup("GOD SYSTEM", "Stock price successfully multiplied by " .. productionMultiplierSlider:get() .. ".",
    Icons.CHECKMARK_SUCCESS, PopupType.BOX)
end)

stockPriceGroup:new_button("Reset stock price", function()
    tunables.set_int("GR_MANU_PRODUCT_VALUE", 5000)
    ui.popup("GOD SYSTEM", "Stock price successfully reseted.", Icons.CHECKMARK_SUCCESS, PopupType.BOX)
end)
-- endregion

-- region stockProductionGroup
STOCK_LOOP_CHECKBOX = stockProductionGroup:new_checkbox("Stock production loop")

stockProductionGroup:new_button("Trigger stock production", function()
    script.get_global(2708925 + 1 + 5 * 2):write_u32(1)
    script.get_global(2708925 + 1 + 5 * 2 + 1):write_bool(true)

    UPDATE_BUNKER_INFO_SLIDERS()
    ui.popup("GOD SYSTEM", "Stock roduction triggered.", Icons.CHECKMARK_SUCCESS, PopupType.BOX)
end)
-- endregion

-- region stockSellGroup
stockSellGroup:new_button("Instant sell", function()
    if not script.is_running("gb_gunrunning") then
        ui.popup("GOD SYSTEM", "Sell mission not started.", Icons.CANCEL2, PopupType.BOX)
        return
    end

    script.get_local("gb_gunrunning", 1268 + 774):write_u32(0)

    UPDATE_BUNKER_INFO_SLIDERS()
    ui.popup("GOD SYSTEM", "Sell mission should have been finished.", Icons.CHECKMARK_SUCCESS, PopupType.BOX)
end)
-- endregion

-- region suppliesGroup
suppliesGroup:new_button("Get supplies", function()
    script.get_global(1673814 + 5 + 1):write_u32(1)

    UPDATE_BUNKER_INFO_SLIDERS()
    ui.popup("GOD SYSTEM", "Supplies should be arrived to your bunker.", Icons.CHECKMARK_SUCCESS, PopupType.BOX)
end)
-- endregion

-- TODO: maybe add section with bunker stats editor?
