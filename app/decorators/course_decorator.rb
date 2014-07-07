class CourseDecorator < Draper::Decorator
  delegate_all

  def location
    "#{city}, #{state}"
  end

  def rounds_played
    scorecards.count
  end

  private

  def scorecards
    h.current_user.scorecards_for_course(object)
  end
end
