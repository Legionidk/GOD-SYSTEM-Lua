local bunkerSubpage = BUSINESSES_PAGE:new_subpage("Bunker")

local infoGroup = bunkerSubpage:new_group("Stock, research and supplies info", 1)
local stockPriceGroup = bunkerSubpage:new_group("Stock price", 1)
local stockProductionGroup = bunkerSubpage:new_group("Stock production", 2)
local stockSellGroup = bunkerSubpage:new_group("Sell stock", 2)
local suppliesGroup = bunkerSubpage:new_group("Supplies", 3)

-- region data
local bunkersData = {
    [0]  = {name = "Bunker not found"},
    [21] = {name = "Grand Senora Oilfields Bunker", coords = {x = 492.8395,  y = 3014.057, z = 39.9793}},
    [22] = {name = "Grand Senora Desert Bunker",    coords = {x = 849.603,   y = 3021.697, z = 40.3076}},
    [23] = {name = "Route 68 Bunker",               coords = {x = 39.5967,   y = 2930.506, z = 54.8034}},
    [24] = {name = "Farmhouse Bunker",              coords = {x = 1572.078,  y = 2226.001, z = 77.2829}},
    [25] = {name = "Smoke Tree Road Bunker",        coords = {x = 2110.019,  y = 3326.12,  z = 44.3526}},
    [26] = {name = "Thomson Scrapyard Bunker",      coords = {x = 2489.36,   y = 3162.12,  z = 48.0015}},
    [27] = {name = "Grapeseed Bunker",              coords = {x = 1801.273,  y = 4705.483, z = 38.8253}},
    [28] = {name = "Paleto Forest Bunker",          coords = {x = -755.5687, y = 5943.835, z = 18.9008}},
    [29] = {name = "Raton Canyon Bunker",           coords = {x = -388.8392, y = 4340.109, z = 55.1741}},
    [30] = {name = "Lago Zancudo Bunker",           coords = {x = -3031.356, y = 3334.059, z = 9.1805 }},
    [31] = {name = "Chumash Bunker",                coords = {x = -3157.599, y = 1376.695, z = 15.866 }}
}
-- endregion

-- region infoGroup
STOCK_INFO_SLIDER = infoGroup:new_slider("Stock", 0, 100):set_enabled(false)
RESEARCH_INFO_SLIDER = infoGroup:new_slider("Research", 0, 100):set_enabled(false)
SUPPLIES_INFO_SLIDER = infoGroup:new_slider("Supplies", 0, 100):set_enabled(false)

infoGroup:new_button("Teleport to your bunker", function ()
    local bunkerHash = string.smart_joaat('MP'..stats.get_character_index()..'_FACTORYSLOT5')
    local bunkerData = bunkersData[stats.get_u32(bunkerHash)]

    if bunkerData == 0 then
        ui.popup("GOD SYSTEM", "Bunker is not found.", Icons.CANCEL2, PopupType.BOX)
        return
    end

    utils.teleport_self(bunkerData.coords.x, bunkerData.coords.y, bunkerData.coords.z)
    ui.popup("GOD SYSTEM", "Successfully teleported to "..bunkerData.name..".", Icons.CHECKMARK_SUCCESS, PopupType.BOX)
end)
-- endregion

-- region stockPriceGroup
local productionMultiplierSlider = stockPriceGroup:new_slider("Stock price multiplier", 2, 500)

stockPriceGroup:new_button("Multiply stock price", function()
    tunables.set_int("GR_MANU_PRODUCT_VALUE", 5000 * productionMultiplierSlider:get())
    ui.popup("GOD SYSTEM", "Stock price successfully multiplied by " .. productionMultiplierSlider:get() .. ".",Icons.CHECKMARK_SUCCESS, PopupType.BOX)
end)

stockPriceGroup:new_button("Reset stock price", function()
    tunables.set_int("GR_MANU_PRODUCT_VALUE", 5000)
    ui.popup("GOD SYSTEM", "Stock price successfully reset.", Icons.CHECKMARK_SUCCESS, PopupType.BOX)
end)
-- endregion

-- region stockProductionGroup
STOCK_LOOP_CHECKBOX = stockProductionGroup:new_checkbox("Stock production loop")

stockProductionGroup:new_button("Trigger stock production", function()
    script.get_global(2708925 + 1 + 5 * 2):write_u32(1)
    script.get_global(2708925 + 1 + 5 * 2 + 1):write_bool(true)

    UPDATE_BUNKER_INFO_SLIDERS()
    ui.popup("GOD SYSTEM", "Stock production triggered.", Icons.CHECKMARK_SUCCESS, PopupType.BOX)
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
