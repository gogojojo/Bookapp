class SessionsController < ApplicationController
	def new 
	end 
	# no flash messages yet, will add them soon
	def create
			user = User.find_by(email: params[:user][:email])
			if user && user.authenticate(params[:user][:password])
				flash[:success] = 'Login Successful'
				session[:user_id] = user.id 
				redirect_to user_path(user.id)
			else
				flash[:error] = 'Email or passowrd incorrects'
				redirect_to root_path
			end
	end
	def destroy
		session[:user_id] = nil
		redirect_to root_path
	end

end