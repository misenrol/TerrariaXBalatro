--Colours
loc_colour('red') 
G.ARGS.LOC_COLOURS['pink'] = HEX("F099E1")
G.ARGS.LOC_COLOURS['cyan'] = HEX("01A68F")

return {
    descriptions = {
        Back={},
        Blind={},
        Edition={},
        Enhanced={},
        Joker={

            j_terraria_kingslime = {
                name = 'King Slime',
                text = {
                    '{C:chips}+#1#{} Chips for,',
                    'each {C:attention}Joker{} card',
                    '{C:inactive}(Currently {C:chips}+#2#{C:inactive} Chips)',
                }
            },

            j_terraria_eyeofcthulhu = {
                name = 'Eye of Cthulhu',
                text = {
                    'Each {C:red}Discard{} left,',
                    '{C:mult}+#1#{} Mult per card played',
                }
            },

            j_terraria_eaterofworlds = {
                name = 'Eater of Worlds',
                text = {
                    'Each {C:attention}Consumable{} used,',
                    'gives {C:mult}+2{} Mult',
                    '{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult){}',
                }
            },

            j_terraria_brainofcthulhu = {
                name = 'Brain of Cthulu',
                text = {
                    'If played hand,',
                    'contains a {C:red}Heart{}{C:attention} Flush{},',
                    'gain a random {C:tarot}Tarot{} card'
                }
            },

            j_terraria_queenbee = {
                name = 'Queen Bee',
                text = {
                    'Played cards that are {C:attention}Gold Queen{}',
                    'give {C:money}+$7{}'
                }
            },

            j_terraria_skeletron = {
                name = 'Skeletron',
                text = {
                    'Played cards that are {C:attention} Stone{},',
                    'give {C:mult}+#1#{} Mult and,',
                    'Each {C:attention}Stone{} held in hand,',
                    'gives {C:chips}+#2#{} Chips'
                }
            },

            j_terraria_wof = {
                name = 'Wall of Flesh',
                text = {
                    "If played hand contains a,",
                    "{V:1}#1# {C:attention}Flush{} gain a,",
                    "random {C:tarot}Spectral{} card,",
                    "suit changes every round",
                }
            },

            j_terraria_queenslime = {
                name = 'Queen Slime',
                text = {
                    '{X:mult,C:white}x0.5{} Mult for,',
                    'each {C:attention}Joker{} card',
                    '{C:inactive}(Currently {X:mult,C:white}x#2#{C:inactive} Mult)',
                }
            },

            j_terraria_sprime = {
                name = 'Skeletron Prime',
                text = {
                    'If played hand contains a {C:attention}Four of a Kind{},',
                    'played scored cards into {C:attention}Steel{}'
                }
            },

            j_terraria_dprime = {
                name = 'The Destroyer',
                text = {
                    'If played {C:attention}5{} cards,',
                    '{X:mult,C:white}x1.5{} on all cards',
                }
            },

            j_terraria_tprime = {
                name = 'The Twins',
                text = {
                    'If played hand contains a {C:attention}Two Pair{},',
                    'gain {X:mult,C:white}x0.1{}',
                    '{C:inactive}(Currently {X:mult,C:white}x#1#{C:inactive} Mult){}',
                }
            },

            j_terraria_plantera = {
                name = 'Plantera',
                text = {
                    'If played hand contains a {C:attention}Four of a Kind{},',
                    'increase payout by {C:money}+$#2#{}',
                    '{C:inactive}(Currently {C:money}$#1#{}{C:inactive}){}'
                }
            },

            j_terraria_golem = {
                name = 'Golem',
                text = {
                    '{C:chips}+#1#{} Chips per card played and,',
                    'Each {C:attention}Stone{} held in hand,',
                    'gain {X:chips,C:white}x#2#{} Chips',
                }
            },

            j_terraria_duke = {
                name = 'Duke Fisheron',
                text = {
                    '{X:chips,C:white}x#1#{} Chips,',
                    'per card played',
                }
            },

            j_terraria_cultist = {
                name = 'Lunatic Cultist',
                text = {
                    'When a {C:attention}Blind{} is {C:attention}defeated{},',
                    'or at the end of {C:attention}Shopping{},',
                    'gain a random {C:tarot}Charm Pack{},',
                    '{C:tarot}Meteor Pack{} or a {C:tarot}Ethereal Pack{}',
                }
            },

            j_terraria_pumpkinmoon = {
                name = 'Pumpkin Moon',
                text = {
                    'If hand played is a {C:attention}Three of a Kind{},',
                    '{C:attention}Destroy{} all played cards and,',
                    'gain {C:money}+$8{}'
                }
            },

            j_terraria_frostmoon = {
                name = 'Frost Moon',
                text = {
                    'If hand played contains a {C:attention}Three of a Kind{},',
                    'convert played hand into {C:attention}Glass{}'
                }
            },

            j_terraria_solareclipse = {
                name = 'Solar Eclipse',
                text = {
                    'If hand played contains a {C:attention}Three of a Kind{} and,',
                    'every card is {C:attention}Lucky{}',
                    '{C:attention}Retrigger{} all played cards',
                }
            },

            j_terraria_eol = {
                name = '{C:pink}Empress of Light{}',
                text = {
                'Every card {C:attention}played{},',
                'converts into {C:pink}Polychrome{}',
                },
            },

            j_terraria_moonlord = {
                name = '{C:cyan}Moon Lord{}',
                text = {
                    'Every card {C:attention}sold{},',
                    'gain {X:mult,C:white}x#2#{} Mult',
                    'Every consumable {C:attention}used{},',
                    'gain {X:mult,C:white}x0.15{} Mult,',
                    '{C:inactive}(Currently {X:mult,C:white}x#1#{} {C:inactive}Mult){}',
                },
            }

        },
        Other={},
        Planet={},
        Spectral={},
        Stake={},
        Tag={},
        Tarot={},
        Voucher={},
    },
    misc = {
        achievement_descriptions={},
        achievement_names={},
        blind_states={},
        challenge_names={},
        collabs={},
        dictionary={},
        high_scores={},
        labels={},
        poker_hand_descriptions={},
        poker_hands={},
        quips={},
        ranks={},
        suits_plural={},
        suits_singular={},
        tutorial={},
        v_dictionary={},
        v_text={},
    },
}