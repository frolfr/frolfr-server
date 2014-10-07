class RoundSerializer < ActiveModel::Serializer
  attributes :id, :course_name, :created_at, :marked_complete, :scorecard_ids

  def course_name
    object.course.name
  end

  def scorecard_ids
    object.scorecards.pluck(:id)
  end
end
