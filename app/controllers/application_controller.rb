class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def home
    @books = Book.all
    @user = User.new
  end
  def current_user 
  	@current_user ||= User.find(session[:user_id]["$oid"]) if session[:user_id]
  end
  helper_method :current_user
  def authorize
	unless current_user
		redirect_to root_path
	end
  end
end
