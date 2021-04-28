Rails.application.routes.draw do
  root 'posts#index'

  devise_for :users
  resources :posts do
    resources :likes, only: %i[index create destroy]
  end
  resources :friend_requests, only: %i[index update create]
  resources :profile, only: %i[show edit update]
  resources :comments, only: %i[create] do 
    resources :likes, only: %i[index create destroy]
  end 
end
