class Leaderboard
  attr_reader :course

  def initialize(course)
    @course = course
  end

  def scorecards
    complete_course_scorecards.sort_by(&:total_shooting)
  end

  private

  def complete_course_scorecards
    course.scorecards.select(&:completed?)
  end
end

