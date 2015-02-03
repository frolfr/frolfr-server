class UserStatLogSerializer < ActiveModel::Serializer
  attributes :id, :total_scorecards_played, :completed_scorecards_played, :courses_played,
    :total_rounds_with_user, :total_rounds_won, :total_rounds_lost, :total_rounds_tied,
    :total_incomplete_rounds, :first_name

  def id
    object.id
  end

  def first_name
    object.first_name
  end

  def total_scorecards_played
    object.scorecards.count
  end

  def completed_scorecards_played
    object.completed_scorecards.count
  end

  def courses_played
    object.courses_played.count
  end

  delegate :total_rounds_with_user, :total_rounds_won, :total_rounds_lost,
    :total_incomplete_rounds, :total_rounds_tied, to: :stat_log

  private

  def stat_log
    @stat_log ||= UserStatLog.new(user: object, friend: scope)
  end
end
