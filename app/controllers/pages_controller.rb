class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @activities = Activity.where(status: 'published')
  end
end
