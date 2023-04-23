Rails.application.routes.draw do
  namespace :jsonapi do
    jsonapi_resources :courses, only: [:show, :index, :create]
    jsonapi_resources :rounds, only: [:show, :index, :create]
    jsonapi_resources :scorecards, only: [:show, :index]
    jsonapi_resources :turns, only: [:show, :index, :update]
    jsonapi_resources :users, only: [:show, :index, :create]
  end

  post 'login', to: 'jsonapi/sessions#create'

  match '/', via: [:options],
    to:  "application#cors_preflight_check"
  match '*unmatched', via: [:options],
    to:  "application#cors_preflight_check"

end
