SMODS.Joker{
    key = 'plantera',
    atlas = 'Jokers',
    pos = { x = 5, y = 1 },

    rarity = 3,
    cost = 8,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlock_card = true,
    discovered = true,
    config = { extra = { money = 0, m_gain = 2 } },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.money or 0, card.ability.extra.m_gain or 2 } }
    end,

    calc_dollar_bonus = function(self, card)
        local thunk = card.ability.extra.money
        return thunk
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            return {
            }
        end
        if context.before and next(context.poker_hands['Four of a Kind']) and not context.blueprint then
            card.ability.extra.money = (card.ability.extra.money or 0) + (card.ability.extra.m_gain or 4)
            return {
                   message = 'Summoned!',
                   colour = G.C.GREEN,
                   card = card
            }
        end
    end
}