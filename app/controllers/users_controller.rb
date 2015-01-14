class UsersController < ApplicationController
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
 		@user = User.new(params.require(:user).permit(:name))
 		
 		if @user.save
 			redirect_to users_path
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
