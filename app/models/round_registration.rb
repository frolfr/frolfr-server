class RoundRegistration
  attr_accessor(
    :users,
    :course,
    :round,
    :scorecards,
    :scorecard_holes
  )

  def self.create_round(course: course, users: users)
    new(course: course, users: users).create_round
  end

  def initialize(course: course, users: users)
    @course = course
    @users = users
  end

  def create_round
    scorecards.each do |scorecard|
      create_scorecard_holes(scorecard)
    end
    return round
  end

  private

  def create_scorecard_holes(scorecard)
    course.holes.each do |hole|
      ScorecardHole.create(hole: hole, scorecard: scorecard)
    end
  end

  def round
    @round ||= Round.create!(course: course)
  end

  def scorecards
    @scorecards ||= users.map do |user|
      Scorecard.create!(user: user, round: round)
    end
  end
end
