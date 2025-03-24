SMODS.Joker{
    key = 'dg',
    atlas = 'Jokers',
    pos = {x = 2, y = 4},
    soul_pos = {x = 2, y = 3},

    cost = 20,
    rarity = 4,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = false,
    unlocked = true,
    discovered = true,
    config = { extra = { xchips = 2} },

    loc_vars = function(self, info_queue, card)
        return{
            vars = {card.ability.extra.xchips}
        }
    end,

    calculate = function(self,card,context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round then
            if SMODS.has_enhancement(context.other_card, 'm_stone') then
                return {
                    xchips = self.config.extra.xchips
                }
            end
        end
        if context.before then
    
            -- Flip animation + sound
            for i = 1, #context.scoring_hand do
                local percent = 1.15 - (i - 0.999) / (#context.scoring_hand - 0.998) * 0.3
                context.scoring_hand[i]:flip()
                play_sound('card1', percent)
                context.scoring_hand[i]:juice_up(0.3, 0.3)
            end
    
            delay(0.2)
    
            -- Apply Steel enhancement to all non-stone cards
            for i = 1, #context.scoring_hand do
                local this_card = context.scoring_hand[i]
                if this_card.config.center_key ~= 'm_stone' then
                    if not SMODS.has_enhancement(this_card, 'm_stone') then
                        this_card:set_ability(G.P_CENTERS.m_stone, nil, true)
                    end
                end
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
    end
}
