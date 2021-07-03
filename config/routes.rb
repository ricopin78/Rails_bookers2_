Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }

  root to: 'homes#top'
  get 'home/about' => 'homes#about'

  resources :books do
  resource :favorites, only: [:create, :destroy]
  resources :book_comments, only: [:create, :destroy]
  end
  resources :users

end