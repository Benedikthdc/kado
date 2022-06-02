Rails.application.routes.draw do
  get 'votes/create'
  devise_for :users, controllers: { invitations: 'users/invitations' }
  root to: 'pages#home'
  get 'dashboard', to: 'pages#dashboard'

  resources :projects do
    resources :ideas
    resources :user_projects
  end
  resources :ideas, only: [] do
    resources :votes, only: :create
  end
end
