Frolfr::Application.routes.draw do
  root to: 'dashboard#show'

  namespace :api do
    resources :authorizations
    resources :avatars
    resources :available_courses
    resources :courses
    get 'users/current', to: 'current_users#show'
    resources :friends
    resources :users
    resources :friendable_users
    resources :rounds
    resources :joint_rounds
    resources :scorecards
    resources :turns
    resources :holes
  end

  get '*path', to: 'dashboard#show'
end
