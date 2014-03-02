Frolfr::Application.routes.draw do
  root to: 'home#show'

  resources :home, only: [:show]
  resources :scorecard_holes, only: [:update]
  resources :navigation, only: [:show]
end
