loc_colour('red') 
G.ARGS.LOC_COLOURS['pink'] = HEX("F099E1")
G.ARGS.LOC_COLOURS['cyan'] = HEX("01A68F")

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
                    text = "Project Lead: Misenrol, MegarkShark",
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
                    text = "Artists: MegarkShark",
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
                    text = "Special thanks: Pebbles, DungeonBubble, JokerDisplay, tomatose",
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
                    text = "Concepting: Misenrol, MegarkShark",
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
    perishable_compat = true,
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
    perishable_compat = true,
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
            'For every {C:attention}Consumable{} used,',
            'gain {C:mult}+2{} Mult',
            '{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult){}',
        }
    },
    config = { extra = {mult = 0, mult_gain = 2} },
    pos = {x = 2, y = 0},
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
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
            'If hand played,',
            'contains a {C:attention}Heart Flush{},',
            'gain a random {C:tarot}Tarot{} card'
        }
    },
    config = { extra = {mult = 0, mult_gain = 2} },
    pos = {x = 3, y = 0},
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
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
            'gain {C:mult}+5{} Mult',
            'For every {C:attention}Stone{} card in hand,',
            'gain {C:chips}+50{} Chips'
        }
    },
    config = { extra = {mult = 5, chips = 50} },
    pos = {x = 4, y = 0},
    cost = 3,
    rarity = 1,
    blueprint_compat = true,
    perishable_compat = true,
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
            'For every {C:attention}Gold Queen{} scored',
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
        if context.individual and context.cardarea == G.play and
         context.other_card and context.other_card:get_id() == 12 
         and SMODS.has_enhancement(context.other_card, 'm_gold') 
         then
            local money = (card.ability and card.ability.extra and card.ability.extra.money) or 0
            return {
                dollars = money,
                card = context.other_card
            }
        end
    end
}

--- Wall of Flesh Code, here we have the random suits
local igo = Game.init_game_object
function Game:init_game_object()
	local ret = igo(self)
	ret.current_round.wof_card = { suit = 'Spades' }
	return ret
end

function SMODS.current_mod.reset_game_globals(run_start)
	G.GAME.current_round.wof_card = { suit = 'Spades' }
	local valid_wof_cards = {}
	for _, v in ipairs(G.playing_cards) do
		if not SMODS.has_no_suit(v) then
			valid_wof_cards[#valid_wof_cards + 1] = v
		end
	end
	if valid_wof_cards[1] then
		local wof_card = pseudorandom_element(valid_wof_cards, pseudoseed('2cas' .. G.GAME.round_resets.ante))
		G.GAME.current_round.wof_card.suit = wof_card.base.suit
	end
end

SMODS.Joker {
	key = 'wof',
	loc_txt = {
		name = 'Wall of Flesh',
		text = {
			"If a hand contains a,",
			"{V:1}#1# {C:attention}Flush{} gain a,",
            "random {C:tarot}Spectral{} card,",
			"suit changes every round",
		}
	},
	blueprint_compat = true,
	perishable_compat = true,
	eternal_compat = true,
    discovered = true,
    unlocked = true,
	rarity = 2,
	cost = 6,
	config = { extra = { } },
	atlas = 'Jokers',
	pos = { x = 0, y = 1 },
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				localize(G.GAME.current_round.wof_card.suit, 'suits_singular'),
				colours = { G.C.SUITS[G.GAME.current_round.wof_card.suit] }
			}
		}
	end,
	calculate = function(self, card, context)
		if  context.cardarea == G.play and
            context.individual and
			context.other_card:is_suit(G.GAME.current_round.wof_card.suit) and
            next(context.poker_hands['Flush']) and
			not context.blueprint
		then
            if (#G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit) then
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 2

                G.E_MANAGER:add_event(Event({
                    func = function()
                        SMODS.add_card({ set = 'Spectral' })
                        
                        G.GAME.consumeable_buffer = 0   

                        card_eval_status_text(
                        context.blueprint_card or card,
                        'extra', nil, nil, nil,
                        { message = "Guide Died!", colour = G.C.RED }
                        )

                        return true
                    end
                }))
            end
        end

    end
}

SMODS.Joker{
    key = 'QueenSlime',
    loc_txt = {
        name = 'Queen Slime',
        text = {
            '{X:mult,C:white}x0.5{} Mult for,',
            'each {C:attention}Joker{} card',
            '{C:inactive}(Currently {X:mult,C:white}x#2#{C:inactive} Mult)',
        }
    },
    config = { extra = { Xmult = 0.5} },
    pos = {x = 4, y = 1},
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'Jokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.Xmult, (G.jokers and G.jokers.cards and #G.jokers.cards or 0)*card.ability.extra.Xmult}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
            return{ 
                Xmult = (G.jokers and G.jokers.cards and #G.jokers.cards or 0)*card.ability.extra.Xmult
            }
        end
    end
}

SMODS.Joker{
    key = 'SkeletronPrime',
    loc_txt = {
        name = 'Skeletron Prime',
        text = {
            'If played hand contains a {C:attention}Four of a Kind{},',
            'convert scored cards into {C:attention}Steel{}'
        }
    },
    config = { extra = {} },
    pos = {x = 1, y = 1},
    cost = 9,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'Jokers',

    calculate = function(self, card, context)
        if context.before and next(context.poker_hands['Four of a Kind']) then
    
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

SMODS.Joker{
    key = 'Destroyer',
    loc_txt = {
        name = 'The Destroyer',
        text = {
            'If {C:attention}5{} cards get scored,',
            '{X:mult,C:white}x1.5{} on all cards',
        }
    },
    config = { extra = { Xmult = 1.5} },
    pos = {x = 2, y = 1},
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'Jokers',

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.Xmult } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if next(context.poker_hands['Flush']) or next(context.poker_hands['Five of a Kind']) or next(context.poker_hands['Straight']) then
                return {
                    Xmult = card.ability.extra.Xmult,
                    card = other
                }
            end
        end
    end
}

SMODS.Joker{
    key = 'TheTwins',
    loc_txt = {
        name = 'The Twins',
        text = {
            'If hand contains a {C:attention}Two Pair{},',
            'gain {X:mult,C:white}x0.2{},',
            '{C:inactive}(Currently {X:mult,C:white}x#1#{C:inactive} Mult)',
        }
    },
    config = { extra = { Xmult = 1, Xmult_gain = 0.2 } },
    rarity = 2,
    cost = 7,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlock_card = true,
    discovered = true,
    atlas = 'Jokers',
    pos = { x = 3, y = 1},

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.Xmult, card.ability.extra.Xmult_gain } }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            return {
                Xmult_mod = card.ability.extra.Xmult,
                message = localize { type = 'variable', key = 'a_xmult', vars = {card.ability.extra.Xmult } }

            }
        end
        if context.before and next(context.poker_hands['Two Pair']) and not context.blueprint then
            card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_gain
            return {
                   message = 'Feast!',
                   colour = G.C.MULT,
                   card = card
            }
        end
    end
}

SMODS.Joker{
    key = 'Plant',
    loc_txt = {
        name = 'Plantera',
        text = {
            'If played hand contains a {C:attention}Four of a Kind{}',
            'increase payout by {C:money}+$2{}',
            '{C:inactive}(Currently {C:money}$#1#{}{C:inactive}){}'
        }
    },
    config = { extra = { money = 0, m_gain = 2 } },
    rarity = 3,
    cost = 8,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlock_card = true,
    discovered = true,
    atlas = 'Jokers',
    pos = { x = 5, y = 1 },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.money or 0, card.ability.extra.m_gain or 2 } }
    end,

    calc_dollar_bonus = function(self, card)
        local thunk = card.ability.extra.money
        return thunk
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            return {
            }
        end
        if context.before and next(context.poker_hands['Four of a Kind']) and not context.blueprint then
            card.ability.extra.money = (card.ability.extra.money or 0) + (card.ability.extra.m_gain or 4)
            return {
                   message = 'Summoned!',
                   colour = G.C.GREEN,
                   card = card
            }
        end
    end
}

SMODS.Joker{
    key = 'Golem',
    loc_txt = {
        name = 'Golem',
        text = {
            'When a hand is played,',
            'gain {C:chips}+50{} Chips and,',
            'For every {C:attention} Stone{} card in hand,',
            'gain {X:chips,C:white}x1.5{} Chips',
        }
    },
    config = { extra = { chips = 50, xchips = 1.5} },
    pos = {x = 0, y = 2},
    cost = 7,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'Jokers',

    calculate = function(self,card,context)
        if context.individual and context.cardarea == G.play then
            if (context.poker_hands['High Card']) then
                return {
                    chips = self.config.extra.chips
                }
            end
        end
        if context.individual and context.cardarea == G.hand and not context.end_of_round then
            if SMODS.has_enhancement(context.other_card, 'm_stone') then
                return {
                    xchips = self.config.extra.xchips
                }
            end
        end
    end
}

SMODS.Joker{
    key = 'Duke',
    loc_txt = {
        name = 'Duke Fisheron',
        text = {
            'For every card {C:attention}scored,',
            'gain {X:chips,C:white}x2{} Chips,',
        }
    },
    config = { extra = {xchips = 2} },
    pos = {x = 1, y = 2},
    cost = 7,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'Jokers',

    calculate = function(self,card,context)
        if context.individual and context.cardarea == G.play and not context.end_of_round then
            return {
                 xchips = self.config.extra.xchips
            }

        end
    end
}

SMODS.Joker{
    key = 'Lunatic_Cultist',
    loc_txt = {
        name = 'Lunatic Cultist',
        text = {
            'When a {C:attention}Blind{} is {C:attention}defeated{},',
            'or at the end of {C:attention}shopping{},',
            'gain a random {C:tarot}Charm Pack{}, {C:tarot}Meteor Pack{} or a {C:tarot}Ethereal Pack{}'
        }
    },
    config = {
        extra = {
            selection = 1,
            options = {
                [1] = 'tag_charm',
                [2] = 'tag_meteor',
                [3] = 'tag_ethereal'
            }
        }
    },
    pos = { x = 2, y = 2 },
    cost = 2,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    unlock_card = true,
    discovered = true,
    atlas = 'Jokers',

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = {key = 'tag_charm', set = 'Tag'}
        info_queue[#info_queue+1] = {key = 'tag_meteor', set = 'Tag'}
        info_queue[#info_queue+1] = {key = 'tag_ethereal', set = 'Tag'}
        return {vars = {card.ability.extra.selection, card.ability.extra.options}}
    end,

    -- Event logic
    calculate = function(self, card, context)
        if (context.end_of_round and G.GAME.blind and not context.individual and not context.repetition) or context.ending_shop then
            G.E_MANAGER:add_event(Event({
                func = (function()
                    add_tag(Tag(pseudorandom_element(self.config.extra.options, pseudoseed('lunar'))))
                    play_sound('generic1', 0.9 + math.random() * 0.1, 0.8)
                    play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
                    return true
                end)
            }))
        end
        
    end
}

SMODS.Joker{
    key = 'empressoflight',
    loc_txt = {
        name = '{C:pink}Empress of Light{}',
        text = {
        "For every card {C:attention}scored{},",
        "turn into {C:pink}Polychrome{}",
        },
    },
    pos = { x = 4, y = 3 },
    soul_pos = { x = 4, y = 2},
    cost = 10,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'Jokers',

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
    end
}

SMODS.Joker{
    key = 'Moon_Lord',
    loc_txt = {
        name = '{C:cyan}Moon Lord{}',
        text = {
            'For every each card {C:attention}sold{},',
            'gain {X:mult,C:white}x0.25{} Mult',
            'For every consumable {C:attention}used{},',
            'gain {X:mult,C:white}x0.15{} Mult,',
            '{C:inactive}(Currently {X:mult,C:white}x#1#{} {C:inactive}Mult){}'
        }
    },
    config = { extra = { Xmult = 1, Xmult_gain = 0.5 }},
    pos = { x = 3, y = 3 },
    soul_pos = {x = 3, y = 2},
    cost = 10,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    unlock_card = true,
    discovered = true,
    atlas = 'Jokers',

    loc_vars = function(self, info_queue, card)
        return { vars = {
            card.ability.extra.Xmult, 
            card.ability.extra.Xmult_gain 
        } }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            return {
                Xmult_mod = card.ability.extra.Xmult,
                message = localize { type = 'variable', key = 'a_xmult', vars = {card.ability.extra.Xmult } }

            }
        end
        if context.selling_card then
            card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_gain
            return{
                message = 'Doom!',
                colour = G.C.BLUE,
                card = card,
            }
        end
        if context.using_consumeable then
            card.ability.extra.Xmult = card.ability.extra.Xmult + 0.1
            return{
                message = 'Doom!',
                colour = G.C.BLUE,
                card = card,
            }
        end
    end
}