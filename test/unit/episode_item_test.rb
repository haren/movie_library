require 'test_helper'

class EpisodeItemTest < ActiveSupport::TestCase
   test "adding whole series adds discount" do
   	@cart = Cart.create
		@series = Series.create(:title => "test")
		episode1 = Episode.create(:title => "test1", :number => 1, :series_id => @series.id)
		episode2 = Episode.create(:title => "test2", :number => 2, :series_id => @series.id)
		@cart.add_all_episodes(@series)	
		assert_equal @cart.discount, @series.episodes.all.sum(&:price) * 0.1
   end
end
