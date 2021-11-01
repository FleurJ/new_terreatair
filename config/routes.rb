Rails.application.routes.draw do
  get 'order/new'
  get 'order/create'
  get 'order/show'
  get 'order/edit'
  get 'order/update'
  get 'order/index'
  get 'order/destroy'
  get 'addresses/new'
  get 'addresses/create'
  get 'addresses/update'
  get 'addresses/edit'
  get 'addresses/destroy'
  get 'bookings/new'
  get 'bookings/create'
  get 'bookings/show'
  get 'bookings/edit'
  get 'bookings/update'
  get 'bookings/destroy'
  get 'bookings/index'
  get 'sponsorships/index'
  get 'sponsorships/new'
  get 'sponsorships/create'
  get 'sponsorships/edit'
  get 'sponsorships/update'
  get 'sponsorships/destroy'
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
    get '/animations', to: 'activities#school_table'

  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
