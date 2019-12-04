Rails.application.routes.draw do
  resources :posts do 
    resources :comments
  end
  resources :users do 
    resources :comments
  end
  resources :users do 
    resources :posts
  end
  # resources :users
  root "sessions#welcome", as: "welcome"
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  post "logout", to: "sessions#destroy" # is this suppose to be delete instead of get?
  get "welcome", to: "sessions#welcome"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
