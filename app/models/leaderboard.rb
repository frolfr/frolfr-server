class Leaderboard
  attr_reader :course

  def initialize(course)
    @course = course
  end

  def scorecards
    unique_scorecards.take(10)
  end

  private

  def unique_scorecards
    sorted_scorecards.uniq(&:user_id)
  end

  def sorted_scorecards
    complete_course_scorecards.sort_by(&:strokes)
  end

  def complete_course_scorecards
    course.scorecards.select(&:completed?)
  end
end

