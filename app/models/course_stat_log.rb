class CourseStatLog
  attr_reader :user, :course, :scorecards, :completed_scorecards

  def initialize(user: user, course: course)
    @user = user
    @course = course
    @scorecards = user.scorecards_for_course(course)
    @completed_scorecards = scorecards.select(&:completed?)
  end
end
