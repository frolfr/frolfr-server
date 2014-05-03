class HoleStats
  attr_reader :hole, :user

  def initialize(hole: hole, user: user)
    @hole = hole
    @user = user
  end

  def average_score
    return nil if turns_count.zero?
    turns.sum(:score) / turns_count.to_f
  end

  def average_par
    return nil if turns_count.zero?
    turns.sum(:par) / turns_count.to_f
  end

  def average_shooting
    average_score - average_par
  end

  private

  def turns_count
    turns.count
  end

  def turns
    hole.turns
      .joins(:scorecard)
      .where(scorecards: { user_id: user.id })
      .played
  end
end
