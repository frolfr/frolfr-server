class UserStatLogSerializer < ActiveModel::Serializer
  attributes :id, :total_scorecards_played, :completed_scorecards_played, :courses_played,
    :total_rounds_with_user, :rounds_won, :rounds_lost, :rounds_tied, :rounds_incomplete, :first_name
  attr_reader :current_user, :rounds_with_user, :winning_rounds, :losing_rounds, :tied_rounds, :incomplete_rounds

  def self.serialize_stats(user, current_user)
    new(user, current_user).tap do |serializer|
      serializer.serialize_stats
    end
  end

  def initialize(user, current_user)
    @current_user = current_user
    @winning_rounds, @losing_rounds, @tied_rounds, @incomplete_rounds = 4.times.map { [] }

    super(user)
  end

  def id
    object.id
  end

  def first_name
    object.first_name
  end

  def total_scorecards_played
    object.scorecards.count
  end

  def completed_scorecards_played
    object.completed_scorecards.count
  end

  def courses_played
    object.courses_played.count
  end

  def total_rounds_with_user
    rounds_with_user.count
  end

  def rounds_lost
    losing_rounds.count
  end

  def rounds_won
    winning_rounds.count
  end

  def rounds_tied
    tied_rounds.count
  end

  def rounds_incomplete
    incomplete_rounds.count
  end

  def rounds_with_user
    @rounds_with_user ||= object.rounds_with_user(current_user)
  end

  def serialize_stats
    rounds_with_user.each do |round|
      scorecards = round.scorecards
      user_scorecard = scorecards.find_by(user_id: object.id)
      current_user_scorecard = scorecards.find_by(user_id: current_user.id)

      case
      when user_scorecard.incomplete? || current_user_scorecard.incomplete?
        @incomplete_rounds << round
      when user_scorecard.score > current_user_scorecard.score
        @winning_rounds << round
      when user_scorecard.score < current_user_scorecard.score
        @losing_rounds << round
      else
        @tied_rounds << round
      end
    end
  end
end
