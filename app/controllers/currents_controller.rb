class CurrentsController < ApplicationController
		before_action :authorize
	def new 
		@current = Current.new
	end
	def create
		@current = Current.new(params.require(:current).permit(:title, :author, :pages, :pages_read))
		current_user.current = @current
		if current_user.current.save
			current_user.current = @current
			flash[:success] = 'Added a currently reading book'
			redirect_to user_path(current_user)
		else
			flash.now[:error] = @current.errors.full_messages.to_sentence
			render :new
		end
	end
 	def edit
 		@current =  current_user.current
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