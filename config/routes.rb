Rails.application.routes.draw do
  root 'pages#front'
  get '/draw/champions', to: 'drawings#draw_champion'
  post '/draw/champions', to: 'drawings#start_draw'
  get '/draw/pros', to: 'drawings#draw_pros'
  resources :drawings, only: [:create, :index]
end
