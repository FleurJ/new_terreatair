Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }


  scope '(:locale)', locale: /fr|nl|en/ do
    root to: 'pages#home'
    resources :tags
    resources :contents
    resources :activities
    resources :schedules
    resources :memberships
    resources :products
    resources :stocks
    resources :activitytypes
    resources :registrations


  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
