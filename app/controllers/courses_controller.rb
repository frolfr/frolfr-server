class CoursesController < ApplicationController
  def index
    @courses = CourseDecorator.decorate_collection(current_user.courses_played) # by_name
  end

  def show
    @course = Course.find(params[:id]).decorate
    @scorecards = current_user.scorecards_for_course(@course).decorate
  end
end
