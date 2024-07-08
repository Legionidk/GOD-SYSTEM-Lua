-- CASINO
CASINO = Main_page:new_subpage('CASINO')

CASINO_CHIPS = CASINO:new_group('Chips', GroupRect.TITLE)
CASINO_LW = CASINO:new_group('Lucky wheel', GroupRect.BODY)
CASINO_BJ = CASINO:new_group('Blackjack', GroupRect.TITLE)
CASINO_POKER = CASINO:new_group('Poker', GroupRect.BODY)

-- Chips
CASINO_CHIPS_CURRENT_LIM = CASINO_CHIPS:new_text(function ()
    if native.is_invoker_ready() then
        local without = script.get_global(CHIPS_PUR_LIM_GLOBAL):read_u32()
        local with = script.get_global(CHIPS_PUR_LIM_WITH_PENT_GLOBAL):read_u32()
        return 'Current purchase limit: '..without..' / '..with
    else
        return ''
    end
end)

CASINO_CHIPS_CHOOSE_LIM = CASINO_CHIPS:new_slider('New purchase limit', 50000, 10000000)

CASINO_CHIPS_LIM_SET = CASINO_CHIPS:new_button('Set new purchase limit', function ()
    script.get_global(CHIPS_PUR_LIM_GLOBAL):write_u32(CASINO_CHIPS_CHOOSE_LIM:get())
    script.get_global(CHIPS_PUR_LIM_WITH_PENT_GLOBAL):write_u32(CASINO_CHIPS_CHOOSE_LIM:get())
    ui.popup('GOD SYSTEM', 'New limit: '..CASINO_CHIPS_CHOOSE_LIM:get()..'.', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
end)

CASINO_CHIPS_LIM_RESET = CASINO_CHIPS:new_button('Reset purchase limit', function ()
    script.get_global(CHIPS_PUR_LIM_GLOBAL):write_u32(20000)
    script.get_global(CHIPS_PUR_LIM_WITH_PENT_GLOBAL):write_u32(50000)
    ui.popup('GOD SYSTEM', 'Limit reseted.', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
end)

CASINO_CHIPS_RESET_COOLDOWN = CASINO_CHIPS:new_button('Reset purchase cooldown', function ()
    stats.set_u32(CHIPS_PUR_COOLDOWN_HASH1, 0)
    stats.set_u32(CHIPS_PUR_COOLDOWN_HASH2, 0)
    ui.popup('GOD SYSTEM', 'Chips purchase cooldown has been reseted.', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
end)

-- Lucky wheel
CASINO_LW_TIP = CASINO_LW:new_text('When you are at the casino, click on the drop from the list.')

CASINO_LW_DROP = CASINO_LW:new_table_list('Drop', CASINO_LW_DROP_NAMES)

CASINO_LW_DROP:set_click_callback(function (item)
    if script.is_running(CASINO_LW_SCRIPT) then
        script.get_local(CASINO_LW_SCRIPT, CASINO_LW_CHOOSE_DROP_GLOBAL):write_u32(CASINO_LW_DROP_IDS[item])
        script.get_local(CASINO_LW_SCRIPT, CASINO_LW_DROP_GLOBAL):write_u32(11)
        ui.popup('GOD SYSTEM', 'Done.', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
    else
        ui.popup('GOD SYSTEM', "Error: you're not in casino.", Icons.CANCEL2, PopupType.BOX)
    end
end)

-- Blackjack
CASINO_BJ_TRICK = CASINO_BJ:new_button('Trick the dealer', function ()
    if script.is_running('blackjack') then
        local current_table = script.get_local('blackjack', BLACKJACK_TABLE_LOCAL + (Pid() * 8)):read_u32()
        if current_table ~= -1 and current_table ~= nil then
            script.get_local('blackjack', BLACKJACK_SET_CARDS_TO_DEALER_LOCAL1 + (current_table * 13)):write_u32(11)
            script.get_local('blackjack', BLACKJACK_SET_CARDS_TO_DEALER_LOCAL2 + 2 + (current_table * 13)):write_u32(12)
            script.get_local('blackjack', BLACKJACK_SET_CARDS_TO_DEALER_LOCAL3 + 3 + (current_table * 13)):write_u32(13)
            script.get_local('blackjack', BLACKJACK_SET_CARDS_TO_DEALER_LOCAL4 + 12 + (current_table * 13)):write_u32(3)
            ui.popup('GOD SYSTEM', 'Dealer tricked.', Icons.CHECKMARK_SUCCESS, PopupType.BOX)
        else
            ui.popup('GOD SYSTEM', 'Error: you are not at the table.', Icons.CANCEL2, PopupType.BOX)
        end
    else
        ui.popup('GOD SYSTEM', 'Error: you are not at the table.', Icons.CANCEL2, PopupType.BOX)
    end
end)

-- Poker
local casino_poker_flush = CASINO_POKER:new_button('Give straight flush', function ()
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

local casino_poker_trickthedealer = CASINO_POKER:new_button('Trick the dealer', function ()
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

CASINO_POKER:set_visible(false)
