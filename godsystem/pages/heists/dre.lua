--- Скип побочек ----------------------------------------------------

Dre = Submenu.add_static_submenu('Agency', 'HC_Agency')
Heists:add_sub_option('Agency', 'HC_Agency', Dre)

Dre:add_click_option('Complete preps', 'HC_Dre', function()
    stats.set_u32(string.smart_joaat('MP'..mp()..'_FIXER_STORY_BS'), 4092)
    stats.set_u32(string.smart_joaat('MP'..mp()..'_FIXER_STORY_STRAND'), -1)
    notify.success('Dr Dre', 'Done')
end)

--- Макс выплата ----------------------------------------------------

Dre:add_click_option('Max payout (2.5m)', 'HC_Dre_MaxPayout', function()
    script_global:new(262145):at(32071):set_int64(2500000)
    notify.success('Dr Dre', 'Done')
end):setHint('Activate after mission starts.')
