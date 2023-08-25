Rails.application.routes.draw do
  get '/app/pages/home', to: 'pages#home'
  get '/log/entries', to: 'log#entries'
end