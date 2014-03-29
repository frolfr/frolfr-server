class UsersController < ApplicationController
  def edit
  end

  def update
    current_user.update(user_params)
    redirect_to profile_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :middle_name, :last_name)
  end
end
