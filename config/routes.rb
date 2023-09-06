Rails.application.routes.draw do
  root to: 'pages#home'

  resources :pages do
    collection do
      get 'entries'
      get 'tasks'
      get 'goals'
      get 'profile'
      get 'new_entry_form', to: 'pages#new_entry_form'
      post 'create_entry', to: 'pages#create_entry'
    end
  end
end
