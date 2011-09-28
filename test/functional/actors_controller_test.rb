require 'test_helper'

class ActorsControllerTest < ActionController::TestCase
	fixtures :actors

  setup do
    @actor = actors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success 
    assert_not_nil assigns(:actors)
  end

  test "should not get new without logging in" do
    get :new
    assert_response :redirect
	end

	test "logged-in user should get new" do
		@user = User.create(:name => "Luki", :password => "Luki", :email => "luki@luki.luki")
		session[:user_id] = @user.id
		get :new
		assert_response :success		 
  end

  test "logged-in user should create actor" do
		@user = User.create(:name => "Luki", :password => "Luki", :email => "luki@luki.luki")
		session[:user_id] = @user.id
    assert_difference('Actor.count') do
      post :create, actor: @actor.attributes
    end

    assert_redirected_to actor_path(assigns(:actor))
  end

	test "should not create actor without logging in" do
    assert_no_difference('Actor.count') do
      post :create, actor: @actor.attributes
    end

    assert_redirected_to login_path
  end

  test "should show actor" do
    get :show, id: @actor.to_param
    assert_response :success
  end

  test "logged-in user should get edit" do
		@user = User.create(:name => "Luki", :password => "Luki", :email => "luki@luki.luki")
		session[:user_id] = @user.id
    get :edit, id: @actor.to_param
    assert_response :success
  end

  test "logged-in user should update actor" do
		@user = User.create(:name => "Luki", :password => "Luki", :email => "luki@luki.luki")
		session[:user_id] = @user.id
    put :update, id: @actor.to_param, actor: @actor.attributes
    assert_redirected_to actor_path(assigns(:actor))
  end

	test "should_not_update_actor without logging in" do
		put :update, id: @actor.to_param, actor: @actor.attributes
		assert_redirected_to login_path
	end

  test "should not destroy actor without logging in" do
    assert_no_difference('Actor.count') do
      delete :destroy, id: @actor.to_param
    end

    assert_redirected_to login_path
  end

	test "logged-in_user_should_destroy_actor" do
		@user = User.create(:name => "Luki", :password => "Luki", :email => "luki@luki.luki")
		session[:user_id] = @user.id		

		assert_difference('Actor.count', -1) do
      delete :destroy, id: @actor.to_param
    end

    assert_redirected_to actors_path
		end
end
