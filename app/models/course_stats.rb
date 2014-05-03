class CourseStats
  attr_reader :course, :user, :holes_stats

  def initialize(course: course, user: user, hole_stats_factory: HoleStats)
    @course = course
    @user = user
    @holes_stats = holes.map { |hole| hole_stats_factory.new(hole: hole, user: user) }
  end

  def color_class(hole_stats)
    case hole_stats.average_shooting
    when easiest_hole
      "best-hole"
    when hardest_hole
      "worst-hole"
    end
  end

  def easiest_hole
    holes_by_difficulty.first.average_shooting
  end

  def hardest_hole
    holes_by_difficulty.last.average_shooting
  end
  private

  def holes_by_difficulty
    holes_stats.sort_by(&:average_shooting)
  end

  def holes
    course.holes
  end
end
