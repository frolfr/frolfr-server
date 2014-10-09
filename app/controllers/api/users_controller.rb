class Api::UsersController < ApplicationController
  respond_to :json

  def create
    user = User.new(user_params)

    if user.save
      render json: { token: user.auth_token }, status: :created
    else
      head :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :middle_name, :last_name,
      :email, :password, :password_confirmation)
  end
end
