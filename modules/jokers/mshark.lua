SMODS.Joker {
    key = 'mshark',
    atlas = 'Jokers',
    pos = { x = 3, y = 6 },

    rarity = 1,
    cost = 3,
    blueprint_compat = true,
    perishable_compat = true,
    eternal_compat = false,
    unlock_card = true,
    discovered = true,
    no_pool_flag = 'mshark_destroyed',
    config = {
        extra = {
            mult = 30,
            mult_mod = 1,
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.extra.mult, card.ability.extra.mult_mod }
        }
    end,

    calculate = function(self, card, context)
        local mult = card.ability.extra.mult or 0
        local mult_mod = card.ability.extra.mult_mod or 1

        if context.cardarea == G.play and context.individual then
            if mult > 0 then
                card.ability.extra.mult = mult - mult_mod

                if card.ability.extra.mult > 0 then
                    return {
                        message = "Pew",
                        mult = card.ability.extra.mult
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
                    G.GAME.pool_flags.mshark_destoryed = true
                    return {
                        message = 'Out of Ammo!'
                    }
                end
            end
        end
    end
}
