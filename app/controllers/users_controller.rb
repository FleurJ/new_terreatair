class UsersController < ApplicationController
  before_action :authorised_user
  before_action :find_user, only: [:update, :edit, :destroy]

  def index
    @users = User.all
  end

  def new
    @User = User.new
  end

  def create
    @user = User.new(content_params)
    @user.save
    redirect_to user_path(@user)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
    @user.update!(user_params)
    redirect_to user_path(@user)
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  private

  def authorised_user
    return true if current_user.admin == true
  end

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:firstname, :lastname, :email, :editor, :animator, :avatar, :description)
  end
end
