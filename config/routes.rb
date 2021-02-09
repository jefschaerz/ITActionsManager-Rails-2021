Rails.application.routes.draw do
    
  root 'users#index'
  
  post "/signin", to: "sessions#create", as: "signin"

  get '/profil', to: 'users#edit', as: :profil
  #Not necessary or working to patch '/profil', to: 'users#update'
  
  #Sessions manually defined
  get '/login', to: 'sessions#new', as: :new_session
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: :destroy_session
  
  patch '/resource/:id', to: 'resource#update'

  #resources :users, only: [:show, :new, :create, :edit, :index, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resources :intervention_types
  resources :equipment_types
  resources :interventions 
  resources :resources
  resources :interventions
  
end
