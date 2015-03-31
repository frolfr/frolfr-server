class Api::HoleStatLogsController < ApplicationController
  respond_to :json

  def index
    course = Course.find(params[:course_id])

    respond_with :api, course.holes, each_serializer: HoleStatLogSerializer
  end

  def show
    hole = Hole.find(params[:id])

    respond_with :api, hole, serializer: HoleStatLogSerializer
  end
end
