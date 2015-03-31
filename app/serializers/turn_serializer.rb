class TurnSerializer < ActiveModel::Serializer
  attributes :id, :score, :par, :hole_number, :scorecard_id, :hole_id

  def hole_number
    object.hole.number
  end

  def hole_id
    object.hole.id
  end
end
