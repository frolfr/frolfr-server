class Jsonapi::CourseResource < JSONAPI::Resource
  attributes :country, :city, :holes_count, :name, :state
  has_one :submitter, class_name: 'User'

  has_many :rounds

  filter :name, apply: lambda { |records, value, _options|
    filtered_record_ids = records.select do |course|
      course.name.downcase.include? value[0].downcase
    end.map(&:id)

    Course.where(id: filtered_record_ids).by_name
  }

  filter :location, apply: lambda { |_records, value, _options|
    current_location = CurrentLocation.new(
      distance_in_miles: 100,
      latitude: value[0],
      longitude: value[1]
    )
    course_ids = current_location.nearby_courses.first(3).map(&:id)

    Course.where(id: course_ids).by_name
  }

  def hole_count=(value)
    1.upto(value) do |number|
      @model.holes.build(number: number)
    end
  end

  def self.updatable_fields(_)
    super - [:holes_count]
  end

  def self.creatable_fields(_)
    super - [:holes_count]
  end
end
