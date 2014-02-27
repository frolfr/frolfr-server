class Scorecard < ActiveRecord::Base
  belongs_to :user
  belongs_to :round
  has_many :scorecard_holes

  validates :user, :round, presense: true

  def total
    scorecard_holes.pluck(:score).sum
  end
end
