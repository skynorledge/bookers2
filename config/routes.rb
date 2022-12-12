Rails.application.routes.draw do

  root to: 'homes#top'
  devise_for :users
  get "homes/about" => "homes#about",as: "about"

  resources :books, only: [:new,:create,:index,:show,:edit,:update]
  resources :users, only: [:show, :edit, :update,:index]
  delete 'books.:id' => 'books#destroy'

end
