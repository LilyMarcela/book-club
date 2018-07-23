require 'open-uri'
class BooksController < ApplicationController
  before_action :set_admin
  before_action :find_book, only: [:show, :update, :edit, :destroy]
  before_action :destroy_check, only: [:destroy, :edit]
  before_action :authenticate_user!, except: [:index, :show ]

  def index
    @books = Book.all
    if @books.length > 20
      @books = Book.paginate(:page => params[:page], :per_page => 10)
    end
  end

  def show
    @url = get_pdf_from_bucket(@book.key)
  end

  def new
    @book = Book.new
    @categories = Category.all.map{|c| [ c.name, c.id ] }
    @background_pic = "sunsetpic"
  end

  def edit
    @book = Book.find(params[:id])
    @categories = Category.all.map{|c| [ c.name, c.id ] }
  end

  def create
    @book = Book.new(book_params)
    @book.owner_id = current_user.id
    @book.bookpdf = params[:book][:url_file]
    @book.save!

    redirect_to "/books/#{@book.id}"
    path = @book.bookpdf.current_path
    HardWorker.perform_async(@book.key, path, @book.id)
  end

  def update
    @book.update(book_params)
    redirect_to "/books"
  end

  def destroy
    @book.destroy
  end

  def search
    if params[:search]
      #the commented line search is a sql query, optional when elastic search has not being installed yet
      #@books = Book.where("title LIKE ? OR author LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")

      # searchkick parameters, it needs to have the gem installed
      # Additionally, it relies on elastic search which uses java
      @books = Book.search(params[:search], misspellings: {edit_distance: 3} )
    else
      @books = Book.all
    end
  end

  def download
    book = Book.find(params[:book_id])
    url = get_pdf_from_bucket(book.key)
    data = open(url).read
    send_data data, :disposition => 'attachment', :filename=>"book.pdf"
  end

  private
  def find_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :author, :url_file, :owner_id, :category_id)
  end

  def get_pdf_from_bucket(key)
    s3 = Aws::S3::Resource.new
    bucket = S3.bucket("bookwormfiles")
    obj = bucket.object(key)
    obj.presigned_url(:get)
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

end
