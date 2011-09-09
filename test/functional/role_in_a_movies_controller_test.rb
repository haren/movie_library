require 'test_helper'

class RoleInAMoviesControllerTest < ActionController::TestCase
  setup do
    @role_in_a_movie = role_in_a_movies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:role_in_a_movies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create role_in_a_movie" do
    assert_difference('RoleInAMovie.count') do
      post :create, role_in_a_movie: @role_in_a_movie.attributes
    end

    assert_redirected_to role_in_a_movie_path(assigns(:role_in_a_movie))
  end

  test "should show role_in_a_movie" do
    get :show, id: @role_in_a_movie.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @role_in_a_movie.to_param
    assert_response :success
  end

  test "should update role_in_a_movie" do
    put :update, id: @role_in_a_movie.to_param, role_in_a_movie: @role_in_a_movie.attributes
    assert_redirected_to role_in_a_movie_path(assigns(:role_in_a_movie))
  end

  test "should destroy role_in_a_movie" do
    assert_difference('RoleInAMovie.count', -1) do
      delete :destroy, id: @role_in_a_movie.to_param
    end

    assert_redirected_to role_in_a_movies_path
  end
end
