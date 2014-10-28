class Api::FriendsController < ApplicationController
  respond_to :json

  def index
    respond_with current_user.friends
  end
end
