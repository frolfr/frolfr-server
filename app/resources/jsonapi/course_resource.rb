class Jsonapi::CourseResource < JSONAPI::Resource
  attributes :city, :state, :country, :name

  has_many :rounds

  filter :name, apply: ->(records, value, _options) {
    filtered_record_ids = records.select do |course|
      course.name.downcase.include? value[0].downcase
    end.map(&:id)

    Course.where(id: filtered_record_ids).by_name
  }

  filter :location, apply: ->(records, value, _options) {
    current_location = CurrentLocation.new(
      distance_in_miles: 100,
      latitude: value[0],
      longitude: value[1]
    )
    course_ids = current_location.nearby_courses.first(3).map(&:id)

    Course.where(id: course_ids).by_name
  }
end
