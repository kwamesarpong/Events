Rails.application.routes.draw do
  
  get 'access/login'

  get 'access/logout'

  get '/search', to: 'mains#search'

  post '/search', to: 'mains#search'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "mains#index"

  get '/auth/:provider/callback', to: 'users#create'

  resources :users
  resources :profiles
  resources :services

end
