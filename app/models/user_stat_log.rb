class UserStatLog
  attr_reader :user, :friend, :rounds_with_user

  def initialize(user:, friend:)
    @user = user
    @friend = friend
    @rounds_won = []
    @rounds_lost = []
    @rounds_tied = []
    @incomplete_rounds = []
    @rounds_with_user = user.rounds_with_user(friend)
    serialize_stats
  end

  def total_rounds_with_user
    rounds_with_user.count
  end

  def total_rounds_lost
    @rounds_lost.count
  end

  def total_rounds_won
    @rounds_won.count
  end

  def total_rounds_tied
    @rounds_tied.count
  end

  def total_incomplete_rounds
    @incomplete_rounds.count
  end

  def serialize_stats
    rounds_with_user.select do |round|
      scorecards = round.scorecards
      user_scorecard = scorecards.find_by(user_id: user.id)
      friend_scorecard = scorecards.find_by(user_id: friend.id)

      case
      when user_scorecard.incomplete? || friend_scorecard.incomplete?
        @incomplete_rounds << round
      when user_scorecard.strokes > friend_scorecard.strokes
        @rounds_won << round
      when user_scorecard.strokes < friend_scorecard.strokes
        @rounds_lost << round
      else
        @rounds_tied << round
      end
    end
  end
end
