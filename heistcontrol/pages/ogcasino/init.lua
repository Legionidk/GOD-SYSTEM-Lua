--- Необходимые функции ---------------------------------------------

local function stats_set(stat, value)
    hash = string.smart_joaat(stat)
    stats.set_u32(hash, value)
end

-- автор скрипта SilentHy6
-- https://www.unknowncheats.me/forum/grand-theft-auto-v/604599-silent-night.html
local function CasinoCardNameGetter(index)
    if index == 0 then
        return '...'
    end
    card_number = math.fmod(index, 13)
    card_name = ''
    card_suit = ''
    if card_number == 1 then
        card_name = 'A'
    elseif card_number == 0 then
        card_name = 'K'
    elseif card_number == 12 then
        card_name = 'Q'
    elseif card_number == 11 then
        card_name = 'J'
    else
        card_name = tostring(card_number)
    end
    if index >= 1 and index <= 13 then
        card_suit = ' (Крести)'
    elseif index >= 14 and index <= 26 then
        card_suit = ' (Буби)'
    elseif index >= 27 and index <= 39 then
        card_suit = ' (Черви)'
    elseif index >= 40 and index <= 52 then
        card_suit = ' (Пики)'
    end
    return card_name .. card_suit
end

-- автор скрипта SilentHy6
-- https://www.unknowncheats.me/forum/grand-theft-auto-v/604599-silent-night.html
local function PokerCardsSetter(ID, current_table, card1, card2, card3)
    script_local:new('three_card_poker', 114 + 168 + 1 + (current_table * 55) + 2 + 1 + (ID * 3)):set_int64(card1)
    script_local:new('three_card_poker', 114 + 168 + 1 + (current_table * 55) + 2 + 2 + (ID * 3)):set_int64(card2)
    script_local:new('three_card_poker', 114 + 168 + 1 + (current_table * 55) + 2 + 3 + (ID * 3)):set_int64(card3)
    script_local:new('three_card_poker', 1036 + 799 + 1 + 1 + (current_table * 55) + 1 + (ID * 3)):set_int64(card1)
    script_local:new('three_card_poker', 1036 + 799 + 1 + 1 + (current_table * 55) + 2 + (ID * 3)):set_int64(card2)
    script_local:new('three_card_poker', 1036 + 799 + 1 + 1 + (current_table * 55) + 3 + (ID * 3)):set_int64(card3)
end

-- автор скрипта SilentHy6
-- https://www.unknowncheats.me/forum/grand-theft-auto-v/604599-silent-night.html
local function PlayerID()
    return script_global:new(2672761):get_int64()
end

-- автор скрипта SilentHy6
-- https://www.unknowncheats.me/forum/grand-theft-auto-v/604599-silent-night.html
local function PokerDealersIDGetter(current_table)
    players = 0
    for i = 0, 31 do
        players_table = script_local:new('three_card_poker', 747 + 1 + (i * 9) + 2):get_int64()
        if i ~= PlayerID() and players_table == current_table then
            players = players + 1
        end
        return players + 1
    end
end

--- Блэкджек --------------------------------------------------------

Casino = Submenu.add_static_submenu('Казино', 'HC_Casino')
HOME_SUBMENU:add_sub_option('Казино', 'HC_Casino', Casino)

Bj = Submenu.add_static_submenu('Блэкджек', 'HC_Bj')
Casino:add_sub_option('Блэкджек', 'HC_Bj', Bj)

-- автор скрипта SilentHy6
-- https://www.unknowncheats.me/forum/grand-theft-auto-v/604599-silent-night.html
Bj:add_state_bar('Скрытая карта дилера', 'HC_Bj_DealerCard', function ()
    current_table = script_local:new('blackjack', 1774 + 1 + (PlayerID() * 8) + 4):get_int64()
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
    current_table = script_local:new('blackjack', 1774 + 1 + (PlayerID() * 8) + 4):get_int64()
    if current_table == 0 then
        script_local:new('blackjack', 114 + 846 + 1 + (current_table * 13) + 1):set_int64(11)
        script_local:new('blackjack', 114 + 846 + 1 + (current_table * 13) + 2):set_int64(12)
        script_local:new('blackjack', 114 + 846 + 1 + (current_table * 13) + 3):set_int64(13)
        script_local:new('blackjack', 114 + 846 + 1 + (current_table * 13) + 12):set_int64(3)
        notify.success('Bj', 'Дилер обманут')
    else
        notify.warning('Bj', 'Ошибка, попробуйте еще раз')
    end
end):setHint('Меняет карты дилера на перебор.')

--- Покер (игрок) ---------------------------------------------------

Poker = Submenu.add_static_submenu('Покер', 'HC_Poker')
Casino:add_sub_option('Покер', 'HC_Poker', Poker)

Poker:add_separator('Игрок', 'HC_Poker_SepPlayer')

-- автор скрипта SilentHy6
-- https://www.unknowncheats.me/forum/grand-theft-auto-v/604599-silent-night.html
Poker:add_state_bar('Карты игрока', 'HC_Poker_PlayerCards', function ()
    if PlayerID() ~= 0 then
        return 'Не работает в открытой сессии'
    else
        current_table = script_local:new('three_card_poker', 747 + 1 + (PlayerID() * 9) + 2):get_int64()
        if current_table == 0 then
            card1 = script_local:new('three_card_poker', 114 + 168 + 1 + (current_table * 55) + 2 + 1 + (PlayerID() * 3)):get_int64()
            card2 = script_local:new('three_card_poker', 114 + 168 + 1 + (current_table * 55) + 2 + 2 + (PlayerID() * 3)):get_int64()
            card3 = script_local:new('three_card_poker', 114 + 168 + 1 + (current_table * 55) + 2 + 3 + (PlayerID() * 3)):get_int64()
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
    if PlayerID() ~= 0 then
        notify.fatal('Bj', 'Ошибка, функция не работает в открытой сессии')
    else
        current_table = script_local:new('three_card_poker', 747 + 1 + (PlayerID() * 9) + 2):get_int64()
        if current_table == 0 then
            PokerCardsSetter(PlayerID(), current_table, 50, 51, 52)
            notify.success('Poker', 'Стрит-флеш выдан')
        else
            notify.warning('Bj', 'Ошибка, попробуйте еще раз')
        end
    end
end):setHint('Использовать перед ставкой / можно нажать Enter одновременно ставя ставку и активируя функцию.')

--- Покер (дилер) ---------------------------------------------------

Poker:add_separator('Дилер', 'HC_Poker_SepDealer')

-- автор скрипта SilentHy6
-- https://www.unknowncheats.me/forum/grand-theft-auto-v/604599-silent-night.html
Poker:add_state_bar('Карты дилера', 'HC_Poker_DealerCards', function ()
    current_table = script_local:new('three_card_poker', 747 + 1 + (PlayerID() * 9) + 2):get_int64()
    if current_table == 0 then
        DealerID = PokerDealersIDGetter(current_table)
        card1 = script_local:new('three_card_poker', 114 + 168 + 1 + (current_table * 55) + 2 + 1 + (DealerID * 3)):get_int64()
        card2 = script_local:new('three_card_poker', 114 + 168 + 1 + (current_table * 55) + 2 + 2 + (DealerID * 3)):get_int64()
        card3 = script_local:new('three_card_poker', 114 + 168 + 1 + (current_table * 55) + 2 + 3 + (DealerID * 3)):get_int64()
        return CasinoCardNameGetter(card1)..' / '..CasinoCardNameGetter(card2)..' / '..CasinoCardNameGetter(card3)
    else
        return '... / ... / ...'
    end
end)

--- Обмануть дилера покера ------------------------------------------

-- автор скрипта SilentHy6
-- https://www.unknowncheats.me/forum/grand-theft-auto-v/604599-silent-night.html
Poker:add_click_option('Обмануть дилера', 'HC_Poker_Trick', function ()
    current_table = script_local:new('three_card_poker', 747 + 1 + (PlayerID() * 9) + 2):get_int64()
    if current_table == 0 then
        DealerID = PokerDealersIDGetter(current_table)
        PokerCardsSetter(DealerID, current_table, 2, 17, 32)
        notify.success('Poker', 'Дилер обманут')
    else
        notify.warning('Bj', 'Ошибка, попробуйте еще раз')
    end
end):setHint('Выдает дилеру 2 (крести) / 4 (буби) / 6 (черви). Использовать перед ставкой / можно нажать Enter одновременно ставя ставку и активируя функцию.')

--- Дроп из колеса --------------------------------------------------

Casino:add_choose_option('Выдать дроп из колеса', 'HC_LW', false, {'Машина', 'Тайный', 'Одежда', 'Фишки', 'Деньги', 'РП', 'Скидка'}, function(pos)
    drop_name = {
        [1] = 'Машина',
        [2] = 'Тайный предмет',
        [3] = 'Одежда',
        [4] = 'Фишки',
        [5] = 'Деньги',
        [6] = 'РП',
        [7] = 'Скидка'
    }
    drop_id = {
        [1] = 18,
        [2] = 11,
        [3] = 16,
        [4] = 15,
        [5] = 19,
        [6] = 17,
        [7] = 4
    }
    script_local:new('casino_lucky_wheel', 278 + 14):set_int64(drop_id[pos])
    script_local:new('casino_lucky_wheel', 278 + 45):set_int64(11)
    notify.success('Stuff', 'Успешно выбрано: '..drop_name[pos])
end):setHint('Активировать будучи в казино.')

--- Лимит фишек -----------------------------------------------------

Casino:add_num_option('Лимит покупки фишек', 'HC_Chips_Lim', 100000, 2000000, 100000, function(val)
    script_global:new(262145):at(27238):set_int64(val)
end)

--- Кд фишек --------------------------------------------------------

Casino:add_click_option('Сброс кд покупки фишек', 'HC_Chips_ResetCd', function()
    stats_set('MPPLY_CASINO_CHIPS_PUR_GD', 0)
    stats_set('MPPLY_CASINO_CHIPS_PURTIM', 0)
    notify.success('Stuff', 'Кд сброшено')
end)
