--- Блэкджек --------------------------------------------------------

Casino = Submenu.add_static_submenu('Казино', 'HC_Casino')
HOME_SUBMENU:add_sub_option('Казино', 'HC_Casino', Casino)

Bj = Submenu.add_static_submenu('Блэкджек', 'HC_Bj')
Casino:add_sub_option('Блэкджек', 'HC_Bj', Bj)

-- автор скрипта SilentHy6
-- https://www.unknowncheats.me/forum/grand-theft-auto-v/604599-silent-night.html
Bj:add_state_bar('Скрытая карта дилера', 'HC_Bj_DealerCard', function ()
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
Bj:add_click_option('Обмануть дилера', 'HC_Bj_Trick', function ()
    current_table = script_local:new('blackjack', 1774 + 1 + (player.index() * 8) + 4):get_int64()
    if current_table == 0 then
        script_local:new('blackjack', 114 + 846 + 1 + (current_table * 13) + 1):set_int64(11)
        script_local:new('blackjack', 114 + 846 + 1 + (current_table * 13) + 2):set_int64(12)
        script_local:new('blackjack', 114 + 846 + 1 + (current_table * 13) + 3):set_int64(13)
        script_local:new('blackjack', 114 + 846 + 1 + (current_table * 13) + 12):set_int64(3)
        notify.success('Bj', 'Дилер обманут')
    else
        notify.fatal('Bj', 'Ошибка, попробуйте еще раз')
    end
end):setHint('Меняет карты дилера на перебор.')

--- Покер (игрок) ---------------------------------------------------

Poker = Submenu.add_static_submenu('Покер', 'HC_Poker')
Casino:add_sub_option('Покер', 'HC_Poker', Poker)

Poker:add_separator('Игрок', 'HC_Poker_SepPlayer')

-- автор скрипта SilentHy6
-- https://www.unknowncheats.me/forum/grand-theft-auto-v/604599-silent-night.html
Poker:add_state_bar('Карты игрока', 'HC_Poker_PlayerCards', function ()
    if player.index() ~= 0 then
        return 'Не работает в открытой сессии'
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
Poker:add_click_option('Выдать стрит-флеш', 'HC_Poker_SF', function ()
    if player.index() ~= 0 then
        notify.fatal('Poker', 'Ошибка, функция не работает в открытой сессии')
    else
        current_table = script_local:new('three_card_poker', 747 + 1 + (player.index() * 9) + 2):get_int64()
        if current_table == 0 then
            PokerCardsSetter(player.index(), current_table, 50, 51, 52)
            notify.success('Poker', 'Стрит-флеш выдан')
        else
            notify.fatal('Poker', 'Ошибка, попробуйте еще раз')
        end
    end
end):setHint('Активировать перед ставкой.')

--- Покер (дилер) ---------------------------------------------------

Poker:add_separator('Дилер', 'HC_Poker_SepDealer')

-- автор скрипта SilentHy6
-- https://www.unknowncheats.me/forum/grand-theft-auto-v/604599-silent-night.html
Poker:add_state_bar('Карты дилера', 'HC_Poker_DealerCards', function ()
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
Poker:add_click_option('Обмануть дилера', 'HC_Poker_Trick', function ()
    current_table = script_local:new('three_card_poker', 747 + 1 + (player.index() * 9) + 2):get_int64()
    if current_table == 0 then
        PokerCardsSetter(PokerDealersIDGetter(current_table), current_table, 2, 17, 32)
        notify.success('Poker', 'Дилер обманут')
    else
        notify.fatal('Poker', 'Ошибка, попробуйте еще раз')
    end
end):setHint('Использовать перед ставкой.')

--- Дроп из колеса --------------------------------------------------

Casino:add_choose_option('Выдать дроп из колеса', 'HC_LW', false, {'Машина', 'Тайный', 'Одежда', 'Фишки', 'Деньги', 'РП', 'Скидка'}, function(pos)
    script_local:new('casino_lucky_wheel', 278 + 14):set_int64(CasWheel_dropval[pos])
    script_local:new('casino_lucky_wheel', 278 + 45):set_int64(11)
    notify.success('Stuff', 'Успешно выбрано: '..CasWheel_dropname[pos])
end):setHint('Активировать будучи в казино.')

--- Лимит фишек -----------------------------------------------------

Casino:add_num_option('Лимит покупки фишек', 'HC_Chips_Lim', 100000, 2000000, 100000, function(val)
    script_global:new(262145):at(27238):set_int64(val)
end)

--- Кд фишек --------------------------------------------------------

Casino:add_click_option('Сбросить кд покупки фишек', 'HC_Chips_ResetCd', function()
    stats.set_u32(string.smart_joaat('MPPLY_CASINO_CHIPS_PUR_GD'), 0)
    stats.set_u32(string.smart_joaat('MPPLY_CASINO_CHIPS_PURTIM'), 0)
    notify.success('Stuff', 'Кд сброшено')
end)
