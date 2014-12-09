MushroomApp::Application.routes.draw do
  root 'static#home'

  resources :consumers
  resources :user_sessions

  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout

  match 'auth/:provider/callback', to: 'fb_sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'fb_sessions#destroy', as: 'signout', via: [:get, :post]

  match "user_sessions/upload", :as => "upload", via: [:get, :post]
  match "user_sessions/delete", :as => "delete", via: [:get, :post]
end
