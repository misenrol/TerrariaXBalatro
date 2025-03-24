SMODS.Joker{
    key = 'cultist',
    atlas = 'Jokers',
    pos = { x = 4, y = 2 },

    cost = 8,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    unlock_card = true,
    discovered = true,
    atlas = 'Jokers',
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

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = {key = 'tag_charm', set = 'Tag'}
        info_queue[#info_queue+1] = {key = 'tag_meteor', set = 'Tag'}
        info_queue[#info_queue+1] = {key = 'tag_ethereal', set = 'Tag'}
        return {vars = {card.ability.extra.selection, card.ability.extra.options}}
    end,

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