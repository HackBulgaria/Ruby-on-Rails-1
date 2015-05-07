class BrandsController < ApplicationController
  def index
    @brands = Brand.all
  end

  def new
    @brand = Brand.new
  end

  def update
    @brand = Brand.find_by(params[:id])
    if @brand.update_attributes(brand_params)
      flash[:success] = 'Brand updated'
      redirect_to @brand
    else
      render 'edit'
    end
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
