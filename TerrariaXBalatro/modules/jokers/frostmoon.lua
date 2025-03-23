SMODS.Joker{
    key = 'frostmoon',
    atlas = 'Jokers',
    pos = { x = 5, y = 0 },

    cost = 9,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    config = { vars = {} },

    loc_var = function(self, info_queue, card)
        info_queue[#info_queue + 1] = {G.P_CENTERS.m_glass}
    end,

    calculate = function(self, card, context)
        if context.before and next(context.poker_hands['Three of a Kind']) then
    
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
                    if not SMODS.has_enhancement(this_card, 'm_steel') then
                        this_card:set_ability(G.P_CENTERS.m_steel, nil, true)
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