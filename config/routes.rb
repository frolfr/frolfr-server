Frolfr::Application.routes.draw do
  root to: 'dashboard#show'
  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'
  get '/profile', to: 'users#edit'
  get '/sign_up', to: 'users#new'
  get '/friends', to: 'friendships#index'

  resources :courses, only: [:index, :show, :new, :create] do
    get 'leaderboard', to: 'leaderboards#show'
  end
  resources :course_stats, only: [:show]
  resources :friendships, only: [:create, :destroy]
  resources :rounds, only: [:index, :new, :create, :show] do
    resources :holes, only: [:show, :update]
  end
  resources :sessions, only: [:create]
  resources :users, only: [:update, :create, :show]
  get '*path', to: 'dashboard#show'
end
