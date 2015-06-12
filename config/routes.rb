Rails.application.routes.draw do
  root 'pages#front'
  get '/draw/champions', to: 'pictures#draw_champion'
  post '/draw/champions', to: 'pictures#start_draw'
end
