G.terraria.has_sand_elemental = false

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
		G.terraria.has_sand_elemental = true
	end,
	add_to_deck = function(self, card, from_debuff)
		G.terraria.has_sand_elemental = true
	end,
	renove_from_deck = function(self, card, from_debuff)
		G.terraria.has_sand_elemental = false
	end,
}


-- setting up glass cards to work properly
SMODS.Enhancement:take_ownership('glass',
	{
		update = function(self, card, dt)
			if G.terraria.has_sand_elemental then
				self.config.Xmult = 1.5
				self.config.extra = 999999999999999999999999999999
			else
				self.config.Xmult = 2
				self.config.extra = 4
			end
		end,
		loc_vars = function(self, info_queue, card)
			return { vars = {
				2,
				G.GAME.probabilities.normal or 1,
				4
			} }
		end,
	}, true
)