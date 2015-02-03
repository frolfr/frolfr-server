class Scorecard < ActiveRecord::Base
  # OPTIMIZE: This can be a PORO
  belongs_to :user
  belongs_to :round
  has_many :turns, dependent: :destroy

  validates :user, :round, presence: true
  # TODO: validate that scorecard has as many turns as a course has holes

  scope :by_date, -> { joins(:round).order('rounds.created_at DESC') }

  delegate :course, to: :round

  def score
    turns.sum(:score)
  end

  def completed?
    turns.all? { |turn| turn.score.present? }
  end

  def incomplete?
    !completed?
  end
end
