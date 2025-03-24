SMODS.Joker{
    key = 'torchgod',
    atlas = 'Jokers', 
    soul_pos = {x = 4, y = 3},
    pos = {x = 4, y = 4},

    rarity = 4, 
    cost = 20, 
    unlocked = true,  
    discovered = true,
    blueprint_compat = false, 
    eternal_compat = false, 
    perishable_compat = false, 

    config = {
        extra = {
            mult = 300,
            chips = 300
        }
    },

    loc_vars = function(self, info_queue, center)
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local chips = card.ability.extra.chips
            local mult = card.ability.extra.mult

            local new_chips, new_mult = G.GAME.selected_back:trigger_effect{
                context = 'joker_main',
                chips = chips,
                mult = mult
            }

            chips = mod_chips(new_chips or chips)
            mult = mod_mult(new_mult or mult)

            return {
                chips = chips,
                mult = mult,
                card = card,
                message = 'Balanced',
                colour = G.C.PURPLE
            }
        end
    end
}
