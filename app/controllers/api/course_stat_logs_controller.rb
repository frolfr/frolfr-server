class Api::CourseStatLogsController < ApplicationController
  respond_to :json

  def show
    course = Course.find(params[:id])

    respond_with :api, course, serializer: CourseStatLogSerializer
  end
end
