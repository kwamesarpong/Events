Rails.application.routes.draw do


  root "mains#index"

  resources :users
  resources :profiles
  resources :services

    
  get 'access/login'

  get 'access/logout'

  post 'users/attempt_login', to: 'users#attempt_login'

  get '/search', to: 'mains#search'

  post '/search', to: 'mains#search'

  get '/auth/:provider/callback', to: 'outsides#create'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
