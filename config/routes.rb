Rails.application.routes.draw do
  namespace :jsonapi do
    jsonapi_resources :courses, only: %i[show index create]
    jsonapi_resources :rounds, only: %i[show index create]
    jsonapi_resources :scorecards, only: %i[show index]
    jsonapi_resources :turns, only: %i[show index update]
    jsonapi_resources :users, only: %i[show index create]
  end

  post 'login', to: 'jsonapi/sessions#create'
  post '/api/authorizations', to: 'jsonapi/sessions#create'

  match '/', via: [:options], to: 'application#cors_preflight_check'
  match '*unmatched', via: [:options], to: 'application#cors_preflight_check'
end
