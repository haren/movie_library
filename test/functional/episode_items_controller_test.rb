require 'test_helper'

class EpisodeItemsControllerTest < ActionController::TestCase

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

  test "should not create episode_item unless logged in" do
    assert_no_difference('EpisodeItem.count') do
      post :create, episode_item: {}
    end
    assert_redirected_to login_path
  end

  test "should create episode_item if logged-in" do
		@user = FactoryGirl.create(:user)
		session[:user_id] = @user.id

		ei = FactoryGirl.build(:episode_item)
	  assert_difference('EpisodeItem.count') do
      post :create, :episode_id => ei.episode_id, episode_item: ei.attributes
    end
    assert_redirected_to series_episodes_path(ei.episode.series)
  end

  test "should not show episode_item" do
		@episode_item = FactoryGirl.create(:episode_item)
    get :show, id: @episode_item.to_param
    assert_response :redirect
		assert_redirected_to login_path
  end

  test "should not get edit" do
		@episode_item = FactoryGirl.create(:episode_item)
    get :edit, id: @episode_item.to_param
    assert_response :redirect
		assert_redirected_to login_path
  end

  test "should not update episode_item" do
		@episode_item = FactoryGirl.create(:episode_item)
    put :update, id: @episode_item.to_param, episode_item: {"episode_id" => 2}
		assert_equal @episode_item.episode_id, 1
    assert_redirected_to login_path
  end


  test "should not destroy episode_item unless logged in" do
		@episode_item = FactoryGirl.create(:episode_item)
    assert_no_difference('EpisodeItem.count') do
      delete :destroy, id: @episode_item.to_param
    end
    assert_redirected_to login_path
  end

  test "should destroy episode_item of quantity = 1 if logged in" do
		@user = FactoryGirl.create(:user)
		session[:user_id] = @user.id
		@episode_item = FactoryGirl.create(:episode_item, :quantity => 1)
    assert_difference('EpisodeItem.count', -1) do
      delete :destroy, id: @episode_item.to_param
    end

    assert_redirected_to series_index_path
  end

  test "should not destroy episode_item of quantity > 1 if logged in" do
		@user = FactoryGirl.create(:user)
		session[:user_id] = @user.id
		@episode_item = FactoryGirl.create(:episode_item, :quantity => 2)
    assert_no_difference('EpisodeItem.count') do
      delete :destroy, id: @episode_item.to_param
    end

    assert_redirected_to series_index_path
  end
end
