SMODS.Joker{
    key = 'golem',
    atlas = 'Jokers',
    pos = {x = 2, y = 2},

    cost = 7,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    config = { extra = { chips = 50, xchips = 1.5} },

    loc_vars = function(self, info_queue, card)
        return{
            vars = {card.ability.extra.chips, card.ability.extra.xchips}
        }
    end,

    calculate = function(self,card,context)
        if context.individual and context.cardarea == G.play then
            if (context.poker_hands['High Card']) then
                return {
                    chips = self.config.extra.chips
                }
            end
        end
        if context.individual and context.cardarea == G.hand and not context.end_of_round then
            if SMODS.has_enhancement(context.other_card, 'm_stone') then
                return {
                    xchips = self.config.extra.xchips
                }
            end
        end
    end
}
