Rails.application.routes.draw do
  root 'pages#home'
  resources :user_sessions
  delete :logout, to: 'user_sessions#destroy'
  post :login, to: 'user_sessions#create'

  resources :users do
    post :logout, on: :collection
    resources :goals
    resources :tasks
    resources :journal_entries
  end
end
