class CourseDecorator < Draper::Decorator
  delegate_all

  def scorecard_title
    I18n.t('course.scorecard_title', name: source.name)
  end

  def location
    "#{source.city}, #{source.state}"
  end
end
