Rails.application.routes.draw do

  root 'users#index'
  
  post "/signin", to: "sessions#create", as: "signin"
 
  resources :sessions, only: [:new, :create, :destroy]

  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
