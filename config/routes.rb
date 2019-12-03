Rails.application.routes.draw do
  resources :posts do 
    resources :comments
  end
  resources :users
  root "sessions#welcome", as: "welcome"
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  get "logout", to: "sessions#destroy"
  get "welcome", to: "sessions#welcome"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
