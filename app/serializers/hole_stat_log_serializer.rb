class HoleStatLogSerializer < ActiveModel::Serializer
  attributes :id, :best_shooting, :worst_shooting, :number,
    :average_score, :average_par, :average_shooting, :ranking

  delegate :best_shooting, :worst_shooting, :ranking,
    :average_score, :average_par, :average_shooting, to: :stat_log

  private

  def stat_log
    @stat_log ||= HoleStatLog.new(user: scope, hole: object)
  end
end
