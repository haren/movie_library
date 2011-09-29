require 'integration_test_helper' 

class MovieTest < ActionController::IntegrationTest

	setup do
		@user = FactoryGirl.create(:user, :name => 'admin', :password => 'test', :email => 'test@test.test')
	end

	test "viewing movies" do
		visit '/movies'
		assert page.has_content?('Listing movies')
	end

	test 'returning home' do
		visit '/movies'
		click_link 'Home'
		assert current_path == root_path
	end

	test 'try adding new movie not having logged in' do
		visit '/movies'
		click_link 'New Movie'
		assert current_path == login_path
	end

	test 'log in as admin' do
		visit '/login'
		fill_in 'name', :with => 'admin'
		fill_in 'password', :with => 'test'
		click_on 'Login'
		assert current_path == admin_path	
		assert page.has_content?('Log out')
		click_on 'Log out'	
	end

	test 'add new movie' do
		visit '/login'
		fill_in 'name', :with => 'admin'
		fill_in 'password', :with => 'test'
		click_on 'Login'
		visit '/movies'
		click_link 'New Movie'
		assert current_path == new_movie_path
		click_on 'Create Movie'
		assert page.has_content?('error')
		fill_in 'Title', :with => 'Testowy'
		click_on 'Create Movie'
		assert current_path != new_movie_path
		assert page.has_content?('successfully')
		click_on 'Log out'
	end

end
