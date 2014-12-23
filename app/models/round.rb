class Round < ActiveRecord::Base
  belongs_to :course
  has_many :scorecards, dependent: :destroy

  validates :course, presence: true
  # TODO: validate that the round has at least one scorecard

  scope :by_date, -> { order('created_at DESC') }

  delegate :holes, to: :course

  def turns_for_hole(hole)
    Turn.where(scorecard: scorecards, hole: hole).order(:scorecard_id)
    # TODO: Consider a more intelligent way to consistently order turns
  end
end
