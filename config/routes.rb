Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }

  root to: 'homes#top'
  get 'home/about' => 'homes#about'

  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :books do
  resource :favorites, only: [:create, :destroy]
  resources :book_comments, only: [:create, :destroy]
  end

end