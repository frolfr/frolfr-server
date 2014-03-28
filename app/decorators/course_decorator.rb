class CourseDecorator < Draper::Decorator
  delegate_all

  def location
    "#{source.city}, #{source.state}"
  end

  def rounds_played
    h.current_user.scorecards_for_course(object).count
  end
end
