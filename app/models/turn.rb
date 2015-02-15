class Turn < ActiveRecord::Base
  SCORES = (1..8).to_a
  PARS = (3..5).to_a

  belongs_to :scorecard
  belongs_to :hole

  validates :scorecard, :hole, :par, presence: true
  validates :score, inclusion: { in: SCORES, allow_nil: true }
  validates :par, inclusion: PARS

  delegate :round, to: :scorecard

  def played?
    score.present?
  end

  def eagle?
    par - 2 == score
  end

  def birdie?
    par - 1 == score
  end

  def par?
    par == score
  end

  def bogey?
    par + 1 == score
  end

  def double_bogey_or_worse?
    par + 2 <= score
  end
end
