class Round < ActiveRecord::Base
  belongs_to :course
  has_many :scorecards
  has_many :players, through: :scorecards, source: :user

  validates :course, :completed, presence: true

  def holes
    course.holes
  end

  def completed?
    completed || scorecards.all?(&:completed?)
  end
end
