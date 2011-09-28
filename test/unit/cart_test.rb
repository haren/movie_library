require 'test_helper'

class CartTest < ActiveSupport::TestCase
  def setup
		@cart = Cart.create
		@series = Series.create(:title => "test")
		@episode1 = Episode.create(:title => "test1", :number => 1, :series_id => @series.id, :price => 10.45)
		@episode2 = Episode.create(:title => "test2", :number => 2, :series_id => @series.id, :price => 20.59)
		@movie1   = Movie.create(:title => "test1", :price => 100.32) 	 
	end

	test "no_validation_so_pass" do
		@cart2 = Cart.create(:user_id => nil)
		assert @cart2.valid?
	end

	test "calculate_price" do
		@cart.add_episode(@episode1.id, @episode1.price)
		@cart.add_movie(@movie1.id, @movie1.price)
		
		assert_equal @cart.total_price, @movie1.price + @episode1.price
	end

	test "calculate_price_with_discount" do
		@cart.add_all_episodes(@series)
		assert_equal @cart.total_price, @series.episodes.all.sum(&:price) * 0.9
	end
end
