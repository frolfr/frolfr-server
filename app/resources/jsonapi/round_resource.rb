class Jsonapi::RoundResource < JSONAPI::Resource
  attributes :created_at

  has_one :course
  has_many :scorecards

  def self.apply_sort(records, order_options, context = {})
    records.by_date
  end
end
