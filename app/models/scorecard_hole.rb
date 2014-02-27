class ScorecardHole < ActiveRecord::Base
  belongs_to :hole
  belongs_to :user

  validates :user, :hole, presence: true
end
