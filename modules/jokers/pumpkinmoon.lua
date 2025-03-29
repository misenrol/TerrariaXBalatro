SMODS.Joker{
    key = 'pumpkinmoon',
    atlas = 'Jokers',
    pos = { x = 0, y = 5 },

    cost = 8,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    unlocked = true,
    unlock_card = true,
    discovered = true,
    config = { extra = { money = 8}},

    calculate = function(self, card, context)
        if context.joker_main and context.scoring_name == 'Three of a Kind' then
            return{
                dollars = 8
            }
        end
        if context.cardarea == G.play and context.scoring_name == 'Three of a Kind' and context.destroy_card then
            return{
                remove = true
            }
        end
    end
}
