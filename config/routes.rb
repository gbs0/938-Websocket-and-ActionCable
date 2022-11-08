require 'sidekiq/web'

Rails.application.routes.draw do
  resources :posts
  get '/privacy', to: 'home#privacy'
  get '/terms', to: 'home#terms'

  resources :chatrooms, only: [:show, :index] do
    resources :messages, only: :create
  end
  
  resources :notifications, only: [:index]
  resources :announcements, only: [:index]
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  root to: 'posts#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
