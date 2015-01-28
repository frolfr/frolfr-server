class PublicScorecardSerializer < ActiveModel::Serializer
  embed :ids, include: true
  has_one :user, serializer: PublicUserSerializer
  has_many :turns
  attributes :id, :round_id, :user_initials, :turn_ids

  def turns
    object.turns.includes(:hole).order('holes.number asc')
  end

  def user_initials
    names.map { |name| name.chars.first }.join
  end

  private

  def user
    object.user
  end

  def names
    [user.first_name, user.middle_name, user.last_name].compact
  end
end
