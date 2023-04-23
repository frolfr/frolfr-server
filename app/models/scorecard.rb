class Scorecard < ApplicationRecord
  # OPTIMIZE: This can be a PORO
  belongs_to :user
  belongs_to :round
  has_many :turns, dependent: :destroy

  validates :user, :round, presence: true
  # TODO: validate that scorecard has as many turns as a course has holes

  scope :by_date, -> { joins(:round).order('rounds.created_at DESC') }
  scope :for_course, ->(course) { joins(:round).where(rounds: { course_id: course.id })}

  delegate :course, to: :round

  def rating
    if ratable?
      difference = course.rating - strokes
      1000 + (difference * 10)
    end
  end

  def strokes
    played_turns.sum(:strokes)
  end

  def par
    played_turns.sum(:par)
  end

  def total_score
    strokes - par
  end

  def completed?
    turns.all? { |turn| turn.strokes.present? }
  end

  def incomplete?
    !completed?
  end

  def started?
    turns.any? { |turn| turn.strokes.present? }
  end

  private

  def ratable?
    completed? && course.rated?
  end

  def played_turns
    turns.where.not(strokes: nil)
  end
end
