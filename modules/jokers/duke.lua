SMODS.Joker{
    key = 'duke',
    atlas = 'Jokers',
    pos = {x = 3, y = 2},
    cost = 7,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    config = { extra = {xchips = 2.5, odds = 8} },
    loc_vars = function(self, info_queue, card)
        return{
            vars = { 
                card.ability.extra.xchips, 
                G.GAME.probabilities.normal or 1,
                card.ability.extra.odds
            }
        }
    end,

    calculate = function(self,card,context)
        if context.individual and context.cardarea == G.play and not context.end_of_round then
            return {
                 xchips = self.config.extra.xchips
            }

        end

        if context.after then
            for i=1, #context.scoring_hand do 
                if pseudorandom('HUNGERY DUKE :3'..G.SEED) < (G.GAME.probabilities.normal / card.ability.extra.odds) then
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.2,
                        func = function() 
                            local current_card = context.scoring_hand[i]
                            if SMODS.shatters(current_card) then
                                current_card:shatter()
                            else
                                current_card:start_dissolve(nil, i == #context.scoring_hand)
                            end
                            delay(1) -- not quite working as intended, want a delay between cards being destroyed and cards being discarded
                            return true 
                        end }))
                end
            end
        end
    end             
}