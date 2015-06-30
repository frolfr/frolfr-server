class RoundPolicy < ApplicationPolicy
  def destroy?
    record.unstarted? && record.user_playing?(user)
  end
end
