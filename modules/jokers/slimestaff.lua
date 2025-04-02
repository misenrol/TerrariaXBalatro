SMODS.Joker{
    key = 'slimestaff',
    atlas = 'Jokers',
    pos = {x = 0, y = 6},

    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    config = { extra = { xchips = 0.75} },

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.xchips, 1+(G.jokers and G.jokers.cards and #G.jokers.cards or 0)*card.ability.extra.xchips}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
            return{ 
                xchips = 1 + (G.jokers and G.jokers.cards and #G.jokers.cards or 0)*card.ability.extra.xchips
            }
        end
    end
}