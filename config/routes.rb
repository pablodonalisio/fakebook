Rails.application.routes.draw do
  get 'likes/create'
  root 'posts#index'

  devise_for :users
  resources :posts
  resources :friend_requests, only: %i[index update create]
  resources :profile, only: %i[show edit update]
  resources :likes, only: %i[create]
end
