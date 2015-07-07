class CurrentLocation
  attr_reader :latitude, :longitude, :distance_in_miles

  def initialize(latitude:, longitude:, distance_in_miles: 25)
    @latitude = latitude
    @longitude = longitude
    @distance_in_miles = distance_in_miles
  end

  def nearest_course
    Course.near([latitude, longitude], distance_in_miles)
  end
end
