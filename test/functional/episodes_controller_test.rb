require 'test_helper'

class EpisodesControllerTest < ActionController::TestCase

	setup do
		@series = FactoryGirl.create(:series)
	end

  test "should get index" do		
    get :index, :series_id => @series
    assert_response :success
  end

  test "should not get new unless logged in" do
		get :new, :series_id => @series
    assert_response :redirect
		assert_redirected_to login_path
  end

	test "should not get new if logged in" do
		@user = FactoryGirl.create(:user)
		session[:user_id] = @user.id

    get :new, :series_id => @series
    assert_response :success
  end

  test "should not create episode unless logged in" do
		@episode = FactoryGirl.create(:episode, :series_id => @series)
    assert_no_difference('Episode.count') do
      post :create, episode: @episode.attributes, :series_id => @series
    end

    assert_redirected_to login_path
  end

  test "should create episode if logged in" do
		@user = FactoryGirl.create(:user, :name => "mateusz")
		session[:user_id] = @user.id
		@episode = FactoryGirl.build(:episode)
		assert @episode.valid?
    
		assert_difference('Episode.count') do
      post :create, :series_id => @episode.series_id, episode: @episode.attributes
    end

    assert_redirected_to series_episode_path(@episode.series_id, assigns(:episode))
  end

  test "should show episode" do
		@episode = FactoryGirl.create(:episode)
    get :show, id: @episode.to_param, :series_id => @episode.series_id
    assert_response :success
  end

  test "should get edit if logged in" do
		@episode = FactoryGirl.create(:episode)
		@user = FactoryGirl.create(:user)
		session[:user_id] = @user.id
    get :edit, id: @episode.to_param, :series_id => @episode.series_id, episode: @episode.attributes
    assert_response :success
  end

  test "should update episode if logged in" do
		@user = FactoryGirl.create(:user)
		session[:user_id] = @user.id
		@episode = FactoryGirl.create(:episode, :series_id => @series,:title=>"tarararar")
    put :update, id: @episode.to_param, episode: @episode.attributes, :series_id => @episode.series_id
    assert_redirected_to series_episode_path(@series, @episode)
  end


  test "should destroy episode if logged in" do
		@user = FactoryGirl.create(:user)
		session[:user_id] = @user.id
		assert @user.valid?
		@episode = FactoryGirl.create(:episode, :series_id => @series)
    assert_difference('Episode.count', -1) do
      delete :destroy, id: @episode.to_param, :series_id => @episode.series_id
    end

    assert_redirected_to series_episodes_path(@series)
  end
end
