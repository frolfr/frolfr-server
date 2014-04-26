class FriendshipsController < ApplicationController
  def index
    @friends = current_user.friends.by_name.decorate
  end
end
