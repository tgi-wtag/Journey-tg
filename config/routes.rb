Rails.application.routes.draw do
  root to: 'pages#home'
  get 'entries', to: 'pages#entries', as: 'entries'
  get 'tasks', to: 'pages#tasks', as: 'tasks'
  get 'goals', to: 'pages#goals', as: 'goals'
  get 'profile', to: 'pages#profile', as: 'profile'

  get 'create_entry', to: 'pages#new_entry', as: 'new_entry'
  post 'create_entry', to: 'pages#create_entry', as: 'create_entry'
end