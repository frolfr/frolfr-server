class CourseForm
  include ActiveModel::Model

  validates :hole_count, inclusion: Course::HOLE_COUNTS

  attr_reader :course, :hole_count

  def initialize(params, course_factory: Course)
    @hole_count = params.delete(:hole_count).to_i
    @course = course_factory.new(params)
  end

  def save
    if valid? && course.valid?
      course.save
      course.tap { save_holes }
    else
      false
    end
  end

  private

  def save_holes
    1.upto(hole_count) do |number|
      course.holes.create(number: number)
    end
  end
end
