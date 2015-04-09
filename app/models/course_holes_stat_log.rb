class CourseHolesStatLog
  attr_reader :hole_stat_logs

  def initialize(course: course, user: user)
    @hole_stat_logs = course.holes.map { |hole| HoleStatLog.new(hole: hole, user: user) }
    assign_hole_rankings
  end

  private

  def assign_hole_rankings
    sorted_average_score = hole_stat_logs.map(&:average_score).compact.sort.uniq
    hole_stat_logs.each do |log|
      if ranking = sorted_average_score.index(log.average_score)
        log.ranking = ranking + 1
      end
    end
  end
end
