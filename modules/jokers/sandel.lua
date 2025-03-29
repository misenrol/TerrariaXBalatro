SMODS.Joker{
	key = 'sandel',
	atlas = 'Jokers',
	pos = {x = 4, y = 5},
	rarity = 3,
	cost = 7,
	blueprint_compat= true,
    discovered = true,
    unlocked = true,
	config = { extra = {Xmult = 1, Xmult_gain = 1}},

	loc_vars = function(self, info_queue, card)
		return { vars = {
			card.ability.extra.Xmult, 
			card.ability.extra.Xmult_gain, 
		} }
	end,
	
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				Xmult_mod = card.ability.extra.Xmult,
				message = localize { type = 'variable', key = 'a_xmult', vars = {card.ability.extra.Xmult } }
	
			}
		end
		if context.individual and context.cardarea == G.play and context.other_card:is_face() and not context.blueprint then
			card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_gain
			play_sound(mikuxbalatro_neru_camera, 1, 10)
			return{
				message = 'Upgrade',
				colour = G.C.YELLOW,
				card = card,
			}
		end
		if context.end_of_round and not context.repetition and context.game_over == false and not context.blueprint then
			card.ability.extra.Xmult = 1
			return {
				message = 'Swept away!',
				colour = G.C.RED
			}
		end
	end
}
