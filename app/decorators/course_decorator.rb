class CourseDecorator < Draper::Decorator
  delegate_all

  def location
    "#{source.city}, #{source.state}"
  end
end
