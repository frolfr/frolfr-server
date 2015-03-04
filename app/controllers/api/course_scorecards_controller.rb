class Api::CourseScorecardsController < ApplicationController
  respond_to :json

  def index
    course = Course.find(params[:course_id])
    scorecards = current_user.scorecards.for_course(course)
    respond_with :api, scorecards, each_serializer: CourseScorecardSerializer
  end
end
