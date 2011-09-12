class LineItemMovie < ActiveRecord::Base
	belongs_to :movie
	belongs_to :cart
end
