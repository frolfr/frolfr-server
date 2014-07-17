class CoursesController < ApplicationController
  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)

    if @course.save
      redirect_to root_path, notice: t('course.success', course: @course.name)
    else
      render :new, notice: t('misc.errors')
    end
  end

  def index
    @courses = current_user.courses_played.decorate
  end

  def show
    @course = Course.find(params[:id]).decorate
    @scorecards = current_user.scorecards_for_course(@course).decorate
  end

  private

  def course_params
    params
      .require(:course)
      .permit(:state, :city, :name)
      .merge(country: 'United States', status: Course::PENDING_STATUS, submitter_id: current_user.id)
  end
end
