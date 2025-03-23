SMODS.Joker{
    key = 'pumpkinmoon',
    atlas = 'Jokers',
    pos = { x = 3, y = 3 },

    cost = 6,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    unlocked = true,
    unlock_card = true,
    discovered = true,
    config = { extra = { money = 8}},

    calculate = function(self, card, context)
        if context.joker_main and (context.poker_hands['Three of a Kind']) then
            return{
                dollars = 8
            }
        end
        if context.cardarea == G.play and (context.poker_hands['Three of a Kind']) and context.destroy_card then
            return{
                remove = true
            }
        end
    end
}
