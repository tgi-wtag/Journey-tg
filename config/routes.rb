Rails.application.routes.draw do
  get 'user_sessions/new'
  get 'user_sessions/create'
  root 'pages#home'
  delete :logout, to: 'user_sessions#destroy'
  post :login, to: 'user_session#create'
  resources :journal_entries
  resources :tasks
  resources :goals
  resources :users
  resources :user_sessions

  resources :users do
    post :logout, on: :collection
    resources :goals
  end

  resources :journal_entries do
    member do
      get 'show_pdf'
    end
  end
end
