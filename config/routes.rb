Frolfr::Application.routes.draw do
  root to: 'dashboard#show'

  namespace :api do
    resources :authorizations
    resources :courses
    get 'users/current', to: 'current_users#show'
    resources :friends
    resources :users
    resources :friendable_users
  end

  get '*path', to: 'dashboard#show'
end
