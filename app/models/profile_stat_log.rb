class ProfileStatLog
  attr_reader :user, :courses

  def initialize(user)
    @user = user
    @courses = user.courses_played
  end

  def courses_played
    courses.count
  end

  def scorecards_started
    user.scorecards.count
  end

  def completed_scorecards
    user.completed_scorecards.count
  end

  def states_played
    courses.uniq(&:state).count
  end

  def top_played_course_name
    top_played_course_data.first.name
  end

  def top_played_course_scorecards_started
    top_played_course_data.count
  end

  def top_friend_name
    top_friend_data.first.full_name
  end

  def top_friend_rounds_count
    top_friend_data.count
  end

  def top_played_course_data
    @top_played_course ||= user
      .rounds
      .map(&:course)
      .group_by(&:itself)
      .values
      .max_by(&:size)
  end

  def top_friend_data
    @top_friend_data ||= user
      .rounds
      .flat_map {|round| round.scorecards.where.not(user_id: user.id) }
      .map(&:user)
      .group_by(&:itself)
      .values
      .max_by(&:size)
  end
end
