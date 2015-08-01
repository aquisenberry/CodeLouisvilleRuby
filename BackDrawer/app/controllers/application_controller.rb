class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  add_flash_types :danger, :success, :warning, :info

  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def store_return_to
	session[:return_to] = request.url
  end

  def require_login
  	if current_user
  		true
  	else
  		store_return_to
  		redirect_to new_user_session_path, info: "Please log in to view that content"
  	end
  end
end
