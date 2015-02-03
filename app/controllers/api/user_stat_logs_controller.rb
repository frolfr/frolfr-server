class Api::UserStatLogsController < ApplicationController
  respond_to :json

  def show
    user = User.find(params[:id])
    serialized_stats = UserStatLogSerializer.new(user)

    respond_with :api, serialized_stats
  end
end
