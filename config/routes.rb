Frolfr::Application.routes.draw do
  root to: 'rounds#index'
  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'
  get '/profile', to: 'users#edit'

  resources :courses, only: [:index, :show]
  resources :rounds, only: [:index, :new, :create, :show]
  resources :sessions, only: [:create]
  resources :turns, only: [:show, :update]
  resources :users, only: [:update]
end
