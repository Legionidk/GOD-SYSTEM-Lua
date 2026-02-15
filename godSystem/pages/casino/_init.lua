local casinoPage = ui.new_page("/GS/ Casino", Icons.GAMEPAD)
local casinoSubpage = casinoPage:new_subpage("Casino")

local chipsGroup = casinoPage:new_group("Chips", 1)
local slotsGroup = casinoSubpage:new_group("Slots", 1)
local luckyWheelGroup = casinoSubpage:new_group("Lucky wheel", 2)
local cooldownsGroup = casinoSubpage:new_group("Cooldowns", 3)
local rouletteGroup = casinoSubpage:new_group("Roulette", 3):set_visible(false)

-- region data
local luckyWheelDropData = {
    names = {
        "Clothing (1)", "Clothing (2)", "Clothing (3)",
        "2,500 RP", "5,000 RP", "7,500 RP", "10,000 RP", "15,000 RP",
        "$20,000", "$30,000", "$40,000", "$50,000",
        "10,000 Chips", "15,000 Chips", "20,000 Chips", "25,000 Chips",
        "Discount", "Mystery", "Vehicle",
    },
    indexes = {
        0, 8, 12,
        1, 5, 9, 13, 17,
        2, 6, 14, 19,
        3, 7, 10, 15,
        4, 11, 18
    }
}

local cooldownsData = {
    "MPPLY_CASINO_CHIPS_WON_GD",
    "MPPLY_CASINO_CHIPS_WONTIM",
    "MPPLY_CASINO_GMBLNG_GD",
    "MPPLY_CASINO_BAN_TIME",
    "MPPLY_CASINO_CHIPS_PURTIM",
    "MPPLY_CASINO_CHIPS_PUR_GD"
}
-- endregion

-- region chipsGroup
local limitNumberSlider = chipsGroup:new_slider("Limit number", 20000, 2147483647)

chipsGroup:new_button("Set new acquire limit", function ()
    tunables.set_int("VC_CASINO_CHIP_MAX_BUY", limitNumberSlider:get())
    tunables.set_int("VC_CASINO_CHIP_MAX_BUY_PENTHOUSE", limitNumberSlider:get())
    ui.popup("GOD SYSTEM", "Acquire limit has been changed.", Icons.CHECKMARK_SUCCESS, PopupType.BOX)
end)

chipsGroup:new_button("Set new trade in limit", function ()
    tunables.set_int("VC_CASINO_CHIP_MAX_SELL", limitNumberSlider:get())
    ui.popup("GOD SYSTEM", "Trade in limit has been changed.", Icons.CHECKMARK_SUCCESS, PopupType.BOX)
end)

chipsGroup:new_button("Reset all limits", function ()
    tunables.set_int("VC_CASINO_CHIP_MAX_BUY", 20000)
    tunables.set_int("VC_CASINO_CHIP_MAX_BUY_PENTHOUSE", 50000)
    tunables.set_int("VC_CASINO_CHIP_MAX_SELL", 10000000)
    ui.popup("GOD SYSTEM", "All limits has been changed.", Icons.CHECKMARK_SUCCESS, PopupType.BOX)
end)
-- endregion

-- region slotsGroup
slotsGroup:new_button("Win slots", function ()
    if not script.is_running("casino_slots") then
        ui.popup("GOD SYSTEM", "You're not in the casino.", Icons.CANCEL2, PopupType.BOX)
        return
    end

    for i = 3, 196 do
        if i ~= 67 and i ~= 132 then
            script.get_local("casino_slots", 1374 + i):write_u32(6)
        end
    end
    ui.popup("GOD SYSTEM", "Win has been successfully applied, roll the slot!", Icons.CHECKMARK_SUCCESS, PopupType.BOX)
end)

slotsGroup:new_button("Lose slots", function ()
    if not script.is_running("casino_slots") then
        ui.popup("GOD SYSTEM", "You're not in the casino.", Icons.CANCEL2, PopupType.BOX)
        return
    end

    for i = 3, 196 do
        if i ~= 67 and i ~= 132 then
            script.get_local("casino_slots", 1374 + i):write_u32(0)
        end
    end
    ui.popup("GOD SYSTEM", "Lose has been successfully applied, roll the slot!", Icons.CHECKMARK_SUCCESS, PopupType.BOX)
end)
-- endregion

-- region luckyWheelGroup
luckyWheelGroup:new_text("Click on item in list below while you're on a casino to instant drop from lucky wheel.")

local luckyWheelDropTable = luckyWheelGroup:new_table_list("Lucky wheel drop", luckyWheelDropData.names)

luckyWheelDropTable:set_click_callback(function (index)
    if not script.is_running("casino_lucky_wheel") then
        ui.popup("GOD SYSTEM", "You're not in the casino.", Icons.CANCEL2, PopupType.BOX)
        return
    end

    script.get_local("casino_lucky_wheel", 304 + 14):write_u32(luckyWheelDropData.indexes[index])
    script.get_local("casino_lucky_wheel", 304 + 45):write_u32(11)
    ui.popup("GOD SYSTEM", "Drop from lucky wheel has been successfully given to you: "..luckyWheelDropData.names[index]..".", Icons.CHECKMARK_SUCCESS, PopupType.BOX)
end)

luckyWheelDropTable:set_hint("test")
-- endregion

-- region cooldownsGroup
cooldownsGroup:new_button("Delete all cooldowns", function ()
    for _, v in pairs(cooldownsData) do
        local stat_hash = string.smart_joaat(v)
        stats.set_u32(stat_hash, 0)
    end

    ui.popup("GOD SYSTEM", "All cooldowns has been deleted.", Icons.CHECKMARK_SUCCESS, PopupType.BOX)
end)
-- endregion

-- region rouletteGroup
rouletteGroup:new_button("Land on black 13", function ()
    script.force_host("casinoroulette", function ()
        for i = 0, 5 do
            script.get_local("casinoroulette", 148 + 1357 + 153 + i):write_u32(13)
            ui.popup("GOD SYSTEM", "Ball will now land on black 13.", Icons.CHECKMARK_SUCCESS, PopupType.BOX)
            return
        end
    end)
end)
-- endregion

print("[GOD SYSTEM] Casino page successfully loaded.")
