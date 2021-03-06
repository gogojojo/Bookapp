class UsersController < ApplicationController
		before_action :authorize, except: [:new, :create]
	def index
 		@users = User.all
 	end
 	def show 
 		@user = User.find(params[:id])
 		if current_user.current
      # method for calculating the math for the progress bar
 			if current_user.current.pages_read && current_user.current.pages
		 		@math = current_user.current.pages_read
		 		@math2 = current_user.current.pages
		 		@answer = (@math/@math2)*100
		 	end
 		end
 	end
 	def new
 		@user = User.new
 	end
 	def create 
 		@user = User.new(params.require(:user).permit(:name, :username, :email, :password, :password_confirmation))

 		if @user.save
 			flash[:success] = 'Login Sucessful'
 			session[:user_id] = @user.id 
 			redirect_to user_path(@user.id)
 		else
 			flash[:error] = @user.errors.full_messages.to_sentence
 			redirect_to root_path
 		end
 	end
 	def edit
 		@user = User.find(params[:id])
 	end
 	def update
 		@user = User.find(params[:id])
 		@user.update_attributes(params.require(:user).permit(:name))
			redirect_to user_path(@user.id)
 	end
 	def destroy
 		@user = User.find(params[:id])
 		@user.destroy 
 		redirect_to root_path
 	end
 	def progress 
 		@math = (current_user.current.pages_read/current_user.current.page)
 		@hello = 'hello'
 	end
end
