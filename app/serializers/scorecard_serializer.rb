class ScorecardSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :round_id, :user_initials

  def user_initials
    names.map {|name| name.chars.first }.join
  end

  private

  def user
    object.user
  end

  def names
    [user.first_name, user.middle_name, user.last_name].compact
  end
end
