class Friendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, class_name: "User"

  validates :user, :friend, presence: true
  validates_uniqueness_of :user, scope: :friend
  validates_uniqueness_of :friend, scope: :user
  validate :cannot_add_self

  def self.create_friendship(user: nil, friend: nil)
    friendship1 = new(user: user, friend: friend)
    friendship2 = new(user: friend, friend: user)
    friendship1.save && friendship2.save
  end

  private

  def cannot_add_self
    errors.add(:friend_id, I18n.t('errors.friend_id')) if user_id == friend_id
  end
end
