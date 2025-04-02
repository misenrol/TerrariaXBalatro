SMODS.Joker{
    key = 'eaterofworlds',
    atlas = 'Jokers',
    pos = {x = 2, y = 0},

    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    config = { extra = {mult = 0, mult_gain = 2} },
    
    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.mult_gain, card.ability.extra.mult } }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            return {
                mult_mod = card.ability.extra.mult,
                message = localize { type = 'variable', key = 'a_mult', vars = {card.ability.extra.mult } }

            }
        end
        if context.using_consumeable and not context.blueprint then
            card.ability.extra.mult = card.ability.extra.mult + (card.ability.extra.mult_gain or 1)
            return {
                   message = 'Shivers!',
                   colour = G.C.PURPLE,
                   card = card
            }
        end
    end
}
