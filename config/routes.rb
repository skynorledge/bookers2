Rails.application.routes.draw do

  root to: 'homes#top'
  devise_for :users
  get "homes/about"

  resources :books, only: [:new, :create, :index, :show, :destroy]
  resources :users, only: [:show, :edit, :update]

end
