--Colours
loc_colour('red') 
G.ARGS.LOC_COLOURS['pink'] = HEX("F099E1")
G.ARGS.LOC_COLOURS['cyan'] = HEX("01A68F")
G.ARGS.LOC_COLOURS['gray'] = HEX("87898C")
G.ARGS.LOC_COLOURS['bone'] = HEX("C9C1A7")
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
                    '{C:chips}+#1#{} Chips for',
                    'each {C:attention}Joker{} card',
                    '{C:inactive}(Currently {C:chips}+#2#{C:inactive} Chips)'
                }
            },

            j_terraria_eyeofcthulhu = {
                name = 'Eye of Cthulhu',
                text = {
                    'Played cards give',
                    '{C:mult}+#1#{} Mult x {C:red}discards{} remaining',
                    'when scored'
                }
            },

            j_terraria_eaterofworlds = {
                name = 'Eater of Worlds',
                text = {
                    'This Joker gains {C:mult}+#1#{} Mult',
                    'when a consumable is used',
                    '{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult){}'
                }
            },

            j_terraria_brainofcthulhu = {
                name = 'Brain of Cthulhu',
                text = {
                    'If played hand',
                    'contains a {C:hearts}Heart{}{C:attention} Flush{}',
                    'create a {C:tarot}Tarot{} card'
                }
            },

            j_terraria_queenbee = {
                name = 'Queen Bee',
                text = {
                    'Played {C:attention}Gold Queens{}',
                    'earn {C:money}+$7{} when scored'
                }
            },

            j_terraria_skeletron = {
                name = 'Skeletron',
                text = {
                    '{C:attention}Stone{} cards give {C:mult}+#1#{} Mult ',
                    'when scored and',
                    ' {C:chips}+#2#{} Chips when held in hand'
                }
            },

            j_terraria_wof = {
                name = 'Wall of Flesh',
                text = {
                    "If played hand contains a",
                    "{V:1}#1# {C:attention}Flush{},",
                    "create a {C:spectral}Spectral{} card",
                    "{s:0.8}suit changes at end of round"
                }
            },

            j_terraria_queenslime = {
                name = 'Queen Slime',
                text = {
                    '{X:mult,C:white}x0.5{} Mult for',
                    'each {C:attention}Joker{} card',
                    '{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)'
                }
            },

            j_terraria_sprime = {
                name = 'Skeletron Prime',
                text = {
                    'If played hand is a {C:attention}Four of a Kind{},',
                    'all scored cards become {C:attention}Steel{}'
                }
            },

            j_terraria_dprime = {
                name = 'The Destroyer',
                text = {
                    'If hand contains {C:attention}5{} scoring cards,',
                    'all cards give {X:mult,C:white}x1.5{} Mult when scored.',
                    'If hand does {C:attention}not{} contain {C:attention}5{} scoring cards,',
                    '{C:attention}destroy{} a random {C:attention}joker{} after scoring'
                }
            },

            j_terraria_tprime = {
                name = 'The Twins',
                text = {
                    'This Joker gains {X:mult,C:white}x0.15{} Mult ',
                    'if played hand is a {C:attention}Two Pair{}',
                    '{C:inactive}(Currently {X:mult,C:white}X#1#{C:inactive} Mult){}'
                }
            },

            j_terraria_plantera = {
                name = 'Plantera',
                text = {
                    'Earn {C:money}$#1#{} at end of round, ',
                    'payout increases by {C:money}+$#2#{} if played ',
                    'hand contains a {C:attention}Four of a Kind{}'
                }
            },

            j_terraria_golem = {
                name = 'Golem',
                text = {
                    'Cards give {C:chips}+#1#{} Chips when scored',
                    'and {C:attention}Stone{} cards give {X:chips,C:white}X#2#{} Chips',
                    'when held in hand'
                }
            },

            j_terraria_duke = {
                name = 'Duke Fisheron',
                text = {
                    'Cards give {X:chips,C:white}X#1#{} Chips',
                    'when scored.',
                    '{C:green}#2# in #3#{} chance to',
                    'destroy a {C:attention}scored{}',
                    'card'
                }
            },

            j_terraria_cultist = {
                name = 'Lunatic Cultist',
                text = {
                    'When a {C:attention}Blind{} is {C:attention}defeated{}',
                    'or at the end of the {C:attention}Shop{},',
                    'create a random {C:attention}Charm Tag{},',
                    '{C:attention}Meteor Tag{}, or a {C:attention}Ethereal Tag{}'
                }
            },

            j_terraria_pumpkinmoon = {
                name = 'Pumpkin Moon',
                text = {
                    'If hand is a {C:attention}Three of a Kind{},',
                    '{C:attention}Destroy{} all played cards and',
                    'earn {C:money}+$8{}'
                }
            },

            j_terraria_frostmoon = {
                name = 'Frost Moon',
                text = {
                    'If hand played is a {C:attention}Three of a Kind{},',
                    'all scored cards become {C:attention}Glass{}',
                }
            },

            j_terraria_solareclipse = {
                name = 'Solar Eclipse',
                text = {
                    '{C:green}#1# in #2#{} chance for all',
                    'scored cards in hand',
                    'to become {C:dark_edition}Negative{}'
                }
            },

            j_terraria_bloodmoon = {
                name = 'Blood Moon',
                text = {
                    "This {C:attention}Joker{} gains {C:mult}+#1#{} Mult",
                    "for every {C:red}Heart{} scored",
                    "{C:inactive}(Currently {C:mult}+#2#{}{C:inactive} Mult)"
            },
            },

            j_terraria_sandel = {
                    name = 'Sand Elemental',
                    text = {
                        '{C:attention}Glass Cards{} only',
                        'give {X:mult,C:white}x1.5{} Mult.',
                        'But Glass Cards',
                        'Never {C:attention}Break{}'
                },
            },

            j_terraria_mshark = {
                name = 'Mini Shark',
                text = {
                    'Played cards give {C:mult}+#1#{} Mult,',
                    '{C:mult}-1{} per card scored'
                }
            },

            j_terraria_megashark = {
                name = 'Mega Shark',
                text = {
                    'Played cards give {X:mult,C:white}X#1#{} Mult,',
                    '{X:mult,C:white}-x0.05{} Mult per card scored'
                }
            },

            j_terraria_slimestaff = {
                name = 'Slime Staff',
                text = {
                    '{X:chips,C:white}x0.75{} Chips for',
                    'each {C:attention}Joker{} card',
                    '{C:inactive}(Currently {X:chips,C:white}X#2#{C:inactive} Chips)'
                }
            },

            j_terraria_rainbowrod = {
                name = 'Rainbow Rod',
                text = {
                    'This {C:attention}Joker{} gains',
                    '{C:mult}+#2#{} Mult and {C:chips}+#4#{} Chips',
                    'if poker hand contains a',
                    '{C:diamonds}Diamond{} card, {C:clubs}Club{} card,',
                    '{C:hearts}Heart{} card and {C:spades}Spade{} card',
                    '{C:inactive}(Currently{} {C:mult}+#1#{}{C:inactive} Mult and {C:chips}+#3#{}{C:inactive} Chips)',
                }
            },

            j_terraria_meowmere = {
                name = '{C:pink}Meowmere{}',
                text = {
                    '{C:dark_edition}Polychrome{} cards give',
                    'an additional {X:mult,C:white}x2.5{} Mult',
                    'when scored'
                }
            },

            j_terraria_dg = {
                name = '{C:bone}Dungeon Guardian{}',
                text = {
                    'Each {C:attention}Stone{} held in hand',
                    'gives {X:chips,C:white}x2{} Chips,',
                    'Played cards become {C:attention}Stone{}',
                }
            },

            j_terraria_mechdusa = {
                name = '{C:gray}Mechdusa{}',
                text = {  
                    'Each {C:attention}Steel{}',
                    'held in hand,',
                    'gives an additional {X:mult,C:white}x2.5{} Mult'
                }
            },

            j_terraria_torchgod = {
                name = '{C:dark_edition}Torch God',
                text = {
                    '{C:mult}+100{} Mult and {C:chips}+100{} Chips,',
                    'Balance {C:chips}Chips{} and {C:mult}Mult{}',
                    'when this {C:attention}Joker{} triggers'
                }
            },

            j_terraria_eol = {
                name = '{C:dark_edition}Empress of Light{}',
                text = {
                    'Played cards become {C:dark_edition}Polychrome{}',
                    'when {C:attention}scored{}',
                    '{C:dark_edition}Polychrome{} cards give',
                    'an additional {X:mult,C:white}x#1#{} Mult',
                    'when scored'
                },
            },

            j_terraria_moonlord = {
                name = '{C:cyan}Moon Lord{}',
                text = {
                    'Gain {X:mult,C:white}X#2#{} Mult',
                    'when a card is {C:attention}sold{},',
                    'gain {X:mult,C:white}x0.15{} Mult',
                    'when a consumable is {C:attention}used{}',
                    '{C:inactive}(Currently {X:mult,C:white}X#1#{} {C:inactive}Mult){}'
                },
            },

            j_terraria_treasurebag = {
                name = '{C:dark_edition}Treasure Bag',
                text = {
                    'When this {C:attention}Joker{} is sold',
                    'add a random Terraria {C:dark_edition}Legendary{} Joker'
                },
            },
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
