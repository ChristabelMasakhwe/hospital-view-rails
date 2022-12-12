Rails.application.routes.draw do
  resources :admissions, only: [:index, :create, :destroy]
  resources :hospitals, only: [:index, :show, :update]
 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  post "/signup", to: "patients#create"
  get "/me", to: "patients#show"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  # Defines the root path route ("/")
  # root "articles#index"
end
