SMODS.Joker{
    key = 'eyeofcthulhu',
    atlas = 'Jokers',
    pos = {x = 1, y = 0},

    cost = 3,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    config = { extra = { mult = 3} },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult or 0 } }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            return {
                mult = G.GAME.current_round.discards_left * card.ability.extra.mult
            }
        end
    end
}