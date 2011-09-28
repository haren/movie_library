require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  test "validation_on_creation" do
  	@film = Movie.new(:title => "")
		assert @film.invalid?

		@film.title = "Dzien Swira"
		assert @film.save

		@film.rating = 11.0
		assert !@film.save
		assert_equal @film.errors[:rating].join, "11.0 has to be between 0 and 10"		
  end

	test "destroying_when_movie_items_associated" do
		@movie = Movie.create(:title => "Porkopolis")
		@movieitem = MovieItem.create(:movie_id => @movie.id)
    assert_no_difference("Movie.count") { @movie.destroy }
	end

#	test "updating_votes_count_after_rating" do
#		@movie = Movie.new(:title=>"DanDan")
#		assert_difference(@movie.rating) {@movie.update(:rating => "6.0")}
#	end

	test "ensuring_no_movie_items_exist_when_deleting_a_movie" do
		@movie = Movie.new(:title => "sample")
		assert @movie.valid?
		@movie.save
		@movieitem = MovieItem.create(:movie_id => @movie.id)
		assert_no_difference("Movie.count") {@movie.destroy}
		assert_equal @movie.errors[:base].join, 'Movie items exist'
	end
end
