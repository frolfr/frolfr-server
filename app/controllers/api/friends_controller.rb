class Api::FriendsController < ApplicationController
  respond_to :json

  def index
    respond_with current_user.friends
  end

  def create
    new_friend = User.find(friend_params[:id])
    current_user.friends << new_friend
    respond_with new_friend, location: api_friend_url(new_friend), root: "friend"
  end

  private

  def friend_params
    params.require(:friend).permit(:id)
  end
end
