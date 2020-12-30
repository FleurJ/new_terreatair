class StocksController < ApplicationController
  before_action :find_stock, only: [:update, :edit, :destroy]
  before_action :authorised_user
  before_action :find_products

  def index
    @stocks = Stock.all
  end

  def new
    @stock = Stock.new
  end

  def create
    @stock = Stock.new(stock_params)
    @stock.user = current_user
    @stock.save
    redirect_to stocks_path
  end

  def edit
  end

  def update
    @stock.update!(stock_params)
    redirect_to stocks_path
  end

  def destroy
    @stock.destroy
    redirect_to stocks_path
  end

  private

  def find_stock
    @stock = Stock.find(params[:id])
  end

  def stock_params
    params.require(:stock).permit(:producer, :comment, :operation, :origin, :production_date, :quantity, :product_id)
  end

  def authorised_user
    return true if current_user.admin == true
  end

  def find_products
    @products = Product.all
  end
end
