Rails.application.routes.draw do
  root to: 'pages#home'


  resources :journal_entries, only: [:index, :new, :create]

  resources :tasks, only: [:index]

  resources :goals, only: [:index]

  get 'profile', to: 'profile#profile', as: 'profile'
  get 'home', to: 'pages#home', as: 'home'
end
