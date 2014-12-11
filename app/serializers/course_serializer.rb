class CourseSerializer < ActiveModel::Serializer
  embed :ids, include: true
  has_many :scorecards
  attributes :id, :city, :state, :country, :name, :status,
             :location, :rounds_played, :image_url,
             :hole_ids, :scorecard_ids

  def scorecard_ids
    object.scorecards.pluck(:id)
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
