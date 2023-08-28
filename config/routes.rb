Rails.application.routes.draw do
  root to: 'pages#home'
  get '/pages/home', to: 'pages#home'
  get '/log/entries', to: 'log#entries'
  get 'tasks', to: 'pages#tasks', as: 'tasks'
  get 'goals', to: 'pages#goals', as: 'goals'
  get 'profile', to: 'pages#profile', as: 'profile'
end

