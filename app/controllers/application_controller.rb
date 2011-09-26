class ApplicationController < ActionController::Base
  protect_from_forgery
	
	before_filter :set_current_cart
	before_filter :authorize

	helper_method :logged_in?
	helper_method :current_user
	helper_method :context
	helper_method :comment_path
	helper_method :authorized?

	def logged_in?
		return true if session[:user_id]
		return false
	end

	def current_user
		User.find_by_id(session[:user_id])
	end

	def check_if_admin
		redirect_to root_path, :notice => "You are not supposed to view this page." unless current_user.name == "admin"
	end

	def context
		if params[:movie_id]
		  Movie.find(params[:movie_id])
		elsif params[:episode_id]
			Episode.find(params[:episode_id])
		elsif params[:series_id]
			Series.find(params[:series_id])
		else
			nil
		end
	end

	def comments_path (*args)
		if Movie === context
		  movie_comments_path(context.id, *args)
		elsif Series === context
		  series_comments_path(context.id, *args)
		else
			series_episode_comments_path(context.series.id, context.id, *args)
		end
	end

	def authorized?(comment)
		return true if current_user && comment.by == current_user.name 
		return true if current_user && current_user.name == "admin"
		return false
	end
	
	private

	def current_cart
		if logged_in? && current_user && current_user.cart
			current_cart = current_user.cart
		end
	end

	def set_current_cart
		@cart = current_cart 
	end

	def authorize
		unless User.find_by_id(session[:user_id])
			redirect_to login_url, :notice => "Please log in"
		end
	end
end
