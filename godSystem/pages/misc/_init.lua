MISC_PAGE = ui.new_page("/GS/ Miscellaneous", Icons.PLUS)
local miscSubpage = MISC_PAGE:new_subpage("Miscellaneous")

local storyModeGroup = miscSubpage:new_group("Story mode", 1)

-- region storyModeGroup
storyModeGroup:new_button("Set maximum money for story mode", function ()
    for i = 0, 2 do
        stats.set_u32(string.smart_joaat("SP"..i.."_TOTAL_CASH"), 2147483647)
    end

    ui.popup("GOD SYSTEM", "Money on all story mode characters successfully changed.", Icons.CHECKMARK_SUCCESS, PopupType.BOX)
end)
-- endregion

print("[GOD SYSTEM] Miscellaneous page successfully loaded.")
