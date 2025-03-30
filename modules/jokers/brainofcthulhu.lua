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
        if  context.cardarea == G.play and
            context.individual and
			context.other_card:is_suit('Hearts') and
            next(context.poker_hands['Flush'])
		then
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
}
