class HoleStatLog
  include ActiveModel::Serialization
  attr_reader :hole, :user
  attr_accessor :ranking

  def initialize(hole: hole, user: user)
    @hole = hole
    @user = user
  end

  delegate :id, :number, to: :hole

  def best_score
    played_turns.map(&:score).min
  end

  def worst_score
    played_turns.map(&:score).max
  end

  def average_strokes
    return nil if played_turns_count.zero?
    played_turns.sum(:strokes) / played_turns_count.to_f
  end

  def average_par
    return nil if played_turns_count.zero?
    played_turns.sum(:par) / played_turns_count.to_f
  end

  def average_score
    return nil if played_turns_count.zero?
    (average_strokes - average_par)
  end

  private

  def played_turns_count
    played_turns.count
  end

  def played_turns
    hole.turns
      .joins(:scorecard)
      .where(scorecards: { user_id: user.id })
      .played
  end
end
