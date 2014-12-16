class Api::CoursesController < ApplicationController
  respond_to :json

  def create
    course = Course.create(course_params)
    respond_with :api, course
  end

  def index
    respond_with current_user.courses_played
  end

  def show
    course = Course.find(params[:id])
    respond_with course
  end

  private

  def course_params
    params
      .require(:course)
      .permit(:name, :city, :state)
      .merge({
        status: Course::PENDING_STATUS,
        submitter: current_user,
        country: 'United States'
      })
  end
end
