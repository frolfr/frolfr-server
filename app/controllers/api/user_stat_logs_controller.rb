class Api::UserStatLogsController < ApplicationController
  respond_to :json

  def show
    user = User.find(params[:id])
    serialized_stats = UserStatLogSerializer.serialize_stats(user, current_user)

    respond_with :api, serialized_stats
  end
end
