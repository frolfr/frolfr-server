class HoleStatLog
  attr_reader :hole, :user
  attr_accessor :ranking

  def initialize(hole: hole, user: user)
    @hole = hole
    @user = user
  end


  def best_shooting
    played_turns.map(&:shooting).min
  end

  def worst_shooting
    played_turns.map(&:shooting).max
  end

  def average_score
    return nil if played_turns_count.zero?
    played_turns.sum(:score) / played_turns_count.to_f
  end

  def average_par
    return nil if played_turns_count.zero?
    played_turns.sum(:par) / played_turns_count.to_f
  end

  def average_shooting
    return nil if played_turns_count.zero?
    (average_score - average_par)
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
