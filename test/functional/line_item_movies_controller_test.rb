require 'test_helper'

class LineItemMoviesControllerTest < ActionController::TestCase
  setup do
    @line_item_movie = line_item_movies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:line_item_movies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create line_item_movie" do
    assert_difference('LineItemMovie.count') do
      post :create, line_item_movie: @line_item_movie.attributes
    end

    assert_redirected_to line_item_movie_path(assigns(:line_item_movie))
  end

  test "should show line_item_movie" do
    get :show, id: @line_item_movie.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @line_item_movie.to_param
    assert_response :success
  end

  test "should update line_item_movie" do
    put :update, id: @line_item_movie.to_param, line_item_movie: @line_item_movie.attributes
    assert_redirected_to line_item_movie_path(assigns(:line_item_movie))
  end

  test "should destroy line_item_movie" do
    assert_difference('LineItemMovie.count', -1) do
      delete :destroy, id: @line_item_movie.to_param
    end

    assert_redirected_to line_item_movies_path
  end
end
