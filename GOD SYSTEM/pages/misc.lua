---- /godmode
-- Creating subpage
local subpage = main_page:new_subpage('MISC')

-- Creating groups
local unlocks_group = subpage:new_group('Unlocks', GroupRect.TITLE):set_collapsed(true)
local other_group = subpage:new_group('Other', GroupRect.BODY):set_collapsed(true)

-- Loading functions
require(fs.get_dir_script()..'GOD SYSTEM\\functions\\misc_functions.lua')

---- Creating functions
-- Unlocks group
local unlock_deleted_vehs_button = unlocks_group:new_button('Unlock deleted vehicles', unlock_deleted_vehs_function)
local unlock_ls_carmeet_vehicle_button = unlocks_group:new_button('Unlock LS Car Meet podium prize', unlock_ls_carmeet_vehicle_function)

-- Other group
local tp_to_gunvan_button = other_group:new_button('TP to gunvan', tp_to_gunvan_function)

-- Popup on load
print('Misc page loaded succesfully')
