class Friendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, class_name: "User"

  validates :user, :friend, presence: true
  validates_uniqueness_of :user, scope: :friend
  validates_uniqueness_of :friend, scope: :user

  def self.create_friendship(user: nil, friend: nil)
    create(user: user, friend: friend)
    create(user: friend, friend: user)
  end
end
