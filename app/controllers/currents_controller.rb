class CurrentsController < ApplicationController
		before_action :authorize
	# def index
 # 		@books = Book.all
 # 	end
 # 	def show 
 # 		@book = Book.find(params[:id])
 # 	end
 	def new
 		@current =  current_user.current = Current.new
 	end
 	def update
 		current_user.current = Current.new(params.require(:current).permit(:title, :author, :pages, :pages_read))
			redirect_to user_path(current_user)
 	end
 	def finished
 		@book = Book.new(title: current_user.current.title)
 		current_user.books.push(@book)
 		current_user.current = nil
 		redirect_to user_path(current_user.id)
 	end
end