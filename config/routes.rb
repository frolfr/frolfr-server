Frolfr::Application.routes.draw do
  root to: 'dashboard#show'

  namespace :api do
    resources :authorizations
    resources :courses
    resource :current_user, only: [:show]
  end

  get '*path', to: 'dashboard#show'
end
