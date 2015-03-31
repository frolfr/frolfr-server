Frolfr::Application.routes.draw do
  namespace :api do
    with_options defaults: { format: :json } do |json|
      json.resources :authorizations
      json.resources :avatars
      json.resources :available_courses
      json.resources :courses
      json.get 'users/current', to: 'current_users#show'
      json.get 'rounds/current', to: 'current_rounds#show'
      json.resources :friends
      json.resources :user_stat_logs
      json.resources :course_stat_logs
      json.resources :hole_stat_logs
      json.resources :leaderboard_scorecards
      json.resources :course_scorecards
      json.resources :users
      json.resources :friendable_users
      json.resources :rounds
      json.resources :public_rounds
      json.resources :joint_rounds
      json.resources :scorecards
      json.resources :turns
      json.resources :holes
      json.resources :password_resets
      json.resources :passwords
      json.resources :reviews
    end
  end

  match '/', via: [:options],
    to:  "application#cors_preflight_check"
  match '*unmatched', via: [:options],
    to:  "application#cors_preflight_check"

end
