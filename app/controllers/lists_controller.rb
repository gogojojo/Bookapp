class ListsController < ApplicationController
		before_action :authorize
	def index
 		@lists = current_user.lists.all
 	end
 	def show 
 		@list = current_user.lists.find(params[:id])
 	end
 	def new
 		@list = current_user.lists.new
 	end
 	def create 
 		@list = current_user.lists.new(params.require(:list).permit(:title))

 		if @list.save
 			redirect_to lists_path
 		else
 			render "new"
 		end
 	end
 	# def edit
 	# 	@book = Book.find(params[:id])
 	# end
 	# def update
 	# 	@book = Book.find(params[:id])
 	# 	@book.update_attributes(params.require(:book).permit(:title, :pages))
		# 	redirect_to book_path(@book.id)
 	# end
 	# def destroy
 	# 	@book = book.find(params[:id])
 	# 	@book.destroy 
 	# 	redirect_to user_path(current_user.id)
 	# end
end
