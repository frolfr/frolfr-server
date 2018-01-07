class Round < ActiveRecord::Base
  belongs_to :course
  has_many :scorecards, dependent: :destroy
  has_many :users, through: :scorecards
  has_many :photos, as: :photoable

  validates :course, presence: true
  # TODO: validate that the round has at least one scorecard

  scope :by_date, -> { order('rounds.created_at DESC') }

  delegate :holes, to: :course

  def user_playing?(user)
    scorecards.any? { |scorecard| scorecard.user == user }
  end

  def incomplete?
    scorecards.any?(&:incomplete?)
  end

  def created_today?
    created_at > DateTime.current.beginning_of_day
  end

  def turns_for_hole(hole)
    Turn.where(scorecard: scorecards, hole: hole).order(:scorecard_id)
    # TODO: Consider a more intelligent way to consistently order turns
  end

  def unstarted?
    scorecards.none?(&:started?)
  end
end
