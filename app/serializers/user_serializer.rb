class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :first_name, :middle_name,
             :last_name, :scorecard_ids, :avatar_url,
             :review_ids

  def review_ids
    object.reviews.pluck(:id)
  end
end
