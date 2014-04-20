class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_new_params)

    if @user.save
      sign_in(@user)
      redirect_to root_path, notice: t('misc.welcome', user: @user.first_name)
    else
      render :new, alert: "There were errors with your submission"
    end
  end

  def edit
  end

  def update
    current_user.update(user_params)
    redirect_to profile_path
  end

  private

  def user_edit_params
    params.require(:user)
      .permit(:first_name, :middle_name, :last_name)
  end

  def user_new_params
    params.require(:user)
      .permit(:first_name, :middle_name, :last_name, :email, :password, :password_confirmation)
  end
end
