SMODS.Joker{
    key = 'skeletron',
    atlas = 'Jokers',
    pos = {x = 4, y = 0},

    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    perishable_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    config = { extra = {mult = 5, chips = 50} },

    loc_vars = function(self, info_queue, card)
        return{
            vars = { card.ability.extra.mult, card.ability.extra.chips}

        }
    end,

    calculate = function(self,card,context)
        if context.individual and context.cardarea == G.play then
            if SMODS.has_enhancement(context.other_card, 'm_stone') then
                return {
                    mult = card.ability.extra.mult,
                    card = other
                }
            end
        end
        if context.individual and context.cardarea == G.hand and not context.end_of_round then
            if SMODS.has_enhancement(context.other_card, 'm_stone') then
                return {
                    chips = self.config.extra.chips
                }
            end
        end
    end
}