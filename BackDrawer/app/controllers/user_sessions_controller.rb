class UserSessionsController < ApplicationController
	
  def new
  end

  def create
  	user = User.find_by(username: params[:username])
  	if user && user.authenticate(params[:password])
	  	user.authenticate(params[:password])
	  	session[:user_id] = user.id
      if session[:return_to]
        redirect_to session[:return_to]
      else
        redirect_to user_path(session[:user_id])
      end
  	else
  		flash[:error] = "There was a problem logging in. Please check your email and password."
  		render action: 'new'

  	end
  end

  def destroy
    # Remove the user id from the session
    @current_user = session[:user_id] = nil
    redirect_to root_url
  end
end
