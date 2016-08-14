class ScorecardPolicy < ApplicationPolicy
  def create?
    round.user_playing?(user) && !scorecard_user_playing_round?
  end

  private

  def scorecard_user_playing_round?
    round.user_playing?(record.user)
  end

  def round
    @round ||= record.round
  end
end
