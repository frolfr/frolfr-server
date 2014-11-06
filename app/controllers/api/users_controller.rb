class Api::UsersController < ApplicationController
  respond_to :json
  skip_before_action :authenticate, only: [:create]

  def create
    user = User.new(create_user_params)

    if user.save
      respond_with :api, user
    else
      head :unprocessable_entity
    end
  end

  private

  def create_user_params
    params.require(:user).permit(:first_name, :middle_name, :last_name,
      :email, :password, :password_confirmation)
  end
end
