class Scorecard < ActiveRecord::Base
  # OPTIMIZE: This can be a PORO
  belongs_to :user
  belongs_to :round
  has_many :turns, dependent: :destroy

  validates :user, :round, presence: true
  # TODO: validate that scorecard has as many turns as a course has holes

  scope :by_date, -> { joins(:round).order('rounds.created_at DESC') }
  scope :completed, -> { select { |scorecard| scorecard.completed? } }
  scope :by_shooting, -> { all.sort_by(&:shooting) }

  def course
    round.course
  end

  def completed?
    turns.all?(&:played?)
  end

  def incomplete?
    !completed?
  end

  def first_turn
    turns.first
  end

  def turn_for_hole(number)
    hole = round.holes.find_by(number: number)
    turns.find_by(hole: hole) if hole
  end

  def over_par?
    total > current_par
  end

  def under_par?
    current_par > total
  end

  def at_par?
    total == current_par
  end

  def total
    played_turns.pluck(:score).sum
  end

  def current_par
    played_turns.pluck(:par).sum
  end

  def shooting
    total - current_par
  end

  private

  def played_turns
    turns.played
  end
end
