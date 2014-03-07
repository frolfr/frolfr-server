class ScorecardHole < ActiveRecord::Base
  SCORES = (1..8).to_a
  PARS = (3..5).to_a

  belongs_to :scorecard
  belongs_to :hole

  validates :scorecard, :hole, :par, presence: true
  validates :score, inclusion: { in: SCORES, allow_nil: true }
  validates :par, inclusion: PARS

  scope :played, -> { where.not(score: nil) } 

  def next
    next_number = hole.number + 1
    scorecard.for_hole(next_number)
  end

  def previous
    previous_number = hole.number - 1
    scorecard.for_hole(previous_number)
  end

  def round
    scorecard.round
  end
end
