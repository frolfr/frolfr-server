class HoleStatLogSerializer < ActiveModel::Serializer
  attributes :id, :best_shooting, :worst_shooting, :number,
    :average_score, :average_par, :average_shooting, :ranking
end
