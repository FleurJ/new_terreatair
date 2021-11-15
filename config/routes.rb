Rails.application.routes.draw do
  get 'order/new'
  get 'order/create'
  get 'order/show'
  get 'order/edit'
  get 'order/update'
  get 'order/index'
  get 'order/destroy'
  get 'bookings/new'
  get 'bookings/create'
  get 'bookings/show'
  get 'bookings/edit'
  get 'bookings/update'
  get 'bookings/destroy'
  get 'bookings/index'

  devise_for :users

  scope '(:locale)', locale: /fr|nl|en/ do
    root to: 'pages#home'
    resources :tags
    resources :contents
    resources :activities
    resources :schedules
    resources :users
    resources :memberships
    resources :products
    resources :stocks
    resources :activitytypes
    resources :addresses
    resources :sponsorships
    get 'activities/destroy_img_thumbnail'
    get '/animations', to: 'activities#school_table'

  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
