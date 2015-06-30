class TurnPolicy < ApplicationPolicy
  def update?
    round.user_playing?(user)
  end

  private

  def round
    @round ||= record.round
  end
end
