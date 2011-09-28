require 'test_helper'

class AdminControllerTest < ActionController::TestCase
  test "should not get index without logging in as admin" do
    get :index
    assert_response :redirect
  end

	test "should_get_index_after_logging_in_as_admin" do
		@admin = User.create(:name => "admin", :password => "admin", :email => "admin@admin.pl")
		session[:user_id] = @admin.id
		get :index
    assert_response :success
	end

end
