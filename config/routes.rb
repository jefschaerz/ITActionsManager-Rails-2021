Rails.application.routes.draw do

  resources :interventions
  resources :equipement_types
  root 'users#index'
  
  post "/signin", to: "sessions#create", as: "signin"

  get '/profil', to: 'users#edit', as: :profil
  patch '/profil', to: 'users#update'
  
  #Sessions manually defined
  get '/login', to: 'sessions#new', as: :new_session
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: :destroy_session

  resources :users, only: [:show, :new, :create, :edit, :index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
