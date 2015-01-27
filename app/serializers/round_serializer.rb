class RoundSerializer < ActiveModel::Serializer
  embed :ids, include: true
  has_many :scorecards
  attributes :id, :course_name, :created_at,
    :scorecard_ids, :course_id, :hole_count, :public_recap

  def hole_count
    object.course.hole_count
  end

  def course_name
    object.course.name
  end

  def course_id
    object.course.id
  end

  def scorecard_ids
    object.scorecards.pluck(:id)
  end
end
