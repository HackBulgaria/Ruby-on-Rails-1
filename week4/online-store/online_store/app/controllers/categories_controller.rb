class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def update
    @category = Category.find_by(params[:id])
    if @category.update_attributes(category_params)
      flash[:success] = 'Category updated'
      redirect_to @category
    else
      render 'edit'
    end
  end

  def show
    if params[:id]
      @category = Category.find_by(params[:id])
    else
      'nonexistent'
    end
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to @category
    else
      render 'new'
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
