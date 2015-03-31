class Api::HoleStatLogsController < ApplicationController
  respond_to :json

  def show
    hole = Hole.find(params[:id])

    respond_with :api, hole, serializer: HoleStatLogSerializer
  end
end
