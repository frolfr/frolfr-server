class HoleSerializer < ActiveModel::Serializer
  attributes :id, :number, :turn_ids

  def turn_ids
    object.turns.pluck(:id)  
  end
end
