Rails.application.routes.draw do
  root 'application#home'
  get '/login' => 'sessions#new', as: :login
  post '/login' =>'sessions#create'
  get '/logout' => 'sessions#destroy', as: :logout
  get '/signup' => 'users#new', as: :signup
  resources :users
  resources :authors
  resources :books
end
