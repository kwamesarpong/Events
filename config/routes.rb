Rails.application.routes.draw do
  get 'access/login'

  get 'access/logout'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "mains#index"

  resources :users
  resources :profiles
  resources :services

end
