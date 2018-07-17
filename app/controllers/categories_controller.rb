class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def edit
    @category = Category.find(params[:id])
  end

  def create
    @category = Category.create(category_params)
  end

  def update
    @category = Category.find(params[:id])
    @category.update(category_params)
  end


  def destroy
    @category = Category.find(params[:id])
    @category.destroy
  end

  private
  def book_params
    category.require(:category).permit(:name)
  end

end
