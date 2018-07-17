class BooksController < ApplicationController

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.create!(book_params)
    redirect_to "/books/#{@book.id}"
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to "/books"
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to "/books"

  end

    def search
    if params[:search]
      #the commented line search is a sql query, optional when elastic search has not being installed yet  
      #@books = Book.where("title LIKE ? OR author LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")

      # searchkick parameters, it needs to have the gem installed
      # Additionally, it relies on elastic search which uses java  
      @books = Book.search(params[:search])
    else
      @books = Book.all
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :author, :url_file)
  end


end
