Rails.application.routes.draw do
  get '/pages/home', to: 'pages#home'
  get '/log/entries', to: 'log#entries'
end

