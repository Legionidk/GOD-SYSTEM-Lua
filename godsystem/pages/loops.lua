-- Loops page
local loops = Main_page:new_subpage('LOOPS')

local loops_riskcheck = loops:new_group('Risk check', GroupRect.TITLE)
local loops_group = loops:new_group('Loops', GroupRect.BODY)
loops_group:set_visible(false)

-- Loops
Loops_group_nc_loop = loops_group:new_checkbox('Nigh Club Loop ($300k/2s)', false)
Loops_group_death_loop = loops_group:new_checkbox('Death Loop ($50k/1s)', false)
Loops_group_chips_loop = loops_group:new_checkbox('Chips Loop (5k/3s)', false)
Loops_group_nc_loop:set_hint('Fill safe in your Night Club.')

-- Risk check
local loops_riskcheck_text = loops_riskcheck:new_text('Use the functions in this section at your own risk.')
local loops_riskcheck_check = loops_riskcheck:new_button('Toggle risk functions', function ()
    if not loops_group:is_visible() then
        loops_group:set_visible(true)
    else
        loops_group:set_visible(false)
    end
end)

