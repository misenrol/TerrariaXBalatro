SMODS.Joker{
    key = 'queenslime',
    atlas = 'Jokers',
    pos = {x = 1, y = 1},

    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    config = { extra = { Xmult = 0.5} },

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.Xmult, (G.jokers and G.jokers.cards and #G.jokers.cards or 0)*card.ability.extra.Xmult}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
            return{ 
                Xmult = 1 + (G.jokers and G.jokers.cards and #G.jokers.cards or 0)*card.ability.extra.Xmult
            }
        end
    end
}
