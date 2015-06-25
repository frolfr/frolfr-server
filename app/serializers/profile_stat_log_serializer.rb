class ProfileStatLogSerializer < ActiveModel::Serializer
  attributes :id, :courses_played, :scorecards_started, :completed_scorecards, :states_played,
    :top_played_course_name, :top_played_course_scorecards_started, :top_friend_name, :top_friend_rounds_count

  def id
    object.id
  end

  delegate :courses_played, :scorecards_started, :completed_scorecards, :states_played,
    :top_played_course_name, :top_played_course_scorecards_started, :top_friend_name, :top_friend_rounds_count, to: :stat_log

  private

  def stat_log
    @stat_log ||= ProfileStatLog.new(object)
  end
end
