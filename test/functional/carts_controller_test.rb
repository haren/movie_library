require 'test_helper'

class CartsControllerTest < ActionController::TestCase
	fixtures :carts

  setup do
    @cart = carts(:one)
  end

  test "should not get index" do
    get :index
    assert_response :redirect
	end

  test "should not get new" do
    get :new
    assert_response :redirect
  end

  test "should create cart" do
    assert_difference('Cart.count') do
      post :create, cart: @cart.attributes
    end

    assert_redirected_to cart_path(assigns(:cart))
  end

  test "should not view cart show page even if logged in" do
		@user = User.create(:name => "Jacek", :password => "jolalojalna", :email => "Jacek@lukasz.marek")
		session[:user_id] = @user.id

    get :show, id: @cart.to_param
    assert_response :redirect
		assert_redirected_to root_path
  end

  test "should not get edit" do
    get :edit, id: @cart.to_param
    assert_response :redirect
		assert_redirected_to login_path
  end

  test "should not get edit even if logged in" do
		@user = User.create(:name => "Jacek", :password => "jolalojalna", :email => "Jacek@lukasz.marek")
		session[:user_id] = @user.id

    get :edit, id: @cart.to_param
    assert_response :redirect
		assert_redirected_to root_path
  end

  test "should update cart" do
    put :update, id: @cart.to_param, cart: @cart.attributes
    assert_redirected_to cart_path(assigns(:cart))
  end

  test "should destroy cart" do
    assert_raise(NoMethodError) do
      delete :destroy, id: @cart.to_param
    end
  end
end
