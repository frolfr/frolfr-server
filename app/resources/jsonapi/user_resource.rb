class Jsonapi::UserResource < JSONAPI::Resource
  attributes :avatar_url, :email, :first_name, :last_name,
     :middle_name, :password
  has_many :scorecards

  filter :id_not, apply: ->(records, value, _options) {
    # TODO: Is there a way to filter without this?
    records.where.not(id: value)
  }
  filter :name, apply: ->(records, value, _options) {
    # TODO: this can be cleaned up
    filtered_record_ids = records.select do |user|
      user.full_name.downcase.include? value[0].downcase
    end.map(&:id)

    records.where(id: filtered_record_ids)
  }

  def self.apply_sort(records, order_options, context = {})
    records.by_name
  end

  def fetchable_fields
    super - [:password]
  end
end
