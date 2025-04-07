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
}

-- setting up glass cards to work properly
SMODS.Enhancement:take_ownership('glass',
	{
	    calculate = function(self,card,context)
			local has_sandel = false
			if #G.jokers ~= 0 then
				for i=0, #G.jokers do
					if G.jokers[i].config.center.key == 'j_terraria_sandel' then
						if G.jokers[i].debuff == false then
							has_sandel = true
						end
					end
				end
			end
			if context.individual and context.cardarea == G.play and not context.end_of_round then
				if has_sandel then
					card.ability.extra = 99999999999999999999
				else
					card.ability.extra = G.P_CENTERS.m_glass.config.extra
				end
				if has_sandel == true then 
					return {
						xmult = 1.5
					}
				else
					return {
						xmult = self.config.Xmult
					}
				end
	
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
