class User < ActiveRecord::Base
  has_many :scorecards

  validates :name, :email, presence: true
end
