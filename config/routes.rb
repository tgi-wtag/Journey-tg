Rails.application.routes.draw do
  root 'pages#home'
  get '/log/entries', to: 'log#entries'
end