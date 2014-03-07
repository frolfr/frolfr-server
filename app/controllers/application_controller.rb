class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale, :prepare_for_mobile
  helper_method :mobile_device?, :current_user
 
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def current_user
    @current_user ||= User.find_by(name: "Geoff")
  end

  private

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
