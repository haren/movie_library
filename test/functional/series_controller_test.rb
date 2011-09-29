require 'test_helper'

class SeriesControllerTest < ActionController::TestCase
  setup do
    @series = FactoryGirl.create(:series)
  end

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
		session[:user_id] = @user
    get :new
    assert_response :success
  end

  test "should create series if logged_in" do
		@user = FactoryGirl.create(:user)
		session[:user_id] = @user
    assert_difference('Series.count') do
      post :create, series: @series.attributes
    end

    assert_redirected_to series_path(assigns(:series))
  end

  test "should show series" do
    get :show, id: @series.to_param
    assert_response :success
  end

  test "should get edit if logged in" do
		@user = FactoryGirl.create(:user)
		session[:user_id] = @user
    get :edit, id: @series.to_param
    assert_response :success
  end

  test "should update series if logged_in" do
		@user = FactoryGirl.create(:user)
		session[:user_id] = @user

    put :update, id: @series.to_param, :title => "Totally for tests"
    assert_redirected_to series_path(assigns(:series))
		assert_equal @series.title, "Totally for tests"
  end

#  test "should destroy series" do
#    assert_difference('Series.count', -1) do
#      delete :destroy, id: @series.to_param
#    end

#    assert_redirected_to series_index_path
#  end
end
