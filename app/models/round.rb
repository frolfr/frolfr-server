class Round < ActiveRecord::Base
  belongs_to :course
  has_many :scorecards

  validates :course, presence: true

  default_scope { order('created_at DESC') }

  def holes
    course.holes
  end

  def completed?
    marked_complete? || scorecards.all?(&:completed?)
  end

  def complete
    update(marked_complete: true)
  end
end
