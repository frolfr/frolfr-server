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
    scorecard_holes.find_by(hole: hole)
  end
end
