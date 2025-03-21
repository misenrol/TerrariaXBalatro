SMODS.Atlas {
    key = 'modicon',
    path = "icon.png",
    px = 32,
    py = 32
}

SMODS.current_mod.extra_tabs = function() --Credits tab
    local scale = 0.5
    return {
        label = "Interns",
        tab_definition_function = function()
        return {
            n = G.UIT.ROOT,
            config = {
            align = "cm",
            padding = 0.05,
            colour = G.C.CLEAR,
            },
            nodes = {
            {
                n = G.UIT.R,
                config = {
                padding = 0,
                align = "cm"
                },
                nodes = {
                {
                    n = G.UIT.T,
                    config = {
                    text = "Project Lead: Misenrol, Megark",
                    shadow = false,
                    scale = scale,
                    colour = G.C.PURPLE
                    }
                }
                }
            },
            {
                n = G.UIT.R,
                config = {
                padding = 0,
                align = "cm"
                },
                nodes = {
                {
                    n = G.UIT.T,
                    config = {
                    text = "Artists: Megark",
                    shadow = false,
                    scale = scale,
                    colour = G.C.MONEY
                    }
                },
                }
            },
            {
                n = G.UIT.R,
                config = {
                padding = 0,
                align = "cm"
                },
                nodes = {
                {
                    n = G.UIT.T,
                    config = {
                    text = "Programmers: Misenrol",
                    shadow = false,
                    scale = scale,
                    colour = G.C.GREEN
                    }
                }
                },
            },
            {
                n = G.UIT.R,
                config = {
                padding = 0,
                align = "cm"
                },
                nodes = {
                {
                    n = G.UIT.T,
                    config = {
                    text = "Special thanks: Pebbles, DungeonBubble, JokerDisplay",
                    shadow = false,
                    scale = scale,
                    colour = G.C.BLUE
                    }
                }
                } 
            },
            {
                n = G.UIT.R,
                config = {
                padding = 0,
                align = "cm"
                },
                nodes = {
                {
                    n = G.UIT.T,
                    config = {
                    text = "Concepting: Misenrol, Megark",
                    shadow = false,
                    scale = scale*0.6,
                    colour = G.C.BLACK
                    }
                }
                } 
            },
            }
        }
        end
    }
end

SMODS.Atlas{
    key = 'Jokers',
    path = 'Jokers.png',
    px = 71,
    py = 95
}

SMODS.Joker{
    key = 'King_Slime',
    loc_txt = {
        name = 'King Slime',
        text = {
            '{C:chips}+20{} Chips for,',
            'each {C:attention}Joker{} card',
            '{C:inactive}(Currently {C:chips}#2#{C:inactive} Chips)',
        }
    },
    config = { extra = { chips = 20} },
    pos = {x = 0, y = 0},
    cost = 3,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'Jokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.chips, (G.jokers and G.jokers.cards and #G.jokers.cards or 0)*card.ability.extra.chips}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
            return{
                message = localize{type = 'variable',key = 'a_chips',vars={(G.jokers and G.jokers.cards and #G.jokers.cards or 0)* card.ability.extra.chips}},
                chip_mod = (G.jokers and G.jokers.cards and #G.jokers.cards or 0)*card.ability.extra.chips
            }
        end
    end
}

SMODS.Joker{
    key = 'Eye_of_Cthulhu',
    loc_txt = {
        name = 'Eye of Cthulhu',
        text = {
            'For every {C:mult}Discard{} left,',
            '{C:mult}+#1#{} Mult per card scored',
        }
    },
    config = { extra = { mult = 3} },
    pos = {x = 1, y = 0},
    cost = 3,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'Jokers',

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult or 0 } }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            return {
                mult = G.GAME.current_round.discards_left * card.ability.extra.mult
            }
        end
    end
}

SMODS.Joker{
    key = 'Eater_Of_Worlds',
    loc_txt = {
        name = 'Eater of Worlds',
        text = {
            'For every {C:attention} Consumable{} used,',
            'gain {C:mult}+3{} Mult',
            '{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult){}',
        }
    },
    config = { extra = {mult = 0, mult_gain = 2} },
    pos = {x = 2, y = 0},
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'Jokers',

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult, card.ability.extra.mult_mod } }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            return {
                mult_mod = card.ability.extra.mult,
                message = localize { type = 'variable', key = 'a_mult', vars = {card.ability.extra.mult } }

            }
        end
        if context.using_consumeable and not context.blueprint then
            card.ability.extra.mult = card.ability.extra.mult + (card.ability.extra.mult_gain or 2)
            return {
                   message = 'Shivers!',
                   colour = G.C.PURPLE,
                   card = card
            }
        end
    end
}

SMODS.Joker{
    key = 'Brain_of_Cthulu',
    loc_txt = {
        name = 'Brain of Cthulu',
        text = {
            'If {C:attention}Hand{} played,',
            'contains a {C:attention}Heart Flush,',
            'gain a random {C:tarot}Tarot{} card'
        }
    },
    config = { extra = {mult = 0, mult_gain = 2} },
    pos = {x = 3, y = 0},
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'Jokers',

    loc_vars = function(self, info_queue, card)
        return{vars = {}}
    end,

    calculate = function(self, card, context)

            if context.cardarea == G.play and context.individual and next(context.poker_hands['Flush']) and context.other_card:is_suit('Hearts') then
                if (#G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit) then
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 2
    
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

SMODS.Joker{
    key = 'Skeletron',
    loc_txt = {
        name = 'Skeletron',
        text = {
            'For every {C:attention} Stone{} card played,',
            'gain {C:mult}+5{} Mult,',
            'For every {C:attention}Stone{} card in hand,',
            'gain {C:chips}+50{} Chips'
        }
    },
    config = { extra = {mult = 5, chips = 50} },
    pos = {x = 4, y = 0},
    cost = 3,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'Jokers',

    calculate = function(self,card,context)
        if context.individual and context.cardarea == G.play then
            if SMODS.has_enhancement(context.other_card, 'm_stone') then
                return {
                    mult = card.ability.extra.mult,
                    card = other
                }
            end
        end
        if context.individual and context.cardarea == G.hand and not context.end_of_round then
            if SMODS.has_enhancement(context.other_card, 'm_stone') then
                return {
                    chips = self.config.extra.chips
                }
            end
        end
    end
}

SMODS.Joker{
    key = 'QueenBee',
    loc_txt = {
        name = 'Queen Bee',
        text = {
            'For every {C:attention}Gold{} Queen scored',
            'gain {C:money}+$7{}'
        }
    },
    config = { extra = { money = 6 } },
    pos = { x = 5, y = 0 },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'Jokers',

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card and context.other_card:get_id() == 12 then
            local money = (card.ability and card.ability.extra and card.ability.extra.money) or 0
            return {
                dollars = money,
                card = context.other_card
            }
        end
    end
}
