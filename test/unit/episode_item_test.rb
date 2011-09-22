require 'test_helper'

class EpisodeItemTest < ActiveSupport::TestCase
   test "adding whole series adds discount" do
   	@cart = Cart.new
		@series = Series.all.first
		@cart.add_all_episodes(@series)	
		assert_equal @cart.discount, @series.episodes.all.sum(&:price)
   end
end
