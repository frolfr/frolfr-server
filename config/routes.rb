Frolfr::Application.routes.draw do
  root to: 'home#show'

  resources :home, only: [:show]
  resources :scorecard_holes, only: [:update]
end
