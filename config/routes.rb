Rails.application.routes.draw do
  get 'user_sessions/new'
  get 'user_sessions/create'
  root 'pages#home'
  resources :journal_entries
  resources :tasks
  resources :user_sessions
  resources :goals

  resources :users do
    post 'logout', on: :collection
  end
end
