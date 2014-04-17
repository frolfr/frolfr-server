class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale, :require_login
  helper_method :current_user, :logged_in?

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def current_user
    @current_user ||= User.find_by(auth_token: cookies[:auth_token])
  end

  def logged_in?
    current_user.present?
  end

  private

  def require_login
    redirect_to login_path unless logged_in?
  end

  def sign_in(user)
    cookies.permanent[:auth_token] = user.auth_token
  end

  def mobile_device?
    if session[:mobile_param]
      session[:mobile_param].to_s == "1"
    else
      request.user_agent =~ /Mobile|webOS/
    end
  end

  def prepare_for_mobile
    session[:mobile_param] = params[:mobile] if params[:mobile]
    request.format = :mobile if mobile_device?
  end
end
