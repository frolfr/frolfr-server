class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :set_locale, :authenticate
  helper_method :current_user, :logged_in?

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
end
