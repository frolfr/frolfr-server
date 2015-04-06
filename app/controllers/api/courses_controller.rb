class Api::CoursesController < ApplicationController
  respond_to :json

  def create
    course = CourseForm.new(course_params).save
    respond_with :api, course
  end

  def index
    if params[:page].present?
      courses = Kaminari.paginate_array(current_user.courses_played).page(params[:page]).per(5)

      respond_with courses, meta: { total_pages: courses.total_pages }, each_serializer: CourseSerializer
    else
      respond_with current_user.courses_played, each_serializer: CourseSerializer
    end
  end

  def show
    course = Course.find(params[:id])
    respond_with course
  end

  private

  def course_params
    params
      .require(:course)
      .permit(:name, :city, :state, :hole_count)
      .merge({
        status: Course::PENDING_STATUS,
        submitter: current_user,
        country: 'United States'
      })
  end
end
