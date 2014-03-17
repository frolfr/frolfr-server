class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
  end

  def create
    @user = User.find_by(email: sign_in_params[:email])

    if @user && @user.authenticate(sign_in_params[:password])
      sign_in @user
      # Flash notice
      redirect_to root_url
    else
      # Flash notice
      redirect_to root_url
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_url
  end

  private

  def sign_in_params
    params.require(:session).permit(:email, :password)
  end
end
