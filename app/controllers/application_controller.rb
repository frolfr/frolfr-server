class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale, :prepare_for_mobile, :require_login
  helper_method :mobile_device?, :current_user, :logged_in?, :differentiate_path

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    current_user.present?
  end

  def differentiate_path(path, *args)
    attempt = request.parameters["attempt"].to_i + 1
    args.unshift(path).push(:attempt => attempt)
    send(*args)
  end

  private

  def require_login
    redirect_to login_path unless logged_in?
  end

  def sign_in(user)
    session[:user_id] = user.id
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
