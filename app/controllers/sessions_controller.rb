class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
  end

  def create
    @user = User.find_by(email: sign_in_params[:email])

    if @user && @user.authenticate(sign_in_params[:password])
      sign_in(@user, permanent: permanent?)
      # Flash notice
      redirect_to root_url
    else
      # Flash notice
      redirect_to root_url
    end
  end

  def destroy
    cookies.delete(:auth_token)
    redirect_to root_url
  end

  private

  def permanent?
    sign_in_params[:remember_me] == "1"
  end

  def sign_in_params
    params.require(:session).permit(:email, :password, :remember_me)
  end
end
