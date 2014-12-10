MushroomApp::Application.routes.draw do
  root 'static#home'

  resources :consumers
  resources :user_sessions

  get '/login' => 'static#login', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout

  get '/signup' => 'static#reg', :as => :signup

  match 'signout', to: 'fb_sessions#destroy', as: 'signout', via: [:get, :post]

  match "user_sessions/upload", :as => "upload", via: [:get, :post]
  match "user_sessions/delete", :as => "delete", via: [:get, :post]
end
