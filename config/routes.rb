Rails.application.routes.draw do
  root 'posts#index'

  devise_for :users
  resources :users, only: [:show]
  resources :posts
  resources :friend_requests, only: [:index, :update]
  resources :profile, only: [:show]
end
