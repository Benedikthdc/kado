Rails.application.routes.draw do
  devise_for :users, controllers: { invitations: 'users/invitations' }
  root to: 'pages#home'
  get 'dashboard', to: 'pages#dashboard'

  resources :projects do
    resources :ideas
    resources :user_projects
  end
end
