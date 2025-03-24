SMODS.Joker{
    key = 'dprime',
    atlas = 'Jokers',
    pos = {x = 4, y = 1},

    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    config = { extra = { Xmult = 1.5} },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.Xmult } }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if next(context.poker_hands['Flush']) or next(context.poker_hands['Five of a Kind']) or next(context.poker_hands['Straight']) or next(context.poker_hands['Full House']) then
                return {
                    Xmult = card.ability.extra.Xmult,
                    card = other
                }
            end
        end
    end
}