class HoleStatLogSerializer < ActiveModel::Serializer
  attributes :id, :best_score, :worst_score, :number,
    :average_strokes, :average_par, :average_score, :ranking
end
