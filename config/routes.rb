Rails.application.routes.draw do
  root 'pages#home'
  resources :journal_entries
  resources :tasks
  resources :goals
  resources :users
end
