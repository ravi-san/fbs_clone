Rails.application.routes.draw do
  # get 'facebook_users/new'
  # get 'facebook_users/create'
  # get 'facebook_users/show'
  # get 'home/index'
  resources :facebook_user
  resources :fb_post
  resources :likes, only: [:create, :destroy, :show]
  resources :friendships, only: [:create, :update, :new, :index]
  resources :comments, only: [:create,:new, :show]
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end

 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
end
