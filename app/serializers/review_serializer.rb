class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :post, :rating, :user_id, :course_id,
             :created_at, :can_update

  def can_update
    object.user == scope
  end
end
