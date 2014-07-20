class CourseDecorator < Draper::Decorator
  delegate_all

  def location
    "#{city}, #{state}"
  end

  def rounds_played
    user_scorecards.count
  end

  private

  def user_scorecards
    h.current_user.scorecards_for_course(object)
  end
end
