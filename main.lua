------------ MOD CODE -------------------------

-- Mod Icon
SMODS.Atlas {
    key = 'modicon',
    path = "icon.png",
    px = 32,
    py = 32
}

-- Joker Sprites
SMODS.Atlas{
    key = 'Jokers',
    path = 'Jokers.png',
    px = 71,
    py = 95
}

-- base name for custom global variables
G.terraria = {}

-- Credits
SMODS.current_mod.extra_tabs = function()
    local scale = 0.5
    return {
        label = "Credits",
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
                    text = "Programmers: Misenrol, row_set_te",
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
                    text = "Concepting: Misenrol, MegarkShark, row_set_te",
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



-- Load Jimbos
assert(SMODS.load_file("./modules/jokers/kingslime.lua"))()
assert(SMODS.load_file("./modules/jokers/eyeofcthulhu.lua"))()
assert(SMODS.load_file("./modules/jokers/eaterofworlds.lua"))()
assert(SMODS.load_file("./modules/jokers/brainofcthulhu.lua"))()
assert(SMODS.load_file("./modules/jokers/queenbee.lua"))()
assert(SMODS.load_file("./modules/jokers/skeletron.lua"))()
assert(SMODS.load_file("./modules/jokers/wof.lua"))()
assert(SMODS.load_file("./modules/jokers/queenslime.lua"))()
assert(SMODS.load_file("./modules/jokers/sprime.lua"))()
assert(SMODS.load_file("./modules/jokers/dprime.lua"))()
assert(SMODS.load_file("./modules/jokers/tprime.lua"))()
assert(SMODS.load_file("./modules/jokers/plantera.lua"))()
assert(SMODS.load_file("./modules/jokers/golem.lua"))()
assert(SMODS.load_file("./modules/jokers/duke.lua"))()
assert(SMODS.load_file("./modules/jokers/cultist.lua"))()
assert(SMODS.load_file("./modules/jokers/pumpkinmoon.lua"))()
assert(SMODS.load_file("./modules/jokers/frostmoon.lua"))()
assert(SMODS.load_file("./modules/jokers/solarclipse.lua"))()
assert(SMODS.load_file("./modules/jokers/bloodmoon.lua"))()
assert(SMODS.load_file("./modules/jokers/sandel.lua"))()
assert(SMODS.load_file("./modules/jokers/mshark.lua"))()
assert(SMODS.load_file("./modules/jokers/megashark.lua"))()
assert(SMODS.load_file("./modules/jokers/slimestaff.lua"))()
assert(SMODS.load_file("./modules/jokers/rainbowrod.lua"))()
assert(SMODS.load_file("./modules/jokers/meowmere.lua"))()
assert(SMODS.load_file("./modules/jokers/torchgod.lua"))()
assert(SMODS.load_file("./modules/jokers/mechdusa.lua"))()
assert(SMODS.load_file("./modules/jokers/dg.lua"))()
assert(SMODS.load_file("./modules/jokers/eol.lua"))()
assert(SMODS.load_file("./modules/jokers/moonlord.lua"))()
assert(SMODS.load_file("./modules/jokers/treasurebag.lua"))()
