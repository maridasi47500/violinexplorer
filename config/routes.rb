Rails.application.routes.draw do
  resources :mics
  resources :comments
  resources :ytlinks
  resources :mymessages
  resources :votes
  post 'video/save/:id', to: 'video#save'
  post 'audio/save/:id', to: "audio#save"
  resources :myfiles
  resources :playlists
  resources :recordings
  resources :mixers
  resources :pieces
  #devise_for :users
  resources :songs do
    member do
      get "recordings"
      get "addytlink"
      get "vids"
    end
  end
  post "/myurl/:id", to: "songs#myurl"
  root to: "songs#index"
  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
