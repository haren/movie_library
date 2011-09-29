require 'test_helper'

class RoleInAMoviesControllerTest < ActionController::TestCase

	setup do
		@user = FactoryGirl.create(:user)
		session[:user_id] = @user
	end

  test "should not get index even if logged in" do
    get :index
    assert_response :redirect
		assert_redirected_to root_path
  end

  test "should not get new" do
    get :index
    assert_response :redirect
		assert_redirected_to root_path
	end

  test "should create role_in_a_movie" do
		@role_in_a_movie = FactoryGirl.create(:role_in_a_movie)
    assert_difference('RoleInAMovie.count') do
      post :create, role_in_a_movie: @role_in_a_movie.attributes
	  end
  end

  test "should not show role_in_a_movie" do
		@role_in_a_movie = FactoryGirl.create(:role_in_a_movie)
    get :show, id: @role_in_a_movie.to_param
    assert_response :redirect
		assert_redirected_to root_path
  end

  test "should not get edit" do
		@role_in_a_movie = FactoryGirl.create(:role_in_a_movie)
    get :edit, id: @role_in_a_movie.to_param
    assert_response :redirect
		assert_redirected_to root_path
  end

  test "should not update role_in_a_movie" do
		@role_in_a_movie = FactoryGirl.create(:role_in_a_movie, :movie_id => 101)
    put :update, id: @role_in_a_movie.to_param, role_in_a_movie: {:movie_id => 100}
		assert_equal @role_in_a_movie.movie_id, 101
  end

  test "should destroy role_in_a_movie" do
		@role_in_a_movie = FactoryGirl.create(:role_in_a_movie)
    assert_difference('RoleInAMovie.count', -1) do
      delete :destroy, id: @role_in_a_movie.to_param
    end
  end
end
