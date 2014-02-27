class ScorecardHole < ActiveRecord::Base
  belongs_to :hole_position
  belongs_to :user

  validates :user, :hole_position, presence: true
end
