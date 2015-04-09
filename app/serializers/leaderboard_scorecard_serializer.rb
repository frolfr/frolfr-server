class LeaderboardScorecardSerializer < ActiveModel::Serializer
  attributes :id, :total_strokes, :total_score, :created_at, :user_full_name

  def created_at
    object.round.created_at
  end

  def total_strokes
    object.strokes
  end

  def user_full_name
    [user.first_name, user.middle_name, user.last_name].join(" ")
  end

  private

  def user
    object.user
  end
end
