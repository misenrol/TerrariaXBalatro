SMODS.Joker{
    key = 'bloodmoon',
    atlas = 'Jokers',
    rarity = 2,
    cost = 4,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    config = { extra = { mult = 0, mult_gain = 1 }},
    pos = { x = 2, y = 5 },

    loc_vars = function(self, info_queue, card)
        return{
            vars = {card.ability.extra.mult, card.ability.extra.mult_gain}
        }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card:is_suit("Hearts") then
                card.ability.extra.mult = card.ability.extra.mult + (card.ability.extra.mult_gain or 1)
                return{
                    message = "Blood!",
                    colour = G.C.RED,
                    card = other
                }
            end
        end
        if context.joker_main then
            return{
                mult = card.ability.extra.mult,
                message = "Feast!",
                colour = G.C.RED
            }
        end
    end
}
