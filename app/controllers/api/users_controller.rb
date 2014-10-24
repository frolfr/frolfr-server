class Api::UsersController < ApplicationController
  respond_to :json

  def show
    user = User.find(params[:id])
    respond_with user
  end
end
