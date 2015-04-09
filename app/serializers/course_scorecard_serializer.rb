class CourseScorecardSerializer < ActiveModel::Serializer
  attributes :id, :total_strokes, :total_score, :created_at, :round_id, :is_completed

  def created_at
    object.round.created_at
  end

  def total_strokes
    object.strokes
  end

  def is_completed
    object.completed?
  end
end
