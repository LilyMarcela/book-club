class BooksController < ApplicationController

	def search
		if params[:search]
			@books = Book.search(params[:search], operator: "or")
		else
			@books = Book.all
		end
	end


	private
	def book_params
			params.require(:book).permit(:isbn, :title, :author, :publication_date, :cover_url, :summary, :status, :library_id)
	end
end
