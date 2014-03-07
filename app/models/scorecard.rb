class Scorecard < ActiveRecord::Base
  belongs_to :user
  belongs_to :round
  has_many :scorecard_holes

  validates :user, :round, presence: true

  def for_hole(number)
    hole = round.holes.find_by(number: number)
    scorecard_holes.find_by(hole: hole) if hole
  end

  def over_par?
    total > current_par
  end

  def under_par?
    current_par > total
  end

  def at_par?
    total == current_par
  end

  def played_holes
    scorecard_holes.played
  end

  def total
    played_holes.pluck(:score).sum
  end

  def current_par
    played_holes.pluck(:par).sum
  end

  def shooting
    total - current_par
  end
end
