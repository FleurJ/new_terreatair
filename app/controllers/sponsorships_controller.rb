class SponsorshipsController < ApplicationController
  before_action :find_sponsorship, only: [:update, :edit, :destroy]
  before_action :authorised_user, only: [:update, :edit, :destroy]
  before_action :authorised_admin, only: [:index]

  def index
    @sponsorships = Sponsorship.all
  end

  def new
    @sponsorship = Sponsorship.new
  end

  def create
    @sponsorship = Sponsorship.new(sponsorship_params)
    @sponsorship.user = current_user
    define_sponsor_type
    @sponsorship.save
    redirect
  end

  def update
    @sponsorship.update!(sponsorship_params)
    redirect
  end

  def edit
  end

  def destroy
    @sponsorship.destroy
    redirect
  end

  private

  def sponsorship_params
    params.require(:sponsorship).permit(:amount, :recurring, :frequency, :sponsor_type, :sponsorship_type)
  end

  def find_sponsorship
    @sponsorship = Sponsorship.find(params[:id])
  end

  def authorised_user
    return true if user_signed_in?
  end

  def authorised_admin
    return true if current_user.admin == true
  end

  def redirect
    if current_user.admin == true
      redirect_to sponsorships_path
    else
      redirect_to user_path(@user)
    end
  end

  def define_sponsor_type
    if @sponsorship.sponsorship_type == 'propolis' || 'nectar'
      @sponsorship.sponsor_type == 'entreprise'
    else
      @sponsorship.sponsor_type == 'particulier'
    end
  end
end
