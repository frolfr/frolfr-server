class CoursesController < ApplicationController
  def index
    @courses = current_user.courses_played.decorate
  end

  def show
    @course = Course.find(params[:id]).decorate
    @scorecards = current_user.scorecards_for_course(@course).decorate
  end
end
