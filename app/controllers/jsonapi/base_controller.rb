class Jsonapi::BaseController < ActionController::Base
  before_action :set_current_user
  # TODO: Add before_action :authenticate_request to any places we intend to authenticate

  helper_method :current_user
  attr_reader :current_user

  private

  def set_current_user
    if decoded_auth_token
      @current_user = User.find(decoded_auth_token[:user_id])
    end
  end

  def decoded_auth_token
    if request.headers['Authorization'].present?
      token = request.headers['Authorization'].split(' ').last
      JsonWebToken.decode(token)
    end
  end

  def authenticate_request
    unless @current_user
      render json: { errors: 'Not Authorized' }, status: :unauthorized
    end
  end
end
