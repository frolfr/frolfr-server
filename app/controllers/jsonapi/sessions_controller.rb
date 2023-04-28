module Jsonapi
  class SessionsController < Jsonapi::ResourceController
    skip_before_action :set_current_user

    def create
      user = User.find_for_authentication(params[:email])

      if user&.authenticate(params[:password])
        token = JsonWebToken.encode(user_id: user.id)

        render json: { access_token: token }
      else
        render json: { errors: 'Invalid username or password' }, status: :not_found
      end
    end
  end
end
