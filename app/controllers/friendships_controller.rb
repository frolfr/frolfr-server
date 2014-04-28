class FriendshipsController < ApplicationController
  def index
    @friends = current_user.friends.by_name.decorate
    friendable_users = UserDecorator.decorate_collection(current_user.friendable_users - [current_user])
    @friendable_users = friendable_users.map(&:full_name)
  end
end
