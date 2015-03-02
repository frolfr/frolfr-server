class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :set_locale, :authenticate
  helper_method :current_user, :logged_in?

  before_filter :cors_preflight_check
  after_filter :cors_set_access_control_headers

  attr_reader :current_user

  protected

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def logged_in?
    current_user.present?
  end

  def authenticate
    @current_user = authenticate_or_request_with_http_token do |token, options|
      user = User.find_for_authentication(options[:email])
      user if user && Rack::Utils.secure_compare(user.auth_token, token)
    end

    head :unauthorized unless @current_user
  end

  def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization, Token'
    headers['Access-Control-Max-Age'] = "1728000"
  end

  def cors_preflight_check
    if request.method == 'OPTIONS'
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
      headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-Prototype-Version, Token'
      headers['Access-Control-Max-Age'] = '1728000'

      render :text => '', :content_type => 'text/plain'
    end
  end
end
