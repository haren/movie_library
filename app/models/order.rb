class Order < ActiveRecord::Base
	PAYMENT_TYPES = ['Check', 'On delivery', 'Credit Card', 'Bank transfer']

	has_many :movie_items
	has_many :episode_items

	validates :name, :presence => :true, :length => {:minimum => 6}
	validates :address, :presence => :true, :length => {:minimum => 10}
	validates :email, :presence => :true
	validates :pay_type, :presence => :true, :inclusion => PAYMENT_TYPES

	def add_items_from_cart(cart)
		cart.movie_items.all.each do |item|
			item.cart_id = nil
			movie_items << item
		end
		cart.episode_items.all.each do |item|
			item.cart_id = nil
			episode_items << item
		end
		update_attribute :price, cart.total_price
	end
end
