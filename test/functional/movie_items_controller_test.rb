require 'test_helper'

class MovieItemsControllerTest < ActionController::TestCase
  
  test "should not get index" do
    get :index
    assert_response :redirect
		assert_redirected_to login_path
  end

  test "should not get new" do
    get :new
    assert_response :redirect
		assert_redirected_to login_path
  end

  test "should not create movie_item unless logged in" do
    assert_no_difference('MovieItem.count') do
      post :create, movie_item: {}
    end
    assert_redirected_to login_path
  end

  test "should create movie_item if logged-in" do
		@user = FactoryGirl.create(:user)
		session[:user_id] = @user.id

		m = FactoryGirl.build(:movie_item)
	  assert_difference('MovieItem.count') do
      post :create, movie_item: m.attributes, :movie_id => m.movie_id
    end
    assert_redirected_to movies_path
  end

  test "should not show movie_item" do
		@movie_item = FactoryGirl.create(:movie_item)
    get :show, id: @movie_item.to_param
    assert_response :redirect
		assert_redirected_to login_path
  end

  test "should not get edit" do
		@movie_item = FactoryGirl.create(:movie_item)
    get :edit, id: @movie_item.to_param
    assert_response :redirect
		assert_redirected_to login_path
  end

  test "should not update movie_item" do
		@movie_item = FactoryGirl.create(:movie_item)
    put :update, id: @movie_item.to_param, movie_item: {"movie_id" => 2}
		assert_equal @movie_item.movie_id, 1
    assert_redirected_to login_path
  end


  test "should not destroy movie_item unless logged in" do
		@movie_item = FactoryGirl.create(:movie_item)
    assert_no_difference('MovieItem.count') do
      delete :destroy, id: @movie_item.to_param
    end
    assert_redirected_to login_path
  end

  test "should destroy movie_item of quantity = 1 if logged in" do
		@user = FactoryGirl.create(:user)
		session[:user_id] = @user.id
		@movie_item = FactoryGirl.create(:movie_item, :quantity => 1)
    assert_difference('MovieItem.count', -1) do
      delete :destroy, id: @movie_item.to_param
    end

    assert_redirected_to movies_path
  end

  test "should not destroy movie_item of quantity > 1 if logged in" do
		@user = FactoryGirl.create(:user)
		session[:user_id] = @user.id
		@movie_item = FactoryGirl.create(:movie_item, :quantity => 2)
    assert_no_difference('MovieItem.count') do
      delete :destroy, id: @movie_item.to_param
    end

    assert_redirected_to movies_path
  end
end
