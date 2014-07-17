Frolfr::Application.routes.draw do
  root to: 'dashboard#show'
  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'
  get '/profile', to: 'users#edit'
  get '/sign_up', to: 'users#new'
  get '/friends', to: 'friendships#index'

  resources :courses, only: [:index, :show, :new, :create]
  resources :course_stats, only: [:show]
  resources :friendships, only: [:create, :destroy]
  resources :rounds, only: [:index, :new, :create, :show]
  resources :sessions, only: [:create]
  resources :turns, only: [:show, :update]
  resources :users, only: [:update, :create, :show]
end
