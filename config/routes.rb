Rails.application.routes.draw do
  resources :users do
    resources :profile
  end
  resources :authors
  resources :books
end
