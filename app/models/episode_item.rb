class EpisodeItem < ActiveRecord::Base
	belongs_to :episode
	belongs_to :cart

	def total_price
		self.episode.price * self.quantity
	end

	def update_quantity	
		update_attribute(:quantity, self.quantity - 1)
	end
end
