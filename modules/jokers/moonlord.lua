SMODS.Joker{
    key = 'moonlord',
    atlas = 'Jokers',
    pos = { x = 0, y = 4 },
    soul_pos = {x = 0, y = 3},

    cost = 20,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = false,
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
        if context.selling_card and not context.blueprint then
            card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_gain
            return{
                message = 'Doom!',
                colour = G.C.BLUE,
                card = card,
            }
        end
        if context.using_consumeable and not context.blueprint then
            card.ability.extra.Xmult = card.ability.extra.Xmult + 0.15
            return{
                message = 'Doom!',
                colour = G.C.BLUE,
                card = card,
            }
        end
    end
}