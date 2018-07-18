class BooksController < ApplicationController
  before_action :set_admin
  before_action :find_book, only: [:show, :edit, :update]
  before_action :destroy_check, only: [:destroy]
  before_action :authenticate_user!, except: [:index, :show ]

  def index
    @books = Book.all
  end

  def show
  end

  def new
    @book = Book.new
  end

  def edit
  end

  def create
    @book = Book.create(book_params)
    redirect_to "/books/#{@book.id}"
  end

  def update
    @book.update(book_params)
    redirect_to "/books"
  end

  def destroy
    @book.destroy
    redirect_to "/books"

  end

    def search
    if params[:search]
      @books = Book.search(params[:search], operator: "or")
    else
      @books = Book.all
    end
  end

  private
  def find_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :author, :url_file)
  end

  def set_admin
    @admin = user_signed_in? && current_user.admin    
  end

  def destroy_check
    unless @admin || current_user == @book.owner_id
      redirect_to "/" 
    end
  end


end
