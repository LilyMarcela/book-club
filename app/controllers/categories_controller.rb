class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
    @submit = 'New category'
  end

  def edit
    @category = Category.find(params[:id])
  end

  def create
   @category = Category.new(category_params)
   if @category && @category.save
     redirect_to @category, notice: 'Category saved!'
   else
     render 'new'
   end
  end

  def update
    @category = Category.find(params[:id])
        if @category.update(category_params)
        redirect_to @category
      else
        render 'edit'
      end
      @submit = 'Update category'
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
      redirect_to categories_path
  end


  private
  def category_params
    params.require(:category).permit(:name)
  end

end
