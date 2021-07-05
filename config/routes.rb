Rails.application.routes.draw do

  get 'relationships/create'
  get 'relationships/destroy'
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }

  root to: 'homes#top'
  get 'home/about' => 'homes#about'

  resources :users do
    resource :relationships, only: [:create, :destroy]
    member do
      get :following, :followers
    end
  end

  resources :books do
  resource :favorites, only: [:create, :destroy]
  resources :book_comments, only: [:create, :destroy]
  end

end