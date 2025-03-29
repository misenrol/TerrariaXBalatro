SMODS.Joker{
    key = 'solareclipse',
    atlas = 'Jokers',
    pos = {x = 3, y = 5},

    cost = 12,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    config = {
        extra = {
            odds = 12
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                (G.GAME.probabilities.normal or 1),
                card.ability.extra.odds
            }
        }
    end,

    calculate = function(self, card, context)
        if context.before and pseudorandom('SOLAR_ECLIPSE_TRIGGER') < (G.GAME.probabilities.normal / card.ability.extra.odds) then
            -- Flip animation + sound
            for i = 1, #context.scoring_hand do
                local percent = 1.15 - (i - 0.999) / (#context.scoring_hand - 0.998) * 0.3
                context.scoring_hand[i]:flip()
                play_sound('card1', percent)
                context.scoring_hand[i]:juice_up(0.3, 0.3)
            end
    
            delay(0.2)
    
            -- Apply Poly enhancement to all cards
            for i = 1, #context.scoring_hand do
                local this_card = context.scoring_hand[i]
                this_card:set_edition('e_negative', nil, true)
            end
    
            delay(0.3)
    
            -- Flip back animation + sound
            for i = 1, #context.scoring_hand do
                local percent = 0.85 + (i - 0.999) / (#context.scoring_hand - 0.998) * 0.3
                context.scoring_hand[i]:flip()
                play_sound('tarot2', percent, 0.6)
                context.scoring_hand[i]:juice_up(0.3, 0.3)
            end
    
            delay(0.5)

            return{
                message = 'Eclipsed!',
                colour = G.C.RED
            }
        end
    end
}    

