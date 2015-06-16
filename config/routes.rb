Rails.application.routes.draw do
  root 'pages#front'
  get '/draw/champions', to: 'drawings#draw_champion'
  post '/start-draw', to: 'drawings#start_draw'
  get '/draw/pros', to: 'drawings#draw_pros'
  get '/guess/champions', to: 'drawings#guess_champion'
  get '/guess/pros', to: 'drawings#guess_pros'
  post '/start-guess', to: 'drawings#start_guess'
  post '/handle-guess', to: 'drawings#handle_guess'
  resources :drawings, only: [:create, :index]
end
