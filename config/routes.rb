Rails.application.routes.draw do
   
  root 'interventions#index'
  
  post "/signin", to: "sessions#create", as: "signin"

  get '/profil', to: 'users#profil', as: :profil
  patch '/profil', to: 'users#update'
  
  #Sessions manually defined
  get '/login', to: 'sessions#new', as: :new_session
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: :destroy_session
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # DONE : Remove unused routes (Show)..
  resources :users
  resources :intervention_types, :except  => [:show]
  resources :equipment_types, :except  => [:show]
  resources :interventions 
  resources :devices, :except  => [:show]
  resources :intervention_states, :except  => [:show]
  
end
