SMODS.Joker {
    key = 'megashark',
    atlas = 'Jokers',
    pos = { x = 4, y = 6 },

    rarity = 1,
    cost = 8,
    blueprint_compat = true,
    perishable_compat = true,
    eternal_compat = false,
    unlock_card = true,
    discovered = true,
    yes_pool_flag = 'mshark_destroyed',

    config = {
        extra = {
            Xmult = 3.5,
            Xmult_mod = 0.05,
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.extra.Xmult, card.ability.extra.Xmult_mod }
        }
    end,

    calculate = function(self, card, context)
        local Xmult = card.ability.extra.Xmult or 0
        local Xmult_mod = card.ability.extra.Xmult_mod or 0.01

        if context.cardarea == G.play and context.individual then
            if Xmult > 0 then
                card.ability.extra.Xmult = Xmult - Xmult_mod

                if card.ability.extra.Xmult > 0 then
                    return {
                        message = "Pew",
                        mult = card.ability.extra.Xmult
                    }
                else
                    -- Trigger animation/sound and then remove card
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            play_sound('tarot1')
                            card.T.r = -0.2
                            card:juice_up(0.3, 0.4)
                            card.states.drag.is = true
                            card.children.center.pinch.x = true

                            G.E_MANAGER:add_event(Event({
                                trigger = 'after',
                                delay = 0.3,
                                blockable = false,
                                func = function()
                                    G.jokers:remove_card(card)
                                    card:remove()
                                    return true
                                end
                            }))
                            return true
                        end
                    }))

                    return {
                        message = 'Out of Ammo!'
                    }
                end
            end
        end
    end
}
