Frolfr::Application.routes.draw do
  root to: 'home#show'

  resources :home, only: [:show]
  resources :rounds, only: [:new, :create]
  resources :sessions, only: [:create, :destroy]
  resources :turns, only: [:show, :update]
end
