class RoundSerializer < ActiveModel::Serializer
  attributes :id, :course_name, :created_at, :marked_complete

  def course_name
    object.course.name
  end
end
