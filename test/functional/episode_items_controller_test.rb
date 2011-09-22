require 'test_helper'

class EpisodeItemsControllerTest < ActionController::TestCase
  setup do
    @episode_item = episode_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:episode_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create episode_item" do
    assert_difference('EpisodeItem.count') do
      post :create, episode_item: @episode_item.attributes
    end

    assert_redirected_to episode_item_path(assigns(:episode_item))
  end

  test "should show episode_item" do
    get :show, id: @episode_item.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @episode_item.to_param
    assert_response :success
  end

  test "should update episode_item" do
    put :update, id: @episode_item.to_param, episode_item: @episode_item.attributes
    assert_redirected_to episode_item_path(assigns(:episode_item))
  end

  test "should destroy episode_item" do
    assert_difference('EpisodeItem.count', -1) do
      delete :destroy, id: @episode_item.to_param
    end

    assert_redirected_to episode_items_path
  end
end
