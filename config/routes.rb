Rails.application.routes.draw do
  root to: 'pages#home'
  get 'new_entry', to: 'pages#new_entry', as: 'new_entry'
  post 'create_entry', to: 'pages#create_entry'
  get 'entries', to: 'pages#entries', as: 'entries'
  get 'tasks', to: 'pages#tasks', as: 'tasks'
  get 'goals', to: 'pages#goals', as: 'goals'
  get 'profile', to: 'pages#profile', as: 'profile'
end