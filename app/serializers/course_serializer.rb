class CourseSerializer < ActiveModel::Serializer
  attributes :id, :city, :state, :country, :name, :status, :location, :rounds_played, :image_url, :round_ids, :hole_ids

  def round_ids
    object.rounds.pluck(:id)
  end

  def hole_ids
    object.holes.pluck(:id)
  end

  def location
    "#{city}, #{state}"
  end

  def rounds_played
    user_scorecards.count
  end

  private

  def user_scorecards
    scope.scorecards_for_course(object)
  end
end
