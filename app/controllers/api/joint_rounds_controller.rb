class Api::JointRoundsController < ApplicationController
  respond_to :json

  def index
    user = User.find(params[:user_id])
    respond_with current_user.rounds_with_user(user)
  end
end
