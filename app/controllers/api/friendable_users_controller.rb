class Api::FriendableUsersController < ApplicationController
  respond_to :json

  def index
    respond_with current_user.friendable_users
  end
end
