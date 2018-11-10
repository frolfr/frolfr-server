class Jsonapi::RoundResource < JSONAPI::Resource
  attributes :created_at

  has_one :course
  has_many :scorecards
  has_many :users

  filter :user_id, apply: ->(records, value, _options) {
    records.joins(:scorecards).where(scorecards: { user_id: value.first })
  }

  filter :course_id, apply: ->(records, value, _options) {
    records.where(course_id: value.first)
  }

  after_create do
    course = @model.course
    scorecards = @model.scorecards

    scorecards.each do |scorecard|
      course.holes.each do |hole|
        Turn.create!(hole: hole, scorecard: scorecard, par: hole.par, hole_number: hole.number)
      end
    end
  end

  def self.apply_sort(records, order_options, context = {})
    records.by_date
  end
end
