class CourseSerializer < ActiveModel::Serializer
  attributes :id, :city, :state, :country, :name, :status, :location, :rounds_played, :image_url

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
