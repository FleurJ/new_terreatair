Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :tags
  resources :contents
  resources :activities
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
