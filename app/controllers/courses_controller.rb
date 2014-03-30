class CoursesController < ApplicationController
  def index
    @courses = Course.all.decorate
  end

  def show
    @course = Course.find(params[:id]).decorate
    @scorecards = current_user.scorecards_for_course(@course).decorate
  end
end
