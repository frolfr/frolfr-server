class TurnSerializer < ActiveModel::Serializer
  attributes :id, :strokes, :par, :hole_number, :scorecard_id, :hole_id
end
