class MovieItem < ActiveRecord::Base
	belongs_to :movie
	belongs_to :cart
	belongs_to :order

	def total_price
		self.movie.price * self.quantity
	end

	def update_quantity	
		update_attribute(:quantity, self.quantity - 1)
	end
end
