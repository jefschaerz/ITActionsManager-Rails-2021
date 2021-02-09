Rails.application.routes.draw do

  root 'users#index'
  
  post "/signin", to: "sessions#create", as: "signin"
  
  #Sessions manually defined
  get '/login', to: 'sessions#new', as: :new_session
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: :destroy_session

  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
