class Leaderboard
  attr_reader :course

  def initialize(course)
    @course = course
  end

  def scorecards
    sorted_scorecards.uniq(&:user_id)
  end

  private

  def sorted_scorecards
    complete_course_scorecards.sort_by(&:total_shooting)
  end

  def complete_course_scorecards
    course.scorecards.select(&:completed?)
  end
end

