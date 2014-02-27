class ScorecardHole < ActiveRecord::Base
  belongs_to :hole_position
  belongs_to :scorecard

  validates :scorecard, :hole_position, presence: true
  validates :score, inclusion: { in: (1..9).to_a << nil }
end
