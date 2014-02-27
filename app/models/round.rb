class Round < ActiveRecord::Base
  belongs_to :course
  has_many :scorecards
  has_many :players, through: :scorecards, source: :user

  validates :course, presence: true

  def holes
    course.holes
  end
end
