Rails.application.routes.draw do

  devise_for :users
  root to: 'homes#top'

  resources :books

  get 'about' => 'abouts#top'

  resources :users, only: [:show]
end
