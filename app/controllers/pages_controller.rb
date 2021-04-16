class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @activities = Activity.where(status: 'published')
    @intro = Content.where(title: 'Qui sommes-nous ?')
    @intro_activity = Content.where(title: 'Nos animations')
    @products = Product.all
    @intro_product = Content.where(title: 'Nos produits')
    @activitytypes = Activitytype.where(title: 'Formation')
    @formations = []
    @activitytypes.each do |a|
      @formations << a.activities
    end

    @intro_formation = Content.where(title: 'Nos formations')
  end
end
