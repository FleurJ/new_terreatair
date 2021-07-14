class ProductsController < ApplicationController
  before_action :find_product, only: [:update, :edit, :destroy]
  before_action :authorised_user, only: [:new, :create, :update, :edit, :destroy]
  skip_before_action :authenticate_user!, only: [:show]

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    @product.save
    redirect_to product_path(@product)
  end

  def edit
  end

  def update
    @product.update!(product_params)
    redirect_to product_path(@product)
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

  def index
    @products = Product.all
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :images, :img_thumbnail, :description, :product_type)
  end

  def authorised_user
    return true if current_user.admin == true
  end

  def find_product
    @product = Product.find(params[:id])
  end
end
