Rails.application.routes.draw do


  root "mains#index"

  resources :users
  resources :profiles
  resources :services
  resources :categories
  resources :messages

    
  get 'access/login'

  get 'access/logout'


  post 'users/attempt_login', to: 'users#attempt_login'

  get  'user/sign_out', to: 'users#sign_out'

  post 'messages/send', to: 'messages#send'

  get '/search', to: 'mains#search'

  post '/search', to: 'mains#search'

  post '/async_search', to: 'mains#async_search'

  get 'outsides/finish_sign_up', to: 'outsides#finish_sign_up'

  get '/auth/:provider/callback', to: 'outsides#create'

  mount RailsAdmin::Engine => '/adonai', as: 'rails_admin'

  match ':controller(/:action(/:id))', via: ["get", "post", "patch"]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
