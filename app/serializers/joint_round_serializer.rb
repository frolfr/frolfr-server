class JointRoundSerializer < ActiveModel::Serializer
  attributes :id, :course_name, :created_at

  def course_name
    object.course.name
  end
end
