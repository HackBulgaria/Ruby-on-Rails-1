class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find_by(params[:id])
  end

  def show
    if params[:id]
      @product = Product.find_by(params[:id])
    else
      'nonexistent'
    end
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to @product
    else
      render 'new'
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :brand, :category, :price, :quantity)
  end
end
