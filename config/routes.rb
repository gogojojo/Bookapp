Rails.application.routes.draw do
  root 'application#home'

  get '/login' => 'sessions#new', as: :login
  post '/login' =>'sessions#create'
  get '/logout' => 'sessions#destroy', as: :logout
  get '/signup' => 'users#new', as: :signup
  get '/done' => 'currents#finished', as: :done 
  
  resources :users
  resources :books
  resources :lists
  resources :currents
end
