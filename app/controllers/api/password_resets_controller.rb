class Api::PasswordResetsController < ApplicationController
  respond_to :json
  skip_before_action :authenticate, only: [:create, :show]

  def show
    user = User.find_by(password_reset_token: params[:id])

    respond_with password_reset: { id: params[:id], email: user.email }
  end

  def create
    email = reset_params[:email].strip.downcase
    user = User.find_by(email: email)

    if user && user.update_password_reset_token!
      respond_with :api, user
    else
      respond_with :not_found
    end
  end

  private

  def reset_params
    params.require(:password_reset).permit(:email)
  end
end
