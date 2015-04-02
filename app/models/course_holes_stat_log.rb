class CourseHolesStatLog
  attr_reader :hole_stat_logs

  def initialize(course: course, user: user)
    @hole_stat_logs = course.holes.map { |hole| HoleStatLog.new(hole: hole, user: user) }
    assign_hole_rankings
  end

  private

  def assign_hole_rankings
    sorted_average_shooting = hole_stat_logs.map(&:average_shooting).compact.sort.uniq
    hole_stat_logs.each do |log|
      if ranking = sorted_average_shooting.index(log.average_shooting)
        log.ranking = ranking + 1
      end
    end
  end
end
