class UsersController < ApplicationController
		before_action :authorize, except: [:new, :create]
	def index
 		@users = User.all
 	end
 	def show 
 		@user = User.find(params[:id])
 	end
 	def new
 		@user = User.new
 	end
 	def create 
 		@user = User.new(params.require(:user).permit(:name, :username, :email, :password, :password_confirmation))

 		if @user.save
 			redirect_to login_path
 		else
 			render "new"
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
 		redirect_to users_path
 	end
end
