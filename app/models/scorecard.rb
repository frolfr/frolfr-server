class Scorecard < ActiveRecord::Base
  # OPTIMIZE: This can be a PORO
  belongs_to :user
  belongs_to :round
  has_many :turns, dependent: :destroy

  validates :user, :round, presence: true
  # TODO: validate that scorecard has as many turns as a course has holes

  scope :by_date, -> { joins(:round).order('rounds.created_at DESC') }
  scope :for_course, ->(course) { joins(:round).where(rounds: { course_id: course.id })}

  delegate :course, to: :round

  def score
    played_turns.sum(:score)
  end

  def total_par
    played_turns.sum(:par)
  end

  def total_shooting
    score - total_par
  end

  def completed?
    turns.all? { |turn| turn.score.present? }
  end

  def incomplete?
    !completed?
  end

  def started?
    turns.any? { |turn| turn.score.present? }
  end

  private

  def played_turns
    turns.where.not(score: nil)
  end
end
