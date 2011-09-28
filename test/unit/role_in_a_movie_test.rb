require 'test_helper'

class RoleInAMovieTest < ActiveSupport::TestCase
  test "see_what_is_valid_and_what_not" do
  	@roleinamovie = RoleInAMovie.new(:movie_id => nil)
		assert @roleinamovie.valid?
  end
end
