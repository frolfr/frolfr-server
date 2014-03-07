Frolfr::Application.routes.draw do
  root to: 'home#show'

  resources :home, only: [:show]
  resources :rounds, only: [:show] do
    resources :scorecard_holes, only: [:show, :update]
  end
end
