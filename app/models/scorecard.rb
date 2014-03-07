class Scorecard < ActiveRecord::Base
  belongs_to :user
  belongs_to :round
  has_many :scorecard_holes

  validates :user, :round, presence: true

  def for_hole(number)
    hole = round.holes.find_by(number: number)
    scorecard_holes.find_by(hole: hole) if hole
  end

  def total
    played_holes = scorecard_holes.pluck(:score).reject(&:nil?)
    played_holes.sum
  end
end
