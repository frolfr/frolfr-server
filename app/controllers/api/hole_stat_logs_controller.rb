class Api::HoleStatLogsController < ApplicationController
  respond_to :json

  def index
    course = Course.find(params[:course_id])
    stat_log = CourseHolesStatLog.new(course: course, user: current_user)

    respond_with :api, stat_log.hole_stat_logs, each_serializer: HoleStatLogSerializer
  end
end
