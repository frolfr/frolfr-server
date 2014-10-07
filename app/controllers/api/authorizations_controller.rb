class Api::AuthorizationsController < ApplicationController
  respond_to :json

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      render json: { token: user.auth_token }, status: :created
    else
      head :unprocessable_entity
    end
  end
end
