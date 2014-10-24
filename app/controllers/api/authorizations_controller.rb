class Api::AuthorizationsController < ApplicationController
  skip_filter :authenticate

  respond_to :json

  def create
    user = User.find_for_authentication(params[:email])
    if user && user.authenticate(params[:password])
      render json: { token: user.auth_token, user_id: user.id }, status: :created
    else
      head :unprocessable_entity
    end
  end
end
