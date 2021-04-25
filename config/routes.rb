Rails.application.routes.draw do
  root 'posts#index'

  devise_for :users
  resources :posts
  resources :friend_requests, only: %i[index update]
  resources :profile, only: %i[show edit]
end
