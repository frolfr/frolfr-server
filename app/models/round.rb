class Round < ActiveRecord::Base
  belongs_to :course
  has_many :scorecards

  validates :course, presence: true
end
