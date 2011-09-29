require 'test_helper'

class MoviesControllerTest < ActionController::TestCase

  test "should get index" do		
    get :index
    assert_response :success
  end

  test "should not get new unless logged in" do
		get :new
    assert_response :redirect
		assert_redirected_to login_path
  end

	test "should get new if logged in" do
		@user = FactoryGirl.create(:user)
		session[:user_id] = @user.id

    get :new
    assert_response :success
  end

  test "should not create movie unless logged in" do
		@movie = FactoryGirl.create(:movie)
    assert_no_difference('Movie.count') do
      post :create, movie: @movie.attributes
    end

    assert_redirected_to login_path
  end

  test "should create movie if logged in" do
		@user = FactoryGirl.create(:user, :name => "mateusz")
		session[:user_id] = @user.id
		@movie = FactoryGirl.build(:movie)
		assert @movie.valid?
    
		assert_difference('Movie.count') do
      post :create, movie: @movie.attributes
    end

    assert_redirected_to movie_path(assigns(:movie))
  end

  test "should show movie" do
		@movie = FactoryGirl.create(:movie)
    get :show, id: @movie.to_param
    assert_response :success
  end

  test "should get edit if logged in" do
		@movie = FactoryGirl.create(:movie)
		@user = FactoryGirl.create(:user)
		session[:user_id] = @user.id
    get :edit, id: @movie.to_param, movie: @movie.attributes
    assert_response :success
  end

  test "should update movie if logged in" do
		@user = FactoryGirl.create(:user)
		session[:user_id] = @user.id
		@movie = FactoryGirl.create(:movie, :title=>"tarararar")
    put :update, id: @movie.to_param, movie: @movie.attributes
    assert_redirected_to movie_path(@movie)
  end


  test "should destroy movie if logged in" do
		@user = FactoryGirl.create(:user)
		session[:user_id] = @user.id
		assert @user.valid?
		@movie = FactoryGirl.create(:movie)
    assert_difference('Movie.count', -1) do
      delete :destroy, id: @movie.to_param
    end

    assert_redirected_to movies_path
  end
end
