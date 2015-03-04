class Leaderboard
  attr_reader :course

  def initialize(course)
    @course = course
  end

  def scorecards
    course.scorecards
  end
end

