class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :post, :rating
end
