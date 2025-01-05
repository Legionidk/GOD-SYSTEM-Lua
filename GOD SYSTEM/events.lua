---- /godmode
-- Creating events
events.on_script_tick(function ()
	if crates_loop_checkbox:get() then
		for i = 12, 16 do
	        local state = stats.set_masked_int(string.smart_joaat('MP'..stats.get_character_index()..'_FIXERPSTAT_BOOL1'), 1, i, stats.get_character_index())
	        print(state)
		end
	end
	if hangar_crates_loop_checkbox:get() then
		stats.set_masked_int(string.smart_joaat('MP'..stats.get_character_index()..'_DLC22022PSTAT_BOOL3'), 1, 9, stats.get_character_index())
	end
end)

-- Popup on load
print('Event list loaded succesfully')
