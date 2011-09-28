require 'test_helper'

class SeriesTest < ActiveSupport::TestCase
  test "adding_unique_episodes" do
  	@series = Series.create(:title => "elemeledudki")
		@episode = Episode.create(:title => "solo test", :number => 1, :series_id => @series.id, :price => 16.78)
		assert @series.valid?
		assert @episode.valid?

		assert @series.calculate_price
		assert_in_delta @series.price.to_f, @episode.price.to_f * 0.9, 0.01
		assert_equal @series.title_shortened, @series.title
		assert_equal @series.episodes.count, 1
		
  end
end
