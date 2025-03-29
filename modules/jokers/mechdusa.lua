SMODS.Joker{
    key = 'mechdusa',
    atlas = 'Jokers',
    pos = {x = 3, y = 4},
    soul_pos = {x = 3, y = 3},

    cost = 20,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,
    unlocked = true,
    discovered = true,
    config = { extra = { Xmult = 2.5} },

    loc_vars = function(self, info_queue, card)
        return{
            vars = {card.ability.extra.Xmult}
        }
    end,

    calculate = function(self,card,context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round then
            if SMODS.has_enhancement(context.other_card, 'm_steel') then
                return {
                    Xmult = self.config.extra.Xmult
                }
            end
        end
    end
}
