Frolfr::Application.routes.draw do
  root to: 'home#show'

  resources :home, only: [:show]
  resources :rounds, only: [:new, :create]
  resources :scorecard_holes, only: [:show, :update]
end
