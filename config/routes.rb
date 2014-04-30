Frolfr::Application.routes.draw do
  root to: 'rounds#index'
  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'
  get '/profile', to: 'users#edit'
  get '/sign_up', to: 'users#new'
  get '/friends', to: 'friendships#index'

  resources :courses, only: [:index, :show]
  resources :friendships, only: [:create, :destroy]
  resources :rounds, only: [:index, :new, :create, :show]
  resources :sessions, only: [:create]
  resources :turns, only: [:show, :update]
  resources :users, only: [:update, :create]
end
