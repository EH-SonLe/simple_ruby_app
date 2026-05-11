Rails.application.routes.draw do
  root "pages#home"
  resources :articles

  get "signup", to: "users#new"
  post "signup", to: "users#create"
  resources :users, except: [:new]
end
