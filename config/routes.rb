Rails.application.routes.draw do
  get 'votes/create'
  devise_for :users, controllers: { invitations: 'users/invitations' }
  root to: 'pages#home'
  get 'dashboard', to: 'pages#dashboard'
  get 'profile', to: 'pages#profile'
  patch 'profile', to: 'pages#update'

  resources :projects do
    get :pay, on: :member
    resources :messages, only: :create
    resources :ideas
    resources :user_projects
  end
  resources :ideas, only: [] do
    resources :votes, only: :create
  end
end
