Rails.application.routes.draw do
  root "pages#home"
  resources :articles

  get "signup", to: "users#new"
  post "signup", to: "users#create"
  resources :users, except: [:new]

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
end
