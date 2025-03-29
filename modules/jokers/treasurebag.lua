SMODS.Joker{
    key = 'treasurebag',
    config = {
        extra = {
            options = {
                'j_terraria_eol',
                'j_terraria_torchgod',
                'j_terraria_moonlord',
                'j_terraria_dg',
                'j_terraria_mechdusa'
            }
        }
    },
    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,
    rarity = 3,
    cost = 15,
    blueprint_compat = true,
    eternal_compat = false,
    unlock_card = true,
    discovered = true,
    atlas = 'Jokers',
    pos = { x = 0, y = 7 },

    calculate = function(self, card, context)
        if context.selling_self then
            G.E_MANAGER:add_event(Event({
                func = function()
                    local key = pseudorandom_element(card.ability.extra.options, pseudoseed('treasurebag'))
                    SMODS.add_card({ key = key, type = 'Joker' })

                    play_sound('magic_crumple2', 0.9 + math.random() * 0.1, 0.8)
                    play_sound('negative', 1.2 + math.random() * 0.1, 0.4)

                    return true
                end
            }))
        end
    end
}

