class RoundDecorator < Draper::Decorator
  delegate_all
  decorates_association :course

  def location
    course.location
  end
end
