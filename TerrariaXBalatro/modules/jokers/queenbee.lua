SMODS.Joker{
    key = 'queenbee',
    atlas = 'Jokers',
    pos = { x = 5, y = 0 },

    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    config = { extra = { money = 7 } },

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and
         context.other_card and context.other_card:get_id() == 12 
         and SMODS.has_enhancement(context.other_card, 'm_gold') 
         then
            local money = (card.ability and card.ability.extra and card.ability.extra.money) or 7
            return {
                dollars = money,
                card = context.other_card
            }
        end
    end
}