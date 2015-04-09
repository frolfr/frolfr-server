class CourseSerializer < ActiveModel::Serializer
  attributes :id, :city, :state, :country, :name, :status,
             :location, :photo_ids, :last_played_at,
             :hole_ids, :scorecard_ids, :hole_count,
             :review_ids

  def last_played_at
    user_scorecards.map do |scorecard|
      scorecard.round.created_at
    end.sort.last
  end

  def scorecard_ids
    object.scorecards.pluck(:id)
  end

  def hole_ids
    object.holes.pluck(:id)
  end

  def review_ids
    object.reviews.pluck(:id)
  end

  def photo_ids
    object.photos.pluck(:id)
  end

  def location
    "#{city}, #{state}"
  end

  private

  def user_scorecards
    scope.scorecards_for_course(object)
  end
end
