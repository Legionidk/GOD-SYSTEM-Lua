-- OFFICE
OFFICE = Main_page:new_subpage('OFFICE')

OFFICE_WAREHOUSES_GROUP = OFFICE:new_group('Warehouses', GroupRect.TITLE)
OFFICE_CRATESBUY_GROUP = OFFICE:new_group('Crates buy', GroupRect.BODY)
OFFICE_CRATESSELL_GROUP = OFFICE:new_group('Crates sell', GroupRect.BODY)
OFFICE_GROUP = OFFICE:new_group('Office', GroupRect.TITLE)

-- Office
OFFICE_GROUP_TP = OFFICE_GROUP:new_button('TP to office', function ()
    local office_hash = string.smart_joaat('MP'..stats.get_character_index()..'_PROP_OFFICE')
    local office_stat = stats.get_u32(office_hash)
    if office_stat ~= 0 then
        local info = OFFICES[office_stat]
        utils.teleport_self(info.coords.x, info.coords.y, info.coords.z)
        ui.popup('GOD SYSTEM', 'Teleported to '..info.name..'.', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
    else
        ui.popup('GOD SYSTEM', 'Office not found.', Icons.CANCEL2, PopupType.BOX)
    end
end)

-- Warehouses
OFFICE_WAREHOUSES_GROUP_LIST = OFFICE_WAREHOUSES_GROUP:new_table_list('Warehouses', {'Warehouse #0', 'Warehouse #1', 'Warehouse #2', 'Warehouse #3', 'Warehouse #4'})

OFFICE_WAREHOUSES_GROUP_LIST:set_click_callback(function (item)
    PICKED_WAREHOUSE = item - 1
end)

OFFICE_WAREHOUSES_GROUP_NAME = OFFICE_WAREHOUSES_GROUP:new_text(function ()
    if native.is_invoker_ready() and stats.exists(LAST_MP_CHAR_HASH) then
        local warehouse_hash = string.smart_joaat('MP'..stats.get_character_index()..'_PROP_WHOUSE_SLOT'..PICKED_WAREHOUSE)
        local crates_hash = string.smart_joaat('MP'..stats.get_character_index()..'_CONTOTALFORWHOUSE'..PICKED_WAREHOUSE)
        if not stats.exists(warehouse_hash) or not stats.exists(crates_hash) then
            return '#'..PICKED_WAREHOUSE..': Warehouse not found\nCapacity: 0 / 0'
        else
            local warehouse = stats.get_u32(warehouse_hash)
            local available = stats.get_u32(crates_hash)
            return '#'..PICKED_WAREHOUSE..': '..WAREHOUSES[warehouse].name..'\nCapacity: '..available..' / '..WAREHOUSES[warehouse].capacity
        end
    else
        return ''
    end
end)

OFFICE_WAREHOUSES_GROUP_TP = OFFICE_WAREHOUSES_GROUP:new_button('TP to warehouse', function ()
    local warehouse_hash = string.smart_joaat('MP'..stats.get_character_index()..'_PROP_WHOUSE_SLOT'..PICKED_WAREHOUSE)
    local warehouse_stat = stats.get_u32(warehouse_hash)
    if warehouse_stat ~= 0 then
        local info = WAREHOUSES[warehouse_stat]
        utils.teleport_self(info.coords.x, info.coords.y, info.coords.z)
        ui.popup('GOD SYSTEM', 'Teleported to '..info.name..'.', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
    else
        ui.popup('GOD SYSTEM', 'Warehouse not found.', Icons.CANCEL2, PopupType.BOX)
    end
end)

-- Crates buy
OFFICE_CRATESBUY_GROUP_TOTAL = OFFICE_CRATESBUY_GROUP:new_text(function ()
    if native.is_invoker_ready() and stats.exists(LAST_MP_CHAR_HASH) then
        local total_capacity = 0
        local total_available = 0
        for i = 0, 4 do
            local warehouse_hash = string.smart_joaat('MP'..stats.get_character_index()..'_PROP_WHOUSE_SLOT'..i)
            local crates_hash = string.smart_joaat('MP'..stats.get_character_index()..'_CONTOTALFORWHOUSE'..i)
            if not stats.exists(warehouse_hash) or not stats.exists(crates_hash) then
                total_capacity = total_capacity + 0
                total_available = total_available + 0
            else
                local warehouse_stat = stats.get_u32(warehouse_hash)
                local available_stat = stats.get_u32(crates_hash)
                total_capacity = total_capacity + WAREHOUSES[warehouse_stat].capacity
                total_available = total_available + available_stat
            end
        end
        return 'Total crates: '..total_available..' / '..total_capacity
    else
        return ''
    end
end)

OFFICE_CRATESBUY_GROUP_CRATESLOOP = OFFICE_CRATESBUY_GROUP:new_checkbox('Crates loop')

OFFICE_CRATESBUY_GROUP_INSTANTBUY = OFFICE_CRATESBUY_GROUP:new_button('Instant buy', function ()
    if script.is_running(WAREHOUSE_INSTANT_BUY_SCRIPT) then
        script.get_local(WAREHOUSE_INSTANT_BUY_SCRIPT, WAREHOUSE_INSTANT_BUY_GLOBAL1):write_u32(1)
        script.get_local(WAREHOUSE_INSTANT_BUY_SCRIPT, WAREHOUSE_INSTANT_BUY_GLOBAL2):write_u32(6)
        script.get_local(WAREHOUSE_INSTANT_BUY_SCRIPT, WAREHOUSE_INSTANT_BUY_GLOBAL3):write_u32(4)
        ui.popup('GOD SYSTEM', 'Done.', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
    else
        ui.popup('GOD SYSTEM', 'Error: mission has not started.', Icons.CANCEL2, PopupType.BOX)
    end
end)

OFFICE_CRATESBUY_GROUP_INSTANTBUY:set_hint('Instantly completes buy mission.')

OFFICE_CRATESBUY_GROUP_INSTANTBUYFULL = OFFICE_CRATESBUY_GROUP:new_button('Instant buy full warehouse', function ()
    if script.is_running(WAREHOUSE_INSTANT_BUY_SCRIPT) then
        script.get_local(WAREHOUSE_INSTANT_BUY_SCRIPT, WAREHOUSE_INSTANT_BUY_GLOBAL1):write_u32(1)
        script.get_local(WAREHOUSE_INSTANT_BUY_SCRIPT, WAREHOUSE_INSTANT_BUY_CRATES_AMOUNT_GLOBAL):write_u32(111)
        script.get_local(WAREHOUSE_INSTANT_BUY_SCRIPT, WAREHOUSE_INSTANT_BUY_GLOBAL2):write_u32(6)
        script.get_local(WAREHOUSE_INSTANT_BUY_SCRIPT, WAREHOUSE_INSTANT_BUY_GLOBAL3):write_u32(4)
        ui.popup('GOD SYSTEM', 'Done.', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
    else
        ui.popup('GOD SYSTEM', 'Error: mission has not started.', Icons.CANCEL2, PopupType.BOX)
    end
end)

OFFICE_CRATESBUY_GROUP_INSTANTBUYFULL:set_hint('Start the buy mission first. Instantly completes the mission by completely filling the warehouse.')

OFFICE_CRATESBUY_GROUP_DELETECOOLDOWN = OFFICE_CRATESBUY_GROUP:new_button('Delete cooldown for buy', function ()
    script.get_global(WAREHOUSE_BUY_COOLDOWN_GLOBAL):write_u32(0)
    ui.popup('GOD SYSTEM', 'Cooldown deleted.', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
end)

-- Crates sell
OFFICE_CRATESSELL_GROUP_STATUS = OFFICE_CRATESSELL_GROUP:new_text(function ()
    local price_one = script.get_global(WAREHOUSE_CRATES_PRICE_GLOBAL[1]):read_u32()
    local price_two = script.get_global(WAREHOUSE_CRATES_PRICE_GLOBAL[7]):read_u32()
    if price_one == WAREHOUSE_CRATES_PRICE_TO_SET[1] or price_two == WAREHOUSE_CRATES_PRICE_TO_SET[7] then
        return 'Maximum cost of crates status: enabled'
    else
        return 'Maximum cost of crates status: disabled'
    end
end)

OFFICE_CRATESSELL_GROUP_PAYOUT = OFFICE_CRATESSELL_GROUP:new_button('Set maximum cost of crates', function ()
    for i = 1, #WAREHOUSE_CRATES_PRICE_GLOBAL do
        local price_global = script.get_global(WAREHOUSE_CRATES_PRICE_GLOBAL[i])
        price_global:write_u32(WAREHOUSE_CRATES_PRICE_TO_SET[i])
    end
    ui.popup('GOD SYSTEM', 'Done.', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
end)

OFFICE_CRATESSELL_GROUP_PAYOUT:set_hint('Completely fill your warehouses before activation!\nAfter activation you will receive the following prices:\n\nSmall warehouses\n3 crates = $6,000,000\n8 crates = $6,000,000\n16 crates = $6,000,000\n\nMedium warehouses\n8 crates = $6,000,000\n21 crates = $5,727,267\n42 crates = $5,999,994\n\nBig warehouses\n22 crates = $5.999.994\n56 crates = $5,999,952\n111 crates = $5,999,994\n\nSelling with maximum value only works in a single session!')

OFFICE_CRATESSELL_GROUP_RESET_PAYOUT = OFFICE_CRATESSELL_GROUP:new_button('Reset cost of crates', function ()
    for i = 1, #WAREHOUSE_CRATES_PRICE_GLOBAL do
        local price_global = script.get_global(WAREHOUSE_CRATES_PRICE_GLOBAL[i])
        price_global:write_u32(WAREHOUSE_CRATES_PRICE_TO_RESET[i])
    end
    ui.popup('GOD SYSTEM', 'Done.', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
end)

OFFICE_CRATESSELL_GROUP_RESET_PAYOUT:set_hint('Returns prices to standard values.')

OFFICE_CRATESSELL_GROUP_INSTANTSELL = OFFICE_CRATESSELL_GROUP:new_button('Instant sell', function ()
    if script.is_running(WAREHOUSE_INSTANT_SELL_SCRIPT) then
        script.get_local(WAREHOUSE_INSTANT_SELL_SCRIPT, WAREHOUSE_INSTANT_SELL_GLOBAL):write_u32(99999)
        ui.popup('GOD SYSTEM', 'Done.', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
    else
        ui.popup('GOD SYSTEM', 'Error: mission has not started.', Icons.CANCEL2, PopupType.BOX)
    end
end)

OFFICE_CRATESSELL_GROUP_INSTANTSELL:set_hint('Instantly completes sell mission.')

OFFICE_CRATESSELL_GROUP_DELETECOOLDOWN = OFFICE_CRATESSELL_GROUP:new_button('Delete cooldown for sell', function ()
    script.get_global(WAREHOUSE_SELL_COOLDOWN_GLOBAL):write_u32(0)
    ui.popup('GOD SYSTEM', 'Cooldown deleted.', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
end)
