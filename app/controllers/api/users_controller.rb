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

  def update
    current_user.update(update_user_params)

    respond_with :api, current_user
  end

  private

  def create_user_params
    params.require(:user).permit(:first_name, :middle_name, :last_name,
      :email, :password, :password_confirmation)
  end

  def update_user_params
    params.require(:user).permit(:first_name, :middle_name, :last_name)
  end
end
