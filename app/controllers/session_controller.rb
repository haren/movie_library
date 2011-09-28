class SessionController < ApplicationController
	skip_before_filter :authorize

  def new
		if logged_in?
			redirect_to root_path, :notice => "Already logged in."
		end
  end

  def create
		if user = User.authenticate(params[:name], params[:password])
			session[:user_id] = user.id
			if user.name == "admin"			
				redirect_to admin_url
			else
				redirect_to root_path, :notice => "Succesfully logged in."
			end
		else
			redirect_to login_url, :alert => "Invalid user/password combination"
		end
  end

  def destroy
		session[:user_id] = nil
		redirect_to root_path, :notice => "Logged out."
  end

end
