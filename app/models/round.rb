class Round < ActiveRecord::Base
  belongs_to :course
  has_many :scorecards, dependent: :destroy

  validates :course, presence: true

  scope :by_date, -> { order('created_at DESC') }

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
