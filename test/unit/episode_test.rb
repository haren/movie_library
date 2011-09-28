require 'test_helper'

class EpisodeTest < ActiveSupport::TestCase
  test "episode_without_a_title_creation_fail" do
  	@episode1 = Episode.create
		assert @episode1.invalid?
  end

	test "same_number_episodes_within_a_series_fail" do
		@series1  = Series.create(:title => "test")
		@episode1 = Episode.new(:title => "ElDoopa", :number => 42, :series_id => @series1.id)
		@episode2 = Episode.new(:title => "ElDoopa", :number => 42, :series_id => @series1.id)
	assert @episode1.valid?
	assert @episode2.valid?
	assert @episode1.save
	assert !@episode2.save
	assert_equal @episode2.errors[:number].join, ": The episode with a provided number already exists."
	end
end
