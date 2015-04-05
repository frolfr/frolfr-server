class Api::FriendsController < ApplicationController
  respond_to :json

  def index
    if params[:page].present?
      friends = current_user.friends.order(:first_name, :last_name).page(params[:page])

      respond_with friends, meta: { total_pages: friends.total_pages }
    else
      respond_with current_user.friends
    end

  end

  def create
    new_friend = User.find(friend_params[:id])
    Friendship.create_friendship(user: current_user, friend: new_friend)
    respond_with new_friend, location: api_friend_url(new_friend), root: "friend"
  end

  private

  def friend_params
    params.require(:friend).permit(:id)
  end
end
