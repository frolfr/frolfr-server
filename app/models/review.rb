class Review < ActiveRecord::Base
  RATINGS = (1..10).to_a
  belongs_to :user
  belongs_to :course

  validates :post, :rating, :user, :course, presence: true
  validates :rating, inclusion: RATINGS
  validates :user, uniqueness: { scope: :course }
end
