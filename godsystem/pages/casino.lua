--- Блэкджек --------------------------------------------------------

Casino = Submenu.add_static_submenu('Casino', 'HC_Casino')
HOME_SUBMENU:add_sub_option('Casino', 'HC_Casino', Casino):setTags({{'[RISK]', 252, 43, 85}}):setHint('This section is supposed to be safe but is untested, use it at your own risk.')

Bj = Submenu.add_static_submenu('Blackjack', 'HC_Bj')
Casino:add_sub_option('Blackjack', 'HC_Bj', Bj)

-- автор скрипта SilentHy6
-- https://www.unknowncheats.me/forum/grand-theft-auto-v/604599-silent-night.html
Bj:add_state_bar('Dealer card', 'HC_Bj_DealerCard', function ()
    current_table = script_local:new('blackjack', 1774 + 1 + (player.index() * 8) + 4):get_int64()
    if current_table == 0 then
        card = script_local:new('blackjack', 114 + 846 + 1 + (current_table * 13) + 1):get_int64()
        return CasinoCardNameGetter(card)
    else
        return '...'
    end
end)

--- Обмануть дилера блэкджека -------------------------------------------------

-- автор скрипта SilentHy6
-- https://www.unknowncheats.me/forum/grand-theft-auto-v/604599-silent-night.html
Bj:add_click_option('Trick The Dealer', 'HC_Bj_Trick', function ()
    current_table = script_local:new('blackjack', 1774 + 1 + (player.index() * 8) + 4):get_int64()
    if current_table == 0 then
        script_local:new('blackjack', 114 + 846 + 1 + (current_table * 13) + 1):set_int64(11)
        script_local:new('blackjack', 114 + 846 + 1 + (current_table * 13) + 2):set_int64(12)
        script_local:new('blackjack', 114 + 846 + 1 + (current_table * 13) + 3):set_int64(13)
        script_local:new('blackjack', 114 + 846 + 1 + (current_table * 13) + 12):set_int64(3)
        notify.success('Bj', 'Done')
    else
        notify.fatal('Bj', 'Unknown error')
    end
end)

--- Покер (игрок) ---------------------------------------------------

Poker = Submenu.add_static_submenu('Poker', 'HC_Poker')
Casino:add_sub_option('Poker', 'HC_Poker', Poker)

Poker:add_separator('Player', 'HC_Poker_SepPlayer')

-- автор скрипта SilentHy6
-- https://www.unknowncheats.me/forum/grand-theft-auto-v/604599-silent-night.html
Poker:add_state_bar('Player cards', 'HC_Poker_PlayerCards', function ()
    if player.index() ~= 0 then
        return 'Unstable in public session'
    else
        current_table = script_local:new('three_card_poker', 747 + 1 + (player.index() * 9) + 2):get_int64()
        if current_table == 0 then
            card1 = script_local:new('three_card_poker', 114 + 168 + 1 + (current_table * 55) + 2 + 1 + (player.index() * 3)):get_int64()
            card2 = script_local:new('three_card_poker', 114 + 168 + 1 + (current_table * 55) + 2 + 2 + (player.index() * 3)):get_int64()
            card3 = script_local:new('three_card_poker', 114 + 168 + 1 + (current_table * 55) + 2 + 3 + (player.index() * 3)):get_int64()
            return CasinoCardNameGetter(card1)..' / '..CasinoCardNameGetter(card2)..' / '..CasinoCardNameGetter(card3)
        else
            return '... / ... / ...'
        end
    end
end)

--- Выдать стрит-флеш -----------------------------------------------

-- автор скрипта SilentHy6
-- https://www.unknowncheats.me/forum/grand-theft-auto-v/604599-silent-night.html
Poker:add_click_option('Give straight flush', 'HC_Poker_SF', function ()
    if player.index() ~= 0 then
        notify.fatal('Poker', 'Error: unstable in public session')
    else
        current_table = script_local:new('three_card_poker', 747 + 1 + (player.index() * 9) + 2):get_int64()
        if current_table == 0 then
            PokerCardsSetter(player.index(), current_table, 50, 51, 52)
            notify.success('Poker', 'Done')
        else
            notify.fatal('Poker', 'Unknown error')
        end
    end
end)

--- Покер (дилер) ---------------------------------------------------

Poker:add_separator('Dealer', 'HC_Poker_SepDealer')

-- автор скрипта SilentHy6
-- https://www.unknowncheats.me/forum/grand-theft-auto-v/604599-silent-night.html
Poker:add_state_bar('Dealer cards', 'HC_Poker_DealerCards', function ()
    current_table = script_local:new('three_card_poker', 747 + 1 + (player.index() * 9) + 2):get_int64()
    if current_table == 0 then
        card1 = script_local:new('three_card_poker', 114 + 168 + 1 + (current_table * 55) + 2 + 1 + (PokerDealersIDGetter(current_table) * 3)):get_int64()
        card2 = script_local:new('three_card_poker', 114 + 168 + 1 + (current_table * 55) + 2 + 2 + (PokerDealersIDGetter(current_table) * 3)):get_int64()
        card3 = script_local:new('three_card_poker', 114 + 168 + 1 + (current_table * 55) + 2 + 3 + (PokerDealersIDGetter(current_table) * 3)):get_int64()
        return CasinoCardNameGetter(card1)..' / '..CasinoCardNameGetter(card2)..' / '..CasinoCardNameGetter(card3)
    else
        return '... / ... / ...'
    end
end)

--- Обмануть дилера покера ------------------------------------------

-- автор скрипта SilentHy6
-- https://www.unknowncheats.me/forum/grand-theft-auto-v/604599-silent-night.html
Poker:add_click_option('Trick the dealer', 'HC_Poker_Trick', function ()
    current_table = script_local:new('three_card_poker', 747 + 1 + (player.index() * 9) + 2):get_int64()
    if current_table == 0 then
        PokerCardsSetter(PokerDealersIDGetter(current_table), current_table, 2, 17, 32)
        notify.success('Poker', 'Done')
    else
        notify.fatal('Poker', 'Unknown error')
    end
end)

--- Дроп из колеса --------------------------------------------------

Casino:add_choose_option('Give prize from lucky wheel', 'HC_LW', false, LuckyWheel_name, function(pos)
    if script.exists('casino_lucky_wheel') then
        script_local:new('casino_lucky_wheel', 278 + 14):set_int64(LuckyWheel_id[pos])
        script_local:new('casino_lucky_wheel', 278 + 45):set_int64(11)
        notify.success('Stuff', 'Done')
    else
        notify.warning('HC_LW', "Error: you're not in casino")
    end
end)

--- Лимит фишек -----------------------------------------------------

Casino:add_num_option('Chips purchase limit', 'HC_Chips_Lim', 100000, 2000000, 100000, function(val)
    script_global:new(262145):at(27238):set_int64(val)
    notify.success('Stuff', 'Done')
end)

--- Кд фишек --------------------------------------------------------

Casino:add_click_option('Reset chips purchase cooldown', 'HC_Chips_ResetCd', function()
    stats.set_u32(string.smart_joaat('MPPLY_CASINO_CHIPS_PUR_GD'), 0)
    stats.set_u32(string.smart_joaat('MPPLY_CASINO_CHIPS_PURTIM'), 0)
    notify.success('Stuff', 'Done')
end)
