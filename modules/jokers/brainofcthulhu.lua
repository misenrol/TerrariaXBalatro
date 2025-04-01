SMODS.Joker{
    key = 'brainofcthulhu',
    atlas = 'Jokers',
    pos = {x = 3, y = 0},

    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    config = { extra = {mult = 0, mult_gain = 2} },

    loc_vars = function(self, info_queue, card)
        return{vars = {}}
    end,

    calculate = function(self, card, context)
        if context.before then
            local is_heart_flush = true
            if #context.scoring_hand < 5 then -- checking if hand is at least 5 cards (keeping support for larger playing hand sizes)
                is_heart_flush = false
            end
            for _,_card in ipairs(context.scoring_hand) do -- iterating through played cards and checking suit
                if _card:is_suit('Hearts') ~= true then
                    is_heart_flush = false
                end
            end
            if is_heart_flush == true then
                if (#G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit) then
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1

                    G.E_MANAGER:add_event(Event({
                        func = function()
                            SMODS.add_card({ set = 'Tarot' })
                            
                            G.GAME.consumeable_buffer = 0   

                            card_eval_status_text(
                            context.blueprint_card or card,
                            'extra', nil, nil, nil,
                            { message = "Confused", colour = G.C.RED }
                            )

                            return true
                        end
                    }))
                end
            end
        end
    end
}
