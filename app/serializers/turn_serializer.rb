class TurnSerializer < ActiveModel::Serializer
  attributes :id, :score, :par, :hole_number

  def hole_number
    object.hole.number
  end
end
