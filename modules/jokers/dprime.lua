SMODS.Joker{
    key = 'dprime',
    atlas = 'Jokers',
    pos = {x = 4, y = 1},

    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    config = { extra = { Xmult = 1.5 } },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.Xmult } }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            local valid_hand = #context.scoring_hand >= 5

            if valid_hand then
                return {
                    Xmult = card.ability.extra.Xmult,
                    card = card
                }
            end
        end
        
        if context.after and context.main_eval then
            local valid_hand = #context.scoring_hand >= 5
            if valid_hand ~= true then
                -- Destroy a random Joker (excluding this one)
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.2,
                    func = function() 
                    local potential_victims = {}
                    for i = 1, #G.jokers.cards do
                        local j = G.jokers.cards[i]
                        if j ~= card and j:can_calculate(true) then
                            table.insert(potential_victims, j)
                        end
                    end

                    if #potential_victims > 0 then
                        local victim = pseudorandom_element(potential_victims, pseudoseed("dkill"))
                        local victim_key = victim.config.center.key
                        local victim_name = G.localization.descriptions.Joker[victim_key].name

                        if victim and type(victim.start_dissolve) == "function" then
                            victim.getting_sliced = true
                            G.GAME.joker_buffer = G.GAME.joker_buffer - 1

                            G.E_MANAGER:add_event(Event({
                                trigger = 'immediate',
                                blockable = false,
                                func = function()
                                    victim:start_dissolve()
                                    G.GAME.joker_buffer = 0
                                    return true
                                end
                            }))
                        end

                        card_eval_status_text(
                            context.blueprint_card or card,
                            'extra', nil, nil, nil,
                            { message = victim_name.." has been slain..."}
                            )

                        return true
                    end
                end }))
            end
        end

        return {}
    end
}
