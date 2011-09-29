require 'test_helper'

class OrdersControllerTest < ActionController::TestCase

  test "should not get index even if logged in" do
		@user = FactoryGirl.create(:user)
		session[:user_id] = @user
    get :index
    assert_response :redirect
		assert_redirected_to root_path
		assert_equal "You are not supposed to view this page.", flash[:notice]
	end

	test "should get index if logged in and admin" do
		@user = FactoryGirl.create(:user, :name => 'admin')
		session[:user_id] = @user
    get :index
    assert_response :success
	end

  test "should not get index" do
		get :index
    assert_response :redirect
		assert_redirected_to login_path
	end

  test "should not get new unless logged in" do
    get :new
    assert_response :redirect
		assert_redirected_to login_path
  end

  test "should create order if logged in" do
		@user = FactoryGirl.create(:user)
		session[:user_id] = @user
		@order = FactoryGirl.create(:order)

    assert_difference('Order.count') do
      post :create, order: @order.attributes
    end

    assert_redirected_to root_path, notice: 'Order was successfully created.'
  end

  test "should not show order" do
		@order = FactoryGirl.create(:order)

    get :show, id: @order.to_param
    assert_response :redirect
		assert_redirected_to login_path
  end

  test "should not see order even if logged in" do
		@user = FactoryGirl.create(:user)
		session[:user_id] = @user
		@order = FactoryGirl.create(:order)

    get :show, id: @order.to_param
    assert_response :redirect
		assert_redirected_to root_path
  end

  test "should get edit only if admin" do
		@user = FactoryGirl.create(:user, :name => 'admin')
		session[:user_id] = @user
		@order = FactoryGirl.create(:order)

    get :edit, id: @order.to_param
    assert_response :success
  end

  test "should not update order" do
		@user = FactoryGirl.create(:user)
		session[:user_id] = @user
		@order = FactoryGirl.create(:order)

    put :update, id: @order.to_param, order: {:name => 'dadasdas'}
		assert_equal 'John', @order.name
  end

  test "should not destroy order" do
		@user = FactoryGirl.create(:user)
		session[:user_id] = @user
		@order = FactoryGirl.create(:order)

    assert_no_difference('Order.count') do
      delete :destroy, id: @order.to_param
    end
  end
end
