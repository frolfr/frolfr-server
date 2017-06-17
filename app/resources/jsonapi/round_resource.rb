class Jsonapi::RoundResource < JSONAPI::Resource
  attributes :created_at

  has_one :course
  has_many :scorecards
  has_many :users

  after_create do
    course = @model.course
    scorecards = @model.scorecards

    scorecards.each do |scorecard|
      course.holes.each do |hole|
        Turn.create(hole: hole, scorecard: scorecard, par: hole.par)
      end
    end
  end

  def self.apply_sort(records, order_options, context = {})
    records.by_date
  end
end
