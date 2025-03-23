SMODS.Joker{
    key = 'moonlord',
    atlas = 'Jokers',
    pos = { x = 3, y = 3 },
    soul_pos = {x = 3, y = 2},

    cost = 10,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    unlock_card = true,
    discovered = true,
    config = { extra = { Xmult = 1, Xmult_gain = 0.25 }},

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
        if context.selling_card then
            card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_gain
            return{
                message = 'Doom!',
                colour = G.C.BLUE,
                card = card,
            }
        end
        if context.using_consumeable then
            card.ability.extra.Xmult = card.ability.extra.Xmult + 0.15
            return{
                message = 'Doom!',
                colour = G.C.BLUE,
                card = card,
            }
        end
    end
}