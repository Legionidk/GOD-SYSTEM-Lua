-- Casino page
local casino = Main_page:new_subpage('CASINO')

local casino_chips = casino:new_group('Chips', GroupRect.TITLE)
local casino_lw = casino:new_group('Lucky wheel', GroupRect.TITLE)
local casino_bj = casino:new_group('Blackjack', GroupRect.BODY)
local casino_poker = casino:new_group('Poker', GroupRect.BODY)

-- Chips
local casino_chips_current_limit = casino_chips:new_text(function ()
    local with = script.get_global(262145):at(26534):read_u32()
    local without = script.get_global(262145):at(26535):read_u32()
    return 'Current purchase limit: '..with..' / '..without
end)

local casino_chips_choose_limit = casino_chips:new_slider('New purchase limit', 50000, 2000000)

local casino_chips_set_limit = casino_chips:new_button('Set new purchase limit', function ()
    script.get_global(262145):at(26534):write_u32(casino_chips_choose_limit:get())
    script.get_global(262145):at(26535):write_u32(casino_chips_choose_limit:get())
    ui.popup('GOD SYSTEM', 'New limit: '..casino_chips_choose_limit:get()..'.', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
end)

local casino_chips_reset_limit = casino_chips:new_button('Reset purchase limit', function ()
    script.get_global(262145):at(26534):write_u32(20000)
    script.get_global(262145):at(26535):write_u32(50000)
    ui.popup('GOD SYSTEM', 'Limit reseted.', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
end)

local casino_chips_reset_cooldown = casino_chips:new_button('Reset purchase cooldown', function ()
    stats.set_u32(string.smart_joaat('MPPLY_CASINO_CHIPS_PUR_GD'), 0)
    stats.set_u32(string.smart_joaat('MPPLY_CASINO_CHIPS_PURTIM'), 0)
    ui.popup('GOD SYSTEM', 'Chips purchase cooldown has been reseted.', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
end)

-- Lucky wheel
local casino_lw_instruction = casino_lw:new_text('When you are at the casino, click on the drop from the list.')
local casino_lw_drop = casino_lw:new_table_list('Drop', LuckyWheel_name):set_click_callback(function (item)
    if script.is_running('casino_lucky_wheel') then
        script.get_local('casino_lucky_wheel', 280 + 14):write_u32(LuckyWheel_id[item])
        script.get_local('casino_lucky_wheel', 280 + 45):write_u32(11)
        ui.popup('GOD SYSTEM', 'Done.', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
    else
        ui.popup('GOD SYSTEM', "Error: you're not in casino.", Icons.CANCEL2, PopupType.BOX)
    end
end)

-- Blackjack
local casino_bj_trickdealer = casino_bj:new_button('Trick the dealer', function ()
    if script.is_running('blackjack') then
        local current_table = script.get_local('blackjack', 1776 + 1 + (Pid() * 8) + 4):read_u32()
        if current_table ~= -1 and current_table ~= nil then
            script.get_local('blackjack', 116 + 846 + 1 + (current_table * 13) + 1):write_u32(11)
            script.get_local('blackjack', 116 + 846 + 1 + (current_table * 13) + 2):write_u32(12)
            script.get_local('blackjack', 116 + 846 + 1 + (current_table * 13) + 3):write_u32(13)
            script.get_local('blackjack', 116 + 846 + 1 + (current_table * 13) + 12):write_u32(3)
            ui.popup('GOD SYSTEM', 'Dealer tricked.', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
        else
            ui.popup('GOD SYSTEM', 'Error: you are not at the table.', Icons.CANCEL2, PopupType.BOX)
        end
    else
        ui.popup('GOD SYSTEM', 'Error: you are not at the table.', Icons.CANCEL2, PopupType.BOX)
    end
end)

-- Poker
local casino_poker_flush = casino_poker:new_button('Give straight flush', function ()
    if script.is_running('three_card_poker') then
        local current_table = script.get_local('three_card_poker', 749 + 1 + (Pid() * 9) + 2):read_u32()
        if current_table ~= nil and current_table ~= -1 then
            PokerCardsSetter(Pid(), current_table, 50, 51, 52)
            ui.popup('GOD SYSTEM', 'Straight flush in your hand.', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
        else
            ui.popup('GOD SYSTEM', 'Error: you are not at the table.', Icons.CANCEL2, PopupType.BOX)
        end
    else
        ui.popup('GOD SYSTEM', 'Error: you are not at the table.', Icons.CANCEL2, PopupType.BOX)
    end
end)

local casino_poker_trickthedealer = casino_poker:new_button('Trick the dealer', function ()
    if script.is_running('three_card_poker') then
        local current_table = script.get_local('three_card_poker', 749 + 1 + (Pid() * 9) + 2):read_u32()
        if current_table ~= nil and current_table ~= -1 then
            PokerCardsSetter(PokerDealersIDGetter(current_table), current_table, 2, 17, 32)
            ui.popup('GOD SYSTEM', 'Dealer tricked.', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
        else
            ui.popup('GOD SYSTEM', 'Error: you are not at the table.', Icons.CANCEL2, PopupType.BOX)
        end
    else
        ui.popup('GOD SYSTEM', 'Error: you are not at the table.', Icons.CANCEL2, PopupType.BOX)
    end
end)

casino_poker_flush:set_enabled(false)
casino_poker_trickthedealer:set_enabled(false)
