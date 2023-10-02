Rails.application.routes.draw do
  get 'user_sessions/new'
  get 'user_sessions/create'
  root 'pages#home'
  resources :journal_entries
  resources :tasks
  resources :goals
  resources :users
  resources :user_sessions
end
