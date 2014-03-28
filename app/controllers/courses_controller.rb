class CoursesController < ApplicationController
  def index
    @courses = Course.all.decorate
  end

  def show
    @course = Course.find(params[:id]).decorate
    @scorecards = ScorecardDecorator.decorate_collection(current_user.scorecards_for_course(@course))
  end
end
