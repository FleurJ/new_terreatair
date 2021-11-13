class AddressesController < ApplicationController
  before_action :find_address, only: [:update, :edit, :destroy]
  before_action :authorised_user

  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    @address.user = current_user
    @address.save
    redirect_to users_path
  end

  def update
    @address.update!(address_params)
    # redirect_to user_path(@user)
  end

  def edit
  end

  def destroy
    @address.destroy
    # redirect_to user_path(@user)
  end

  private

  def address_params
    params.require(:address).permit(:address_type, :address1, :address2, :last_name,
                                    :first_name, :zipcode, :country, :phone, :company, :city)
  end

  def find_address
    @address = Address.find(params[:id])
  end

  def authorised_user
    return true if user_signed_in?
  end
end
