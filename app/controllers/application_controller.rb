class ApplicationController < ActionController::Base
  include Pundit::Authorization
  protect_from_forgery with: :null_session
  before_action :authenticate
  helper_method :current_user, :logged_in?

  after_action :cors_set_access_control_headers

  attr_reader :current_user

  skip_before_action :authenticate, only: :cors_preflight_check
  def cors_preflight_check
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-Prototype-Version, Token, Content-Type'
    headers['Access-Control-Max-Age'] = '1728000'

    render text: '', content_type: 'text/plain'
  end

  protected

  def logged_in?
    current_user.present?
  end

  def authenticate
    @current_user = authenticate_with_http_token do |token, options|
      user = User.find_for_authentication(options[:email])
      user if user && Rack::Utils.secure_compare(user.auth_token, token)
    end

    return if @current_user

    cors_set_access_control_headers
    head :unauthorized
  end

  def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization, Token'
    headers['Access-Control-Max-Age'] = '1728000'
  end
end
