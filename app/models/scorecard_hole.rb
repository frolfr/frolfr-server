class ScorecardHole < ActiveRecord::Base
  belongs_to :scorecard
  belongs_to :hole

  validates :scorecard, :hole, :par, presence: true
  validates :score, inclusion: (1..8).to_a << nil
  validates :par, inclusion: (3..5).to_a
end
