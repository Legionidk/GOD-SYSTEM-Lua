---- /godmode
-- Creating subpage
local subpage = main_page:new_subpage('BUSINESSES')

-- Creating groups
local bunker_group = subpage:new_group('Bunker', GroupRect.TITLE):set_collapsed(true)
local hangar_group = subpage:new_group('Hangar', GroupRect.TITLE):set_collapsed(true):set_collapsed(true)
local clubhouse_group = subpage:new_group('Clubhouse', GroupRect.BODY):set_collapsed(true)
local acid_group = subpage:new_group('Acid lab', GroupRect.BODY):set_collapsed(true)

-- Loading functions
require(fs.get_dir_script()..'GOD SYSTEM\\functions\\businesses_functions.lua')

---- Creating functions
-- Bunker group
local bunker_info = bunker_group:new_text(bunker_info_function)
local tp_to_bunker_button = bunker_group:new_button('TP to bunker', tp_to_bunker_function)
local ressuply_bunker = bunker_group:new_button('Get supplies', ressuply_bunker_function)

-- Hangar group
hangar_crates_loop_checkbox = hangar_group:new_checkbox('Crates loop')
local hangar_instant_sell_button = hangar_group:new_button('Instant sell', hangar_instant_sell_function)

-- Clubhouse group
local ch_resupply_all_button = clubhouse_group:new_button('Get all supplies', ch_resupply_all_function)
local ch_resupply_cash_button = clubhouse_group:new_button('Get supplies for cash', ch_resupply_cash_function)
local ch_resupply_coke_button = clubhouse_group:new_button('Get supplies for coke', ch_resupply_coke_function)
local ch_resupply_weed_button = clubhouse_group:new_button('Get supplies for weed', ch_resupply_weed_function)
local ch_resupply_meth_button = clubhouse_group:new_button('Get supplies for meth', ch_resupply_meth_function)
local ch_resupply_docs_button = clubhouse_group:new_button('Get supplies for documents', ch_resupply_docs_function)

-- Acid group
local acid_resupply_button = acid_group:new_button('Get supplies', acid_resupply_function)

-- Popup on load
print('Businesses page loaded succesfully')
