Rails.application.routes.draw do
  root to: 'pages#home'
  get 'create_entry', to: 'pages#create_entry', as: 'create_entry'
  get 'entries', to: 'pages#entries', as: 'entries'
  get 'tasks', to: 'pages#tasks', as: 'tasks'
  get 'goals', to: 'pages#goals', as: 'goals'
  get 'profile', to: 'pages#profile', as: 'profile'
  post 'create_entry', to: 'pages#create_entry'
end

