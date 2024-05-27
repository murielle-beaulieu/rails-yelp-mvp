Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  # A visitor can see the list of all restaurants
  # get "restaurants", to: "restaurants#index"

  # # A visitor can add a new restaurant, and be redirected to the show view of that new restaurant.
  # get "restaurants/new", to: "restaurants#new", as: :new
  # post "restaurants", to: "restaurants#create"

  # get "restaurants/:id", to: "restaurants#show", as: :restaurant

  # get "restaurants/:id/edit", to: "restaurants#edit", as: :edit
  # patch "restaurants/:id", to: "restaurants#update"


  resources :restaurants do
    resources :reviews, only: [:new, :create]
  end

end
