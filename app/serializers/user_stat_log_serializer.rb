class UserStatLogSerializer < ActiveModel::Serializer
  attributes :id, :total_scorecards_played, :completed_scorecards_played, :courses_played,
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
end
