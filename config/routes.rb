Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "symptoms#index" 
  # Defines the route for the symptoms controller
  resources :symptoms
  # Defines the route for the diagnosis controller
  resources :diagnosis
  # Defines the route for the users controller
  resources :users
  # Defines the route for the bodyparts controller
  resources :bodyparts
  # Defines the route for the symptoms controller
  resources :symptoms
  # Defines the route for the diagnosis controller
  resources :diagnosis
  # Defines the route for the users controller
  resources :users
  # Defines the route for the bodyparts controller
  resources :bodyparts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/Diagnosis", to: "diagnosis#new"
end
