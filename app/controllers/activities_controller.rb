class ActivitiesController < ApplicationController
  before_action :find_activity, only: [:update, :edit, :destroy]
  before_action :authorised_user, only: [:new, :create, :update, :edit, :destroy]

  def show
    @activity = Activity.find(params[:id])
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(activity_params)
    @activity.user = current_user
    @activity.save
    redirect_to activity_path(@activity)
  end

  def edit
  end

  def update
    @activity.update!(activity_params)
    redirect_to activity_path(@activity)
  end

  def destroy
    @activity.destroy
    redirect_to root_path
  end

  def index
    @activities = Activity.all
  end

  private

  def activity_params
    params.require(:activity).permit(:title, :status, :teaser, :body, :activity_type, :public, :duration, :links, :price, :language, :teaser, :img_thumbnail, :img_header)
  end

  def authorised_user
    return true if current_user.admin == true
  end

  def find_activity
    @activity = Activity.find(params[:id])
  end
end
