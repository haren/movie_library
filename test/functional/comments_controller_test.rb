require 'test_helper'

class CommentsControllerTest < ActionController::TestCase

	setup do
		@movie = Movie.create(:title => "tytul")
	end
  test "should get index" do
  	get :index, 'movie_id' => @movie.id
		assert_response :success
  end

	test "should get show" do
		@comment = Comment.create(:content => "Byle jaka", :by => "mateusz", :commentary_type => "Movie", :commentary_id => @movie.id)
		get :show, 'movie_id' => @movie.id, 'id' => @comment.id
		assert_response :success
	end

	test "should not get new unless logged in" do
		get :new, 'movie_id' => @movie.id
		assert_response :redirect
		assert_redirected_to login_path
	end

	test "should get new if logged in" do
		@user = User.create(:name => "Maciej", :password=> "Z_Brynowa", :email=> "maciej@brynow.pl")
		session[:user_id] = @user.id
		get :new, 'movie_id' => @movie.id
		assert_response :success
	end

	test "should not create comment unless logged in" do
		@comment = Comment.create(:content => "Byle jaka", :by => "mateusz", :commentary_type => "Movie", :commentary_id => @movie.id)
		assert_no_difference('Comment.count') do
			post :create, 'movie_id' => @movie.id, comment: @comment.attributes
		end
		assert_redirected_to login_path
	end

	test "should create comment if logged in" do
		@user = User.create(:name => "Maciej", :password=> "Z_Brynowa", :email=> "maciej@brynow.pl")
		@comment = Comment.create(:content => "Byle jaka", :by => "mateusz", :commentary_type => "Movie", :commentary_id => @movie.id)
		session[:user_id] = @user.id
		assert_difference('Comment.count') do
			post :create, 'movie_id' => @movie.id, comment: @comment.attributes
		end
		assert_redirected_to movie_comments_path(@movie)
	end

	test "should not delete comment unless logged in" do
		@comment = Comment.create(:content => "Byle jaka", :by => "mateusz", :commentary_type => "Movie", :commentary_id => @movie.id)
		assert_no_difference('Comment.count') do
			delete :destroy, 'movie_id' => @movie.id, id: @comment.to_param 
		end
	end

	test "should delete comment if logged in" do
		@user = User.create(:name => "Maciej", :password=> "Z_Brynowa", :email=> "maciej@brynow.pl")
		@comment = Comment.create(:content => "Byle jaka", :by => "mateusz", :commentary_type => "Movie", :commentary_id => @movie.id)
		session[:user_id] = @user.id
		assert_difference('Comment.count', -1) do
			delete :destroy, 'movie_id' => @movie.id, id: @comment.to_param 
	end
	end
end
