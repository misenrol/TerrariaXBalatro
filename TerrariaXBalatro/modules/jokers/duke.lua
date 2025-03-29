SMODS.Joker{
    key = 'duke',
    atlas = 'Jokers',
    pos = {x = 3, y = 2},

    cost = 7,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    config = { extra = {xchips = 2.5} },

    loc_vars = function(self, info_queue, card)
        return{
            vars = { card.ability.extra.xchips }
        }
    end,

    calculate = function(self,card,context)
        if context.individual and context.cardarea == G.play and not context.end_of_round then
            return {
                 xchips = self.config.extra.xchips
            }

        end
    end
}