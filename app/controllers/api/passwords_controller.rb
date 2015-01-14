class Api::PasswordsController < ApplicationController
  skip_before_action :authenticate
  respond_to :json

  def create
    if password_reset_token.present? && user.present?
      user.update(password_params)
      respond_with :api, user
    else
      respond_with :not_found
    end
  end

  private

  def password_params
    params
      .require(:password)
      .permit(:password, :password_confirmation, :password_reset_token)
  end

  def user
    @user ||= User.find_by(password_reset_token: password_reset_token)
  end

  def password_reset_token
    password_params[:password_reset_token]
  end
end
