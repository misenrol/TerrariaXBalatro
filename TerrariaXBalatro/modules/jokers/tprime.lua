SMODS.Joker{
    key = 'tprime',
    atlas = 'Jokers',
    pos = { x = 0, y = 2},

    rarity = 2,
    cost = 8,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlock_card = true,
    discovered = true,
    config = { extra = { Xmult = 1, Xmult_gain = 0.15 } },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.Xmult, card.ability.extra.Xmult_gain } }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            return {
                Xmult_mod = card.ability.extra.Xmult,
                message = localize { type = 'variable', key = 'a_xmult', vars = {card.ability.extra.Xmult } }

            }
        end
        if context.before and context.scoring_name == 'Two Pair' and not context.blueprint then
            card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_gain
            return {
                   message = 'Feast!',
                   colour = G.C.MULT,
                   card = card
            }
        end
    end
}