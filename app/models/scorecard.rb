class Scorecard < ActiveRecord::Base
  belongs_to :user
  belongs_to :round
  has_many :scorecard_holes

  validates :user, :round, presence: true

  def total
    played_holes = scorecard_holes.pluck(:score).reject(&:nil?)
    played_holes.sum
  end

  def for_hole(hole)
    hole_position = hole.hole_positions.first
    scorecard_holes.find_by(hole_position: hole_position)
  end
end
