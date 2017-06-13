class Jsonapi::CourseResource < JSONAPI::Resource
  attributes :city, :state, :country, :name, :hole_count

  has_many :rounds

  filter :name, apply: ->(records, value, _options) {
    filtered_record_ids = records.select do |course|
      course.name.downcase.include? value[0].downcase
    end.map(&:id)

    Course.where(id: filtered_record_ids).by_name
  }
end
