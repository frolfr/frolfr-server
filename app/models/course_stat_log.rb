class CourseStatLog
  attr_reader :user, :course, :scorecards, :completed_scorecards

  def initialize(user:, course:)
    @user = user
    @course = course
    @scorecards = user.scorecards_for_course(course)
    @completed_scorecards = scorecards.select(&:completed?)
  end

  def total_eagles
    played_turns.select(&:eagle?).count
  end

  def total_birdies
    played_turns.select(&:birdie?).count
  end

  def total_pars
    played_turns.select(&:par?).count
  end

  def total_bogeys
    played_turns.select(&:bogey?).count
  end

  def total_doubles_or_worse
    played_turns.select(&:double_bogey_or_worse?).count
  end

  def total_scorecards_played
    scorecards.count
  end

  def completed_scorecards_played
    completed_scorecards.count
  end

  def average_strokes
    unless strokes.count.zero?
      strokes.sum.to_f / strokes.count
    end
  end

  def best_strokes
    strokes.min
  end

  def average_score
    unless scores.count.zero?
      scores.sum.to_f / scores.count
    end
  end

  def best_score
    scores.min
  end

  private
  attr_reader :turns, :played_turns

  def turns
    @turns ||= scorecards.flat_map(&:turns)
  end

  def played_turns
    @played_turns ||= turns.select(&:played?)
  end

  def scores
    completed_scorecards.map(&:total_score)
  end

  def strokes
    completed_scorecards.map(&:strokes)
  end
end
