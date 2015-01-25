class BooksController < ApplicationController
		before_action :authorize
	def index
 		@books = Book.all
 	end
 	def show 
 		@book = Book.find(params[:id])
 	end
 	def new
 		@book = Book.new
 	end
 	def create 
 		@book = Book.new(params.require(:book).permit(:title, :pages, :author))

 		if @book.save
 			redirect_to user_path(current_user.id)
 			@book.user_ids.push(current_user.id)
 			current_user.books.push(@book)
 		else
 			render "new"
 		end
 	end
 	def edit
 		@book = Book.find(params[:id])
 	end
 	def update
 		@book = Book.find(params[:id])
 		@book.update_attributes(params.require(:book).permit(:title, :pages))
			redirect_to book_path(@book.id)
 	end
 	def destroy
 		@book = book.find(params[:id])
 		@book.destroy 
 		redirect_to user_path(current_user.id)
 	end
end