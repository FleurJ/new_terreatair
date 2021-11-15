class ActivitiesController < ApplicationController
  before_action :find_activity, only: [:update, :edit, :destroy, :destroy_img]
  before_action :authorised_user, only: [:new, :create, :update, :edit, :destroy]
  before_action :find_tags, only: [:new, :edit]
  before_action :find_activitytypes, only: [:new, :edit]
  skip_before_action :authenticate_user!, only: [:show]

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
    redirect_to activities_path
  end

  def index
    @activities = Activity.all
  end

  def school_table
    @activities = Activity.where(status: 'published')
    @animations = []
    @activities.each do |a|
      @animations << a if a.activitytype_ids || 1
    end
  end

  def destroy_img_header
    @activity.img_header.purge
    @activity.save
    redirect_to activity_edit_path(@activity)
  end

  def destroy_img_thumbnail
    @img = @activity.img_thumbnail.first
    @img.purge
    @activity.save
    redirect_to activity_edit_path(@activity)
  end

  private

  def activity_params
    params.require(:activity).permit(:title, :status, :teaser, :body,
                   :booking_conditions, :min_age, :max_age, :min_classes,
                   :max_classes, :debate, :duration, :links, :price, :language,
                   :teaser, :img_thumbnail, :img_header, tag_ids: [],
                   activitytype_ids: [])
  end

  def authorised_user
    return true if current_user.admin == true
    #return true if current_user.role == 'editor'
  end

  def find_activity
    @activity = Activity.find(params[:id])
  end

  def find_tags
    @tags = Tag.all
  end

  def find_activitytypes
    @activitytypes = Activitytype.all
  end
end
