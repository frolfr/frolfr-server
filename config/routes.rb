Frolfr::Application.routes.draw do
  root to: 'home#show'
  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'

  resources :courses, only: [:index, :show]
  resources :home, only: [:show]
  resources :rounds, only: [:new, :create, :show]
  resources :sessions, only: [:create]
  resources :turns, only: [:show, :update]
end
