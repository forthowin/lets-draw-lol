Rails.application.routes.draw do
  root 'pages#front'
  get '/draw/champions', to: 'draw#champions'
end
