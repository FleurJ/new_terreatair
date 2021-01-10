class ActivitytypesController < ApplicationController
  before_action :find_activitytype, only: [:update, :edit, :destroy]
  before_action :authorised_user

  def index
    @activitytypes = Activitytype.all.sort_by(&:title)
  end

  def new
    @activitytype = Activitytype.new
  end

  def create
    @activitytype = Activitytype.new(activitytype_params)
    @activitytype.user = current_user
    @activitytype.save
    redirect_to activitytypes_path
  end

  def edit
  end

  def update
    @activitytype.update!(activitytype_params)
    redirect_to activitytypes_path
  end

  def destroy
    @activitytype.destroy
    redirect_to activitytypes_path
  end

  def school_table
    @animations = []
    activities = @activitytype.activities.sort_by(&:title)
    activities.each do |a|
      @animations << a if a.title == 'Animation scolaire'
    end
  end

  private

  def find_activitytype
    @activitytype = Activitytype.find(params[:id])
  end

  def activitytype_params
    params.require(:activitytype).permit(:title, :status)
  end

  def authorised_user
    return true if current_user.admin == true
  end
end
