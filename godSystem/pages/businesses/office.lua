local officeSubpage = BUSINESSES_PAGE:new_subpage("Office")

local infoGroup = officeSubpage:new_group("Warehouses info", 1)
local cratesPriceGroup = officeSubpage:new_group("Crate price", 1)
local cratesBuyGroup = officeSubpage:new_group("Buy crates", 2)
local cratesSellGroup = officeSubpage:new_group("Sell crates", 2)
local cooldownsGroup = officeSubpage:new_group("Cooldowns", 3)

-- region data
-- data by Silent / https://github.com/SilentSalo/SilentNight
local cratePricesData = {
    {tunable = "EXEC_CONTRABAND_SALE_VALUE_THRESHOLD1",  defaultValue = 10000},
    {tunable = "EXEC_CONTRABAND_SALE_VALUE_THRESHOLD2",  defaultValue = 11000},
    {tunable = "EXEC_CONTRABAND_SALE_VALUE_THRESHOLD3",  defaultValue = 12000},
    {tunable = "EXEC_CONTRABAND_SALE_VALUE_THRESHOLD4",  defaultValue = 13000},
    {tunable = "EXEC_CONTRABAND_SALE_VALUE_THRESHOLD5",  defaultValue = 13500},
    {tunable = "EXEC_CONTRABAND_SALE_VALUE_THRESHOLD6",  defaultValue = 14000},
    {tunable = "EXEC_CONTRABAND_SALE_VALUE_THRESHOLD7",  defaultValue = 14500},
    {tunable = "EXEC_CONTRABAND_SALE_VALUE_THRESHOLD8",  defaultValue = 15000},
    {tunable = "EXEC_CONTRABAND_SALE_VALUE_THRESHOLD9",  defaultValue = 15500},
    {tunable = "EXEC_CONTRABAND_SALE_VALUE_THRESHOLD10", defaultValue = 16000},
    {tunable = "EXEC_CONTRABAND_SALE_VALUE_THRESHOLD11", defaultValue = 16500},
    {tunable = "EXEC_CONTRABAND_SALE_VALUE_THRESHOLD12", defaultValue = 17000},
    {tunable = "EXEC_CONTRABAND_SALE_VALUE_THRESHOLD13", defaultValue = 17500},
    {tunable = "EXEC_CONTRABAND_SALE_VALUE_THRESHOLD14", defaultValue = 17750},
    {tunable = "EXEC_CONTRABAND_SALE_VALUE_THRESHOLD15", defaultValue = 18000},
    {tunable = "EXEC_CONTRABAND_SALE_VALUE_THRESHOLD16", defaultValue = 18250},
    {tunable = "EXEC_CONTRABAND_SALE_VALUE_THRESHOLD17", defaultValue = 18500},
    {tunable = "EXEC_CONTRABAND_SALE_VALUE_THRESHOLD18", defaultValue = 18750},
    {tunable = "EXEC_CONTRABAND_SALE_VALUE_THRESHOLD19", defaultValue = 19000},
    {tunable = "EXEC_CONTRABAND_SALE_VALUE_THRESHOLD20", defaultValue = 19500},
    {tunable = "EXEC_CONTRABAND_SALE_VALUE_THRESHOLD21", defaultValue = 20000}
}

local warehousesData = {
    [0]  = {name = "Warehouse not found"},
    [1]  = {name = "Pacific Bait Storage",      coords = {x = 54.191,    y = -2569.248, z = 6.0046 }},
    [2]  = {name = "White Widow Garage",        coords = {x = -1083.054, y = -1261.893, z = 5.534  }},
    [3]  = {name = "Celltowa Unit",             coords = {x = 896.3665,  y = -1035.749, z = 35.1096}},
    [4]  = {name = "Convenience Store Lockup",  coords = {x = 247.473,   y = -1956.943, z = 23.1908}},
    [5]  = {name = "Foreclosed Garage",         coords = {x = -424.828,  y = 185.825,   z = 80.775 }},
    [6]  = {name = "Xero Gas Factory",          coords = {x = -1042.482, y = -2023.516, z = 13.1616}},
    [7]  = {name = "Derriere Lingerie Backlot", coords = {x = -1268.119, y = -812.2741, z = 17.1075}},
    [8]  = {name = "Bilgeco Warehouse",         coords = {x = -874,      y = -2736,     z = 13.9438}},
    [9]  = {name = "Pier 400 Utility Building", coords = {x = 274.5224,  y = -3015.413, z = 5.6993 }},
    [10] = {name = "GEE Warehouse",             coords = {x = 1569.69,   y = -2129.792, z = 78.3351}},
    [11] = {name = "LS Marine Building 3",      coords = {x = -315.551,  y = -2698.654, z = 7.5495 }},
    [12] = {name = "Railyard Warehouse",        coords = {x = 499.81,    y = -651.982,  z = 24.909 }},
    [13] = {name = "Fridgit Annexe",            coords = {x = -528.5296, y = -1784.573, z = 21.5853}},
    [14] = {name = "Disused Factory Outlet",    coords = {x = -295.8596, y = -1353.238, z = 31.3138}},
    [15] = {name = "Discount Retail Unit",      coords = {x = 349.839,   y = 328.889,   z = 104.272}},
    [16] = {name = "Logistics Depot",           coords = {x = 926.2818,  y = -1560.311, z = 30.7404}},
    [17] = {name = "Darnell Bros Warehouse",    coords = {x = 759.566,   y = -909.466,  z = 25.244 }},
    [18] = {name = "Wholesale Furniture",       coords = {x = 1037.813,  y = -2173.062, z = 31.5334}},
    [19] = {name = "Cypress Warehouses",        coords = {x = 1019.116,  y = -2511.69,  z = 28.302 }},
    [20] = {name = "West Vinewood Backlot",     coords = {x = -245.3405, y = 203.3286,  z = 83.818 }},
    [21] = {name = "Old Power Station",         coords = {x = 539.346,   y = -1945.682, z = 24.984 }},
    [22] = {name = "Walker & Sons Warehouse",   coords = {x = 96.1538,   y = -2216.4,   z = 6.1712 }}
}
-- endregion

-- region infoGroup
SELECTED_WAREHOUSE_SLOT = 0

infoGroup:new_text(function ()
    local warehouseHash = string.smart_joaat("MP"..stats.get_character_index().."_PROP_WHOUSE_SLOT"..SELECTED_WAREHOUSE_SLOT)
    return warehousesData[stats.get_u32(warehouseHash)].name
end)

SELECTED_CRATES_SLIDER = infoGroup:new_slider("Сrates on selected warehouse", 0, 111):set_enabled(false)

TOTAL_CRATES_SLIDER = infoGroup:new_slider("Total crates", 0, 555):set_enabled(false)

local warehouseSlotSelectList = infoGroup:new_table_list("", {
    "Warehouse slot #1", "Warehouse slot #2", "Warehouse slot #3", "Warehouse slot #4", "Warehouse slot #5"
})
warehouseSlotSelectList:set_sizes(0, 102)
warehouseSlotSelectList:set_click_callback(function (item)
    SELECTED_WAREHOUSE_SLOT = item - 1
end)

infoGroup:new_button("Teleport to selected warehouse", function ()
    local warehouseHash = string.smart_joaat("MP"..stats.get_character_index().."_PROP_WHOUSE_SLOT"..SELECTED_WAREHOUSE_SLOT)
    local warehouseData = warehousesData[stats.get_u32(warehouseHash)]

    if warehouseData == 0 then
        ui.popup("GOD SYSTEM", "Warehouse on that slot is not found.", Icons.CANCEL2, PopupType.BOX)
        return
    end

    utils.teleport_self(warehouseData.coords.x, warehouseData.coords.y, warehouseData.coords.z)
    ui.popup("GOD SYSTEM", "Successfully teleported to "..warehouseData.name..".", Icons.CHECKMARK_SUCCESS, PopupType.BOX)
end)
-- endregion

-- region cratesPriceGroup
local cratesPriceSlider = cratesPriceGroup:new_slider("Price per crate", 100000, 860000)

cratesPriceGroup:new_button("Set new crate price", function ()
    for _, v in pairs(cratePricesData) do
        tunables.set_int(v.tunable, cratesPriceSlider:get())
    end

    ui.popup("GOD SYSTEM", "Crate price successfully changed.", Icons.CHECKMARK_SUCCESS, PopupType.BOX)
end)

cratesPriceGroup:new_button("Reset crate price", function ()
    for _, v in pairs(cratePricesData) do
        tunables.set_int(v.tunable, v.defaultValue)
    end

    ui.popup("GOD SYSTEM", "Crate price successfully reseted.", Icons.CHECKMARK_SUCCESS, PopupType.BOX)
end)
-- endregion

-- region cratesBuyGroup
local fullBuyCheckbox = cratesBuyGroup:new_checkbox("Fill full warehouse on instant buy")

cratesBuyGroup:new_button("Instant buy", function ()
    if not script.is_running("gb_contraband_buy") then
        ui.popup("GOD SYSTEM", "Buy mission not started.", Icons.CANCEL2, PopupType.BOX)
        return
    end

    if fullBuyCheckbox:get() then
        script.get_local("gb_contraband_buy", 627 + 1):write_u32(111)
    end

    script.get_local("gb_contraband_buy", 627 + 5):write_u32(1)
    script.get_local("gb_contraband_buy", 627 + 191):write_u32(6)
    script.get_local("gb_contraband_buy", 627 + 192):write_u32(4)
    ui.popup("GOD SYSTEM", "Buy mission should have been finished.", Icons.CHECKMARK_SUCCESS, PopupType.BOX)
end)
-- endregion

-- region cratesSellGroup
cratesSellGroup:new_button("Instant sell", function ()
    if not script.is_running("gb_contraband_sell") then
        ui.popup("GOD SYSTEM", "Sell mission not started.", Icons.CANCEL2, PopupType.BOX)
        return
    end

    script.get_local("gb_contraband_sell", 569 + 7):write_u32(7)
    script.get_local("gb_contraband_sell", 569 + 1):write_u32(99999)
    ui.popup("GOD SYSTEM", "Sell mission should have been finished.", Icons.CHECKMARK_SUCCESS, PopupType.BOX)
end)
-- endregion

-- region cooldownsGroup
cooldownsGroup:new_button("Remove buy mission cooldown", function ()
	tunables.set_int("EXEC_BUY_COOLDOWN", 0)
    ui.popup("GOD SYSTEM", "Buy cooldown should have been removed.", Icons.CHECKMARK_SUCCESS, PopupType.BOX)
end)

cooldownsGroup:new_button("Remove sell mission cooldown", function ()
	tunables.set_int("EXEC_SELL_COOLDOWN", 0)
    ui.popup("GOD SYSTEM", "Sell cooldown should have been removed.", Icons.CHECKMARK_SUCCESS, PopupType.BOX)
end)
-- endregion
