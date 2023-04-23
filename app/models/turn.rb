class Turn < ApplicationRecord
  SCORES = (1..8).to_a
  PARS = (2..5).to_a

  belongs_to :scorecard
  belongs_to :hole

  validates :scorecard, :hole, :par, presence: true
  validates :strokes, inclusion: { in: SCORES, allow_nil: true }
  validates :par, inclusion: PARS

  delegate :round, to: :scorecard

  scope :played, -> { where.not(strokes: nil) }

  def score
    strokes - par
  end

  def played?
    strokes.present?
  end

  def eagle?
    par - 2 == strokes
  end

  def birdie?
    par - 1 == strokes
  end

  def par?
    par == strokes
  end

  def bogey?
    par + 1 == strokes
  end

  def double_bogey_or_worse?
    par + 2 <= strokes
  end
end
