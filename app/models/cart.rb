class Cart < ActiveRecord::Base
		has_many :line_item_movies, :dependent => :destroy
end
