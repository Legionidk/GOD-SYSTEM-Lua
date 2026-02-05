local officeSubpage = BUSINESSES_PAGE:new_subpage("Office")

local cratesBuyGroup = officeSubpage:new_group("Crates buy", 1)
local cratesSellGroup = officeSubpage:new_group("Crates sell", 1)
local cooldownsGroup = officeSubpage:new_group("Cooldowns", 2)

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

    script.get_local('gb_contraband_buy', 627 + 5):write_u32(1)
    script.get_local('gb_contraband_buy', 627 + 191):write_u32(6)
    script.get_local('gb_contraband_buy', 627 + 192):write_u32(4)
    ui.popup("GOD SYSTEM", "Sell mission should have been finished.", Icons.CHECKMARK_SUCCESS, PopupType.BOX)
end)
-- endregion

-- region cooldownsGroup
cooldownsGroup:new_button("Remove buy cooldown", function ()
	tunables.set_int('EXEC_BUY_COOLDOWN', 0)
    ui.popup("GOD SYSTEM", "Buy cooldown should have been removed.", Icons.CHECKMARK_SUCCESS, PopupType.BOX)
end)

cooldownsGroup:new_button("Remove sell cooldown", function ()
	tunables.set_int('EXEC_SELL_COOLDOWN', 0)
    ui.popup("GOD SYSTEM", "Sell cooldown should have been removed.", Icons.CHECKMARK_SUCCESS, PopupType.BOX)
end)
-- endregion
