# frozen_string_literal: true

Rails.application.routes.draw do
  resources :posts
  resources :users

  root to: 'posts#index'

  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create', as: 'log_in'

  # get 'sign_up', to: 'users#new'
  # post 'sign_up', to: 'users#create'
end
