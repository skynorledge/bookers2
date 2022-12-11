Rails.application.routes.draw do

  root to: 'homes#top'
  devise_for :users
  get "homes/about" => "homes#about" , as: :about

  resources :books, only: [:new, :create, :index, :show, :edit, :destroy]
  resources :users, only: [:show, :edit, :update]

end
