class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :post, :rating, :user_id, :course_id,
             :created_at
end
