class CourseStatLogSerializer < ActiveModel::Serializer
  attributes :id, :total_scorecards_played, :completed_scorecards_played,
    :average_score_on_completed_scorecards, :best_score_on_completed_scorecards,
    :total_birdies, :total_pars, :total_bogies

  def id
    object.id
  end

  delegate :total_scorecards_played, :completed_scorecards_played,
    :average_score_on_completed_scorecards, :best_score_on_completed_scorecards,
    :total_birdies, :total_pars, :total_bogies, to: :stat_log

  private

  def stat_log
    @stat_log ||= CourseStatLog.new(user: scope, course: object)
  end
end
