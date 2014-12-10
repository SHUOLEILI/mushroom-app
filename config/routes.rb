MushroomApp::Application.routes.draw do
  root 'static#home'

  resources :consumers
  resources :user_sessions
  resources :admin
  resources :admin_sessions

  get '/login' => 'static#login', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout

  get '/signup' => 'static#reg', :as => :signup

  match 'user_sessions/upload', :as => 'upload', via: [:get, :post]
  match 'user_sessions/delete', :as => 'delete', via: [:get, :post]
  match 'user_sessions/editProfile', :as => 'editProfile', via: [:get, :post]


  get '/adminlogin' => 'admin_static#login', :as => :adminlogin
  get '/adminsignup' => 'admin_static#reg', :as => :adminsignup
  match 'admin_sessions/delete', :as => 'deleteConsumer', via: [:get, :post]

end
