class CourseStatLog
  attr_reader :user, :course, :scorecards, :completed_scorecards

  def initialize(user: user, course: course)
    @user = user
    @course = course
    @scorecards = user.scorecards_for_course(course)
    @completed_scorecards = scorecards.select(&:completed?)
  end

  def total_scorecards_played
    scorecards.count
  end

  def completed_scorecards_played
    completed_scorecards.count
  end

  def average_score_on_completed_scorecards
    scores.sum / scores.count
  end

  def best_score_on_completed_scorecards
    scores.min
  end

  private

  def scores
    completed_scorecards.map(&:score)
  end
end
