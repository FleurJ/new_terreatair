class ActivityTypesController < ApplicationController
  before_action :find_activity_type, only: [:update, :edit, :destroy]
  before_action :authorised_user

  def index
    @activity_types = ActivityType.all
  end

  def new
    @activity_type = ActivityType.new
  end

  def create
    @activity_type = ActivityType.new(activity_type_params)
    @activity_type.user = current_user
    @activity_type.save
    redirect_to activity_types_path
  end

  def edit
  end

  def update
    @activity_type.update!(activity_type_params)
    redirect_to activity_types_path
  end

  def destroy
    @activity_type.destroy
    redirect_to activity_types_path
  end

  private

  def find_activity_type
    @activity_type = ActivityType.find(params[:id])
  end

  def activity_type_params
    params.require(:activity_type).permit(:title, :status)
  end

  def authorised_user
    return true if current_user.admin == true
  end
end
