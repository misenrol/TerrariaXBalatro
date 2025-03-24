SMODS.Joker{
    key = 'rainbowrod',
    atlas = 'Jokers',
    pos = {x = 2, y = 6},

    cost = 7,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    config = { extra = { mult = 0, mult_gain = 3, chips = 0, chips_gain = 3 } },

    loc_vars = function(self, info_queue, card)
        return{
            vars = {
                card.ability.extra.mult, card.ability.extra.mult_gain, card.ability.extra.chips, card.ability.extra.chips_gain
            }
        }
    end,
        
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                chip_mod = card.ability.extra.chips,
                mult_mod = card.ability.extra.mult,
                chips = card.ability.extra.chips,
                mult = card.ability.extra.mult
            }
        end
    
        if context.before and not context.blueprint then
            local found_suits = {
                Diamonds = false,
                Spades = false,
                Clubs = false,
                Hearts = false
            }
    
            for _, played_card in ipairs(context.full_hand or {}) do
                if played_card:is_suit('Diamonds') then found_suits.Diamonds = true end
                if played_card:is_suit('Spades') then found_suits.Spades = true end
                if played_card:is_suit('Clubs') then found_suits.Clubs = true end
                if played_card:is_suit('Hearts') then found_suits.Hearts = true end
            end
    
            if found_suits.Diamonds and found_suits.Spades and found_suits.Clubs and found_suits.Hearts and not context.blueprint then
                card.ability.extra.chips = card.ability.extra.chips + (card.ability.extra.chips_gain or 3)
                card.ability.extra.mult = card.ability.extra.mult + (card.ability.extra.mult_gain or 3)
                return {
                    message = 'Upgraded!',
                    colour = G.C.RED,
                    card = card
                }
            end
        end
    end
}    