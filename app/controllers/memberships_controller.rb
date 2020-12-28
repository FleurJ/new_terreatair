class MembershipsController < ApplicationController
  before_action :find_membership, only: [:update, :edit, :destroy]
  before_action :authorised_user, only: [:new, :create, :update, :edit, :destroy]

  def new
    @membership = Membership.new
  end

  def create
    @membership = Membership.new(membership_params)
    @membership.user = current_user
    @membership.save
    redirect_to memberships_path
  end

  def edit
  end

  def update
    @membership.update!(membership_params)
    redirect_to memberships_path
  end

  def destroy
    @membership.destroy
    redirect_to memberships_path
  end

  def index
    @memberships = Membership.all
  end

  private

  def membership_params
    params.require(:membership).permit(:start_date, :price)
  end

  def authorised_user
    return true if current_user.admin == true
  end

  def find_membership
    @membership = Membership.find(params[:id])
  end
end
