SMODS.Joker{
    key = 'eol',
    atlas = 'Jokers',
    pos = { x = 1, y = 4 },
    soul_pos = { x = 1, y = 3},

    cost = 20,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = false,
    unlocked = true,
    discovered = true,
    config = { extra = { Xmult = 2} },

    calculate = function(self, card, context)
        if context.before then
    
            -- Flip animation + sound
            for i = 1, #context.scoring_hand do
                local percent = 1.15 - (i - 0.999) / (#context.scoring_hand - 0.998) * 0.3
                context.scoring_hand[i]:flip()
                play_sound('card1', percent)
                context.scoring_hand[i]:juice_up(0.3, 0.3)
            end
    
            delay(0.2)
    
            -- Apply Poly enhancement to all non-stone cards
            for i = 1, #context.scoring_hand do
                local this_card = context.scoring_hand[i]
                this_card:set_edition('e_polychrome', nil, true)
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
        end

        if context.individual and context.cardarea == G.play and (context.other_card.edition or {}).key == 'e_polychrome' then
            return {
                Xmult = card.ability.extra.Xmult,
                message = "Shiny!",
                card = other_card
            }
        end
    end
}