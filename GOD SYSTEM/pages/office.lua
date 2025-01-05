---- /godmode
-- Creating subpage
local subpage = main_page:new_subpage('OFFICE')

-- Creating groups
local warehouses_group = subpage:new_group('Warehouses', GroupRect.TITLE):set_collapsed(true)
local office_group = subpage:new_group('Office', GroupRect.TITLE):set_collapsed(true)
local buy_group = subpage:new_group('Buy crates', GroupRect.BODY):set_collapsed(true)
local sell_group = subpage:new_group('Sell crates', GroupRect.BODY):set_collapsed(true)

-- Loading functions
require(fs.get_dir_script()..'GOD SYSTEM\\functions\\office_functions.lua')

---- Creating functions
-- Warehouses group
local warehouses_list = warehouses_group:new_table_list('Warehouses', {'Warehouse #0', 'Warehouse #1', 'Warehouse #2', 'Warehouse #3', 'Warehouse #4'})
warehouses_list:set_click_callback(function (item)
	picked_warehouse = item - 1
end)
local warehouse_info = warehouses_group:new_text(warehouse_info_function)
local tp_to_warehouse_button = warehouses_group:new_button('TP to warehouse', tp_to_warehouse_function)

-- Office group
local teleport_to_office_button = office_group:new_button('TP to office', tp_to_office_function)

-- Buy group
local total_crates = buy_group:new_text(total_crates_function)
crates_loop_checkbox = buy_group:new_checkbox('Crates loop')
local get_crates_button = buy_group:new_button('Get crates', get_crates_function)
local instant_buy_button = buy_group:new_button('Instant buy', instant_buy_function)
local instant_buy_full_button = buy_group:new_button('Instant buy 111 crates', instant_buy_full_function)
local delete_buy_cooldown_button = buy_group:new_button('Delete buy cooldown', delete_buy_cooldown_function)

-- Sell group
local instant_sell_button = sell_group:new_button('Instant sell', instant_sell_function)
local delete_sell_cooldown_button = sell_group:new_button('Delete sell cooldown', delete_sell_cooldown_function)

-- Popup on load
print('Office page loaded succesfully')
