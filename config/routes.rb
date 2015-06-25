Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  root 'pages#front'
  get '/draw/champions', to: 'drawings#draw_champion'
  post '/start-draw', to: 'drawings#start_draw'
  get '/draw/pros', to: 'drawings#draw_pros'
  get '/guess/champions', to: 'drawings#guess_champion'
  get '/guess/pros', to: 'drawings#guess_pros'
  post '/start-guess', to: 'drawings#start_guess'
  post '/guess-share-buttons', to: 'drawings#guess_share_buttons'
  get '/users/:id', to: 'users/users#show', as: 'show_user'
  resources :drawings, only: [:create, :index, :show]
end
