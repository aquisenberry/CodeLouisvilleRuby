Rails.application.routes.draw do
  
  get 'pages/home'

  resources :users
  resources :user_sessions, only: [:new, :create, :destroy]
  resources :writer_resources, only: [:new, :create, :show, :edit, :index, :destroy, :update]
  root 'pages#home'
  end
