Rails.application.routes.draw do
  root 'pages#front'
  get '/draw/champions', to: 'pictures#draw_champion'
end
