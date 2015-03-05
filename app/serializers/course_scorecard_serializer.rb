class CourseScorecardSerializer < ActiveModel::Serializer
  attributes :id, :total_score, :total_shooting, :created_at, :round_id, :is_completed

  def created_at
    object.round.created_at
  end

  def total_score
    object.score
  end

  def is_completed
    object.completed?
  end
end
