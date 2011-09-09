require 'test_helper'

class RoleInAnEpisodesControllerTest < ActionController::TestCase
  setup do
    @role_in_an_episode = role_in_an_episodes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:role_in_an_episodes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create role_in_an_episode" do
    assert_difference('RoleInAnEpisode.count') do
      post :create, role_in_an_episode: @role_in_an_episode.attributes
    end

    assert_redirected_to role_in_an_episode_path(assigns(:role_in_an_episode))
  end

  test "should show role_in_an_episode" do
    get :show, id: @role_in_an_episode.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @role_in_an_episode.to_param
    assert_response :success
  end

  test "should update role_in_an_episode" do
    put :update, id: @role_in_an_episode.to_param, role_in_an_episode: @role_in_an_episode.attributes
    assert_redirected_to role_in_an_episode_path(assigns(:role_in_an_episode))
  end

  test "should destroy role_in_an_episode" do
    assert_difference('RoleInAnEpisode.count', -1) do
      delete :destroy, id: @role_in_an_episode.to_param
    end

    assert_redirected_to role_in_an_episodes_path
  end
end
