Frolfr::Application.routes.draw do
  root to: 'dashboard#show'

  namespace :api do
    resources :authorizations
    resources :courses
  end

  get '*path', to: 'dashboard#show'
end
