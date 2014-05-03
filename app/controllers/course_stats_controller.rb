class CourseStatsController < ApplicationController
  def show
    @course = Course.find(params[:id]).decorate
    @course_stats = CourseStats.new(course: @course.object, user: current_user)
    @holes_stats = @course_stats.holes_stats
  end
end
