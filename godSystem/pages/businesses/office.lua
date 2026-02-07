local officeSubpage = BUSINESSES_PAGE:new_subpage("Office")

local cratesPriceGroup = officeSubpage:new_group("Crate price", 1)
local cratesBuyGroup = officeSubpage:new_group("Buy crates", 2)
local cratesSellGroup = officeSubpage:new_group("Sell crates", 2)
local cooldownsGroup = officeSubpage:new_group("Cooldowns", 3)

-- region data
-- price data by Silent / https://github.com/SilentSalo/SilentNight
local cratePricesData = {
    [1]  = { tunable = "EXEC_CONTRABAND_SALE_VALUE_THRESHOLD1",  defaultValue = 10000 },
    [2]  = { tunable = "EXEC_CONTRABAND_SALE_VALUE_THRESHOLD2",  defaultValue = 11000 },
    [3]  = { tunable = "EXEC_CONTRABAND_SALE_VALUE_THRESHOLD3",  defaultValue = 12000 },
    [4]  = { tunable = "EXEC_CONTRABAND_SALE_VALUE_THRESHOLD4",  defaultValue = 13000 },
    [5]  = { tunable = "EXEC_CONTRABAND_SALE_VALUE_THRESHOLD5",  defaultValue = 13500 },
    [6]  = { tunable = "EXEC_CONTRABAND_SALE_VALUE_THRESHOLD6",  defaultValue = 14000 },
    [7]  = { tunable = "EXEC_CONTRABAND_SALE_VALUE_THRESHOLD7",  defaultValue = 14500 },
    [8]  = { tunable = "EXEC_CONTRABAND_SALE_VALUE_THRESHOLD8",  defaultValue = 15000 },
    [9]  = { tunable = "EXEC_CONTRABAND_SALE_VALUE_THRESHOLD9",  defaultValue = 15500 },
    [10] = { tunable = "EXEC_CONTRABAND_SALE_VALUE_THRESHOLD10", defaultValue = 16000 },
    [11] = { tunable = "EXEC_CONTRABAND_SALE_VALUE_THRESHOLD11", defaultValue = 16500 },
    [12] = { tunable = "EXEC_CONTRABAND_SALE_VALUE_THRESHOLD12", defaultValue = 17000 },
    [13] = { tunable = "EXEC_CONTRABAND_SALE_VALUE_THRESHOLD13", defaultValue = 17500 },
    [14] = { tunable = "EXEC_CONTRABAND_SALE_VALUE_THRESHOLD14", defaultValue = 17750 },
    [15] = { tunable = "EXEC_CONTRABAND_SALE_VALUE_THRESHOLD15", defaultValue = 18000 },
    [16] = { tunable = "EXEC_CONTRABAND_SALE_VALUE_THRESHOLD16", defaultValue = 18250 },
    [17] = { tunable = "EXEC_CONTRABAND_SALE_VALUE_THRESHOLD17", defaultValue = 18500 },
    [18] = { tunable = "EXEC_CONTRABAND_SALE_VALUE_THRESHOLD18", defaultValue = 18750 },
    [19] = { tunable = "EXEC_CONTRABAND_SALE_VALUE_THRESHOLD19", defaultValue = 19000 },
    [20] = { tunable = "EXEC_CONTRABAND_SALE_VALUE_THRESHOLD20", defaultValue = 19500 },
    [21] = { tunable = "EXEC_CONTRABAND_SALE_VALUE_THRESHOLD21", defaultValue = 20000 }
}
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
        ui.popup("GOD SYSTEM", "Sell mission not started.", Icons.CANCEL2, PopupType.BOX)
        return
    end

    if fullBuyCheckbox:get() then
        script.get_local('gb_contraband_buy', 627 + 1):write_u32(111)
    end

    script.get_local("gb_contraband_buy", 627 + 5):write_u32(1)
    script.get_local("gb_contraband_buy", 627 + 191):write_u32(6)
    script.get_local("gb_contraband_buy", 627 + 192):write_u32(4)
    ui.popup("GOD SYSTEM", "Sell mission should have been finished.", Icons.CHECKMARK_SUCCESS, PopupType.BOX)
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
end)
-- endregion

-- region cooldownsGroup
cooldownsGroup:new_button("Remove buy mission cooldown", function ()
	tunables.set_int('EXEC_BUY_COOLDOWN', 0)
    ui.popup("GOD SYSTEM", "Buy cooldown should have been removed.", Icons.CHECKMARK_SUCCESS, PopupType.BOX)
end)

cooldownsGroup:new_button("Remove sell mission cooldown", function ()
	tunables.set_int('EXEC_SELL_COOLDOWN', 0)
    ui.popup("GOD SYSTEM", "Sell cooldown should have been removed.", Icons.CHECKMARK_SUCCESS, PopupType.BOX)
end)
-- endregion
