SMODS.Joker{
    key = 'meowmere',
    atlas = 'Jokers',
    pos = {x = 1, y = 6},

    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    config = { extra = { Xmult = 2.5} },

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and (context.other_card.edition or {}).key == 'e_polychrome' then
            return {
                Xmult = card.ability.extra.Xmult,
                message = "Meow!",
                card = other_card
            }
        end
    end
}