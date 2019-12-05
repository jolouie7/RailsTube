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

  get 'users/:id/user_posts', to: 'users#user_posts', as: "custom_user_posts"
  # resources :users
  root "sessions#welcome", as: "welcome"
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy" # is this suppose to be delete instead of get?
  get "welcome", to: "sessions#welcome"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
