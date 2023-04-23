class Jsonapi::BaseController < ActionController::Base
  before_action :set_current_user
  # TODO: Add before_action :authenticate_request to any places we intend to authenticate

  helper_method :current_user
  attr_reader :current_user

  def authenticate_request
    return if @current_user

    render json: { errors: 'Not Authorized' }, status: :unauthorized
  end

  def set_current_user
    return unless decoded_auth_token

    @current_user = User.find(decoded_auth_token[:user_id])
  end

  def decoded_auth_token
    return unless request.headers['Authorization'].present?

    token = request.headers['Authorization'].split(' ').last
    JsonWebToken.decode(token)
  end
end
