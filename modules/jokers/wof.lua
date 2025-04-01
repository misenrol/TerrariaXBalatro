--- For WoF to have the random suits
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

--- Actual code for the WoF
SMODS.Joker {
	key = 'wof',
    atlas = 'Jokers',
	pos = { x = 2, y = 1 },

	blueprint_compat = true,
	perishable_compat = true,
	eternal_compat = true,
    discovered = true,
    unlocked = true,
	rarity = 2,
	cost = 6,
	config = { extra = { } },

	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				localize(G.GAME.current_round.wof_card.suit, 'suits_singular'),
				colours = { G.C.SUITS[G.GAME.current_round.wof_card.suit] }
			}
		}
	end,

	calculate = function(self, card, context)
		if context.before then
            local is_correct_flush = true
            if #context.scoring_hand < 5 then -- checking if hand is at least 5 cards (keeping support for larger playing hand sizes)
                is_correct_flush = false
            end
            for _,_card in ipairs(context.scoring_hand) do
                if _card:is_suit(G.GAME.current_round.wof_card.suit) ~= true then -- iterating through played cards and checking suit
                    is_correct_flush = false
                end
            end
            if is_correct_flush == true then
				if (#G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit) then
					G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1

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
    end
}
