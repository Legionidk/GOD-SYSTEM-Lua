-- LOOPS
local LOOPS = Main_page:new_subpage('LOOPS')

local LOOPS_RISK_CHECK = LOOPS:new_group('Risk check', GroupRect.TITLE)
local LOOPS_GROUP = LOOPS:new_group('Loops', GroupRect.BODY)
LOOPS_GROUP:set_visible(false)

-- Loops
LOOPS_GROUP_NC = LOOPS_GROUP:new_checkbox('Nigh Club loop ($300k/2s)', false)

LOOPS_GROUP_DEATH = LOOPS_GROUP:new_checkbox('Death loop ($50k/1s)', false)

LOOPS_GROUP_DEATH:set_visible(false)

LOOPS_GROUP_CHIPS = LOOPS_GROUP:new_checkbox('Chips loop (5k/3s)', false)

LOOPS_GROUP_NC:set_hint('Fill safe in your Night Club.')

-- Risk check
LOOPS_RISK_CHECK_TIP = LOOPS_RISK_CHECK:new_text('Use the functions in this section at your own risk.')

LOOPS_RISK_CHECK_TOGGLE = LOOPS_RISK_CHECK:new_button('Toggle risk functions', function ()
    if not LOOPS_GROUP:is_visible() then
        LOOPS_GROUP:set_visible(true)
    else
        LOOPS_GROUP:set_visible(false)
    end
end)
