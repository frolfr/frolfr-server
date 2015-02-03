class Api::UserStatLogsController < ApplicationController
  respond_to :json

  def show
    user = User.find(params[:id])

    respond_with :api, user, serializer: UserStatLogSerializer
  end
end
