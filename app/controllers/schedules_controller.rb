class SchedulesController < ApplicationController
  before_action :find_schedule, only: [:update, :edit, :destroy]
  before_action :authorised_user, only: [:new, :create, :update, :edit, :destroy]
  before_action :find_activities, only: [:new, :edit]

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(schedule_params)
    @schedule.user = current_user
    @schedule.save
    redirect_to schedules_path
  end

  def edit
  end

  def update
    @schedule.update!(schedule_params)
    redirect_to schedules_path
  end

  def destroy
    @schedule.destroy
    redirect_to schedules_path
  end

  def index
    @schedules = Schedule.all
  end

  private

  def schedule_params
    params.require(:schedule).permit(:status, :schedule_date, :classes_qty, :activity)
  end

  def authorised_user
    return true if current_user.admin == true
  end

  def find_schedule
    @schedule = Schedule.find(params[:id])
  end

  def find_activities
    @activities = Activity.all
  end
end
