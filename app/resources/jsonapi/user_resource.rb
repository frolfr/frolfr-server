class Jsonapi::UserResource < JSONAPI::Resource
  attributes :email, :first_name, :middle_name, :last_name, :avatar_url

  filter :name, apply: ->(records, value, _options) {
    # TODO: this can be cleaned up
    filtered_record_ids = records.select do |user|
      user.full_name.downcase.include? value[0]
    end.map(&:id)

    filtered_records = User.where(id: filtered_record_ids)
  }
end
