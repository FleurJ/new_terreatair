class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @activities = Activity.where(status: 'published')
    @intro = Content.where(title: 'Qui sommes-nous ?')
    @intro_activity = Content.where(title: 'Nos animations')
  end
end
