class ScorecardHole < ActiveRecord::Base
  belongs_to :scorecard
  belongs_to :hole

  validates :score, inclusion: { in: (1..9).to_a << nil }
  validates :scorecard, :hole, :par, presence: true
end
