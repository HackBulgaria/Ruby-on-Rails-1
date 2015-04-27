class BrandsController < ApplicationController
  def index
    @brands = Brand.all
  end

  def new
    @brand = Brand.new
  end

  def edit
    @brand = Brand.find_by(params[:id])
  end

  def show
    if params[:id]
      @brand = Brand.find_by(params[:id])
    else
      'nonexistent'
    end
  end

  def create
    @brand = Brand.new(brand_params)

    if @brand.save
      redirect_to @brand
    else
      render 'new'
    end
  end

  private

  def brand_params
    params.require(:brand).permit(:name, :description)
  end
end
