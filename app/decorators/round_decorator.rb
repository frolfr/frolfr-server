class RoundDecorator < Draper::Decorator
  delegate_all
  decorates_association :course
  decorates_association :scorecards

  def scorecard_title
    I18n.t('round.scorecard_title', name: course.name)
  end

  def location
    course.location
  end

  def course_name
    course.name
  end

  def display_date
    created_at.strftime("%A, %b %d %Y")
  end

  def short_date
    created_at.strftime("%m/%d/%Y")
  end
end
