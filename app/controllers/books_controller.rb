class BooksController < ApplicationController
  before_action :set_admin
  before_action :find_book, only: [:show, :update]
  before_action :destroy_check, only: [:destroy, :edit]
  before_action :authenticate_user!, except: [:index, :show ]

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
    @background_pic = "sunsetpic"
  end

  def edit
    @book = Book.find(params[:id])
  end

  def create

    upload
    @book = Book.new(book_params)
    @book.owner_id = current_user.id
    @book.save
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
      #the commented line search is a sql query, optional when elastic search has not being installed yet
      @books = Book.where("title LIKE ? OR author LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")

      # searchkick parameters, it needs to have the gem installed
      # Additionally, it relies on elastic search which uses java
      # @books = Book.search(params[:search])
    else
      @books = Book.all
    end
  end

  private
  def find_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :author, :url_file, :owner_id)
  end

  def get_pdf_array_from_bucket(name)
    s3 = Aws::S3::Resource.new
    bucket = s3.bucket(name)
    @books = bucket.objects
  end

  def set_admin
    @admin = user_signed_in? && current_user.admin
  end

  def destroy_check
    @book = Book.find(params[:id])
    unless @admin || current_user.id == @book.owner_id
      redirect_to "/"
    end
  end

  def upload
    s3 = Aws::S3::Resource.new
    bucket = s3.bucket("bookwormfiles")
    file = params[:book][:url_file]
    key = current_user.id.to_s + file.original_filename
    obj = bucket.object(key)
    obj.upload_file(file.path)
  end

end
